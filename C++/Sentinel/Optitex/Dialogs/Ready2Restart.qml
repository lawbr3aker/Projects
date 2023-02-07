import QtQuick 2.0
import QtQml.Models 2.15
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars
import Optitex.Sentinel 1.0

Components.MainWindow {
    BackEnd {
        id: backend
    }

    id: window
    fixed: true
    width: 720
    height: 450
    navbar.backButton.visible: false
    navbar.nextButton.visible: false
    navbar.cancelButton.text: Languages.fromString(
                                  language,
                                  Languages.Ready2RestartDialogFinishButtonText)
    content: Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Item {
            id: container
            x: 50
            y: 20
            width: parent.width - (x * 2)
            height: parent.height - (y)
            Components.Descs {
                title.visible: false
                desc.x: Vars.DescLeftSpace
                desc.text: Languages.fromString(
                               window.language,
                               Languages.Ready2RestartDialogLongDesc)
                desc.font.pixelSize: Vars.MainWindowsDescFontSize
                desc.width: container.width
            }
            Item {
                anchors.bottom: container.bottom
                height: restartChoiceContainer.height
                x: container.width / 3
                ColumnLayout {
                    id: restartChoiceContainer
                    spacing: 0
                    Constants.Label {
                        text: "Do you want to restart..."
                    }
                    Components.ClassicRadioButton {
                        id: radioButtons
                        height: 80
                        model: ListModel {
                            Component.onCompleted: {
                                append({
                                           "name": Languages.fromString(
                                                       window.language,
                                                       Languages.Ready2RestartDialogRestartNowText),
                                           "isChecked": true
                                       })
                                append({
                                           "name": Languages.fromString(
                                                       window.language,
                                                       Languages.Ready2RestartDialogRestartLaterText)
                                       })
                            }
                        }
                    }
                }
            }
        }
    }
    leftBannerContainer.visible: false
    topBanner: Constants.TopBanner {
        title.text: Languages.fromString(window.language,
                                         Languages.Ready2RestartDialogTitle)
        desc.text: Languages.fromString(window.language,
                                        Languages.Ready2RestartDialogDesc)
    }
    navbar.cancelButton.onClicked: {
        if (radioButtons.checked == 0) {
            backend.restartNow()
        }
        Qt.quit()
    }
}
