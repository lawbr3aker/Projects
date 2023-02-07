import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.MainWindow {
    id: window
    fixed: true
    height: Vars.MainWindowsHeight
    width: Vars.MainWindowsWidth
    navbar.backButton.text: Languages.fromString(window.language,
                                                 Languages.BackButtonText)
    navbar.nextButton.text: Languages.fromString(
                                window.language,
                                Languages.Ready2InstallDialogInstallButtonText)
    navbar.cancelButton.text: Languages.fromString(window.language,
                                                   Languages.CancelButtonText)
    navbar.backButton.onClicked: {
        parentWindow.show()
        window.hide()
    }
    navbar.nextButton.onClicked: {
        nextWindowEvent()
        window.hide()
    }

    navbar.cancelButton.onClicked: cancelDialog.show()
    content: Item {
        id: container
        width: parent.width
        height: parent.height
        Components.Descs {
            spacing: Vars.MainWindowsDescSpacing
            y: Vars.MainWindowsDescsTop
            x: Vars.MainWindowsDescsLeft
            title.text: Languages.fromString(window.language,
                                       Languages.Ready2InstallDialogTitle)
            title.width: container.width - ((parent.x + x) * 2)
            title.font.pixelSize: Vars.MainWindowsTitleFontSize
            desc.x: Vars.DescLeftSpace
            desc.text: Languages.fromString(window.language,
                                            Languages.Ready2InstallDialogDesc)
            desc.width: container.width - ((parent.x + x) * 2)
            desc.font.pixelSize: Vars.MainWindowsDescFontSize
        }
    }
    topBannerContainer.visible: false
    leftBanner: Constants.LeftBanner {}
}
