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
        width: Vars.PasswordErrorMessageWidth
        parentWindow: window
        language: window.language
        navbar.backButton.visible: false
        navbar.nextButton.visible: false
        navbar.cancelButton.text: Languages.fromString(
                                      language,
                                      Languages.MessageErrorOkButtonText)
        navbar.cancelButton.onClicked: hide()

        id: passwordError
        msgContent: Constants.Label {
            text: Languages.fromString(language,
                                       Languages.MessageErrorDialogText)
        }
        icon.visible: true
        visible: false
        Component.onCompleted: {
            icon.image.source = "qrc:/Optitex/Assets/Images/DialogError.png"
        }
    }

    navbar.backButton.onClicked: {
        parentWindow.show()
        window.hide()
    }
    navbar.cancelButton.onClicked: cancelDialog.show()

    content: Components.LabelFor {
        text: Languages.fromString(window.language,
                                   Languages.PasswordEntryLabelText)
        space: 10
        contentItem: Components.TextEntry {

            id: password
            Layout.alignment: Qt.AlignCenter
            width: Vars.EntriesWidth
            echoMode: TextInput.Password
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
