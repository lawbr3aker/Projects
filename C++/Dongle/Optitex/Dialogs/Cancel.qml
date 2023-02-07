import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Constants/Vars.js" as Vars

Dialogs.Message {
    id: window
    width: 330
    height: 100

    navbar.backButton.visible: false
    navbar.nextButton.text: Languages.fromString(
                                window.language,
                                Languages.CancelDialogNextButtonText)
    navbar.cancelButton.text: Languages.fromString(
                                  window.language,
                                  Languages.CancelDialogCancelButtonText)
    navbar.nextButton.onClicked: Qt.quit()

    navbar.cancelButton.onClicked: window.hide()
    icon.visible: false
    msgContent: Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
        Constants.Label {
            id: message
            anchors.centerIn: parent
            wrapMode: Text.WordWrap
            text: Languages.fromString(window.language,
                                       Languages.CancelDialogText)
        }
    }
    onClosing: navbar.cancelButton.clicked()
    modality: Qt.WindowModal
}
