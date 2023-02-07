import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.15
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.MainWindow {
    id: window
    fixed: true
    height: Vars.WindowsHeight + 50
    width: Vars.WindowsWidth

    navbar.backButton.visible: false
    navbar.nextButton.visible: false
    navbar.cancelButton.text: Languages.fromString(
                                  language,
                                  Languages.SuccessInstallationDialogFinishButtonText)
    navbar.cancelButton.onClicked: Qt.quit()
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
                desc.text: Languages.fromString(
                               window.language,
                               Languages.SuccessInstallationDialogLongDesc)
                desc.width: container.width - ((parent.x + x) * 2)
                desc.font.pixelSize: Vars.MainWindowsDescFontSize
            }
        }
    }
    topBanner: Constants.TopBanner {
        title.text: Languages.fromString(
                        window.language,
                        Languages.SuccessInstallationDialogTitle)
        desc.text: Languages.fromString(window.language,
                                        Languages.SuccessInstallationDialogDesc)
    }
}
