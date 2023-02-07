import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.MainWindow {
    id: window
    required property Dialogs.Ready2Install nextDialog
    fixed: true
    height: Vars.WindowsHeight
    width: Vars.WindowsWidth

    Dialogs.Message {
        id: passwordError
        visible: false
        width: Vars.PasswordErrorMessageWidth

        navbar.backButton.visible: false
        navbar.nextButton.visible: false
        navbar.cancelButton.text: Languages.fromString(
                                      window.language,
                                      Languages.CancelDialogCancelButtonText)
        navbar.cancelButton.onClicked: hide()

        msgContent: Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Constants.Label {
                id: message
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
                width: passwordError.width - passwordError.icon.width
                text: Languages.fromString(window.language,
                                           Languages.CancelDialogText)
            }
        }
        onClosing: navbar.cancelButton.clicked()
        modality: Qt.WindowModal
        Component.onCompleted: {
            icon.visible = true
            icon.image.source = "qrc:/Optitex/Assets/Images/DialogError.png"
        }
    }

    navbar.backButton.onClicked: {
        parentWindow.show()
        window.hide()
    }
    navbar.cancelButton.onClicked: cancelDialog.show()

    content: Components.LabelFor {
        id: passEntry
        text: Languages.fromString(window.language,
                                   Languages.PasswordEntryLabelText)
        width: parent.width
        space: 10
        contentItem: Components.TextEntry {
            id: password
            width: Vars.EntriesWidth
            echoMode: TextInput.Password
        }
        Component.onCompleted: {
            console.log(parent.implicitWidth, passEntry.parent.parent.width)
        }
    }
    onVisibleChanged: {
        if (!visible)
            password.text = ""
    }

    navbar.nextButton.onClicked: {
        var temp = password.text.toString()
        password.text = ""
        if (Qt.md5(Qt.md5(temp)) == "ca5806e9c83e275e203d49ae576370c6") {
            nextDialog.parentWindow = parentWindow
            nextDialog.show()
            hide()
        } else
            passwordError.show()
    }
    leftBannerContainer.visible: false
    topBanner: Constants.TopBanner {
        title.text: Languages.fromString(window.language,
                                         Languages.EnterPasswordDialogTitle)
        desc.text: Languages.fromString(window.language,
                                        Languages.EnterPasswordDialogDesc)
    }
}
