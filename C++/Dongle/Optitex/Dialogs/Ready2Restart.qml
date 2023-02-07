import QtQuick 2.0
import QtQml.Models 2.15
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars
import Optitex.Dongle 1.0

Components.MainWindow {
    BackEnd {
        id: backend
        language: window.language
    }

    id: window
    fixed: true
    width: Vars.MainWindowsWidth
    height: Vars.MainWindowsHeight
    navbar.backButton.visible: false
    navbar.nextButton.visible: false
    navbar.cancelButton.text: Languages.fromString(
                                  language,
                                  Languages.Ready2RestartDialogFinishButtonText)
    content: Item {
        y: 20
        id: container
        width: parent.width
        ColumnLayout {
            x: 30
            spacing: 100
            Components.Descs {
                title.visible: false
                desc.x: Vars.DescLeftSpace
                desc.text: Languages.fromString(window.language,
                                                Languages.Ready2RestartDialogLongDesc)
                desc.width: container.width - ((parent.x + x) * 2)
                desc.font.pixelSize: Vars.MainWindowsDescFontSize
            }
            Components.ClassicRadioButton {
                id: radioButtons
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
    onVisibilityChanged: if (visible) backend.install()
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
