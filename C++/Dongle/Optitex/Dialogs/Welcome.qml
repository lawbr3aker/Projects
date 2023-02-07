import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.MainWindow {
    id: window
    required property Dialogs.EnterPassword nextDialog
    fixed: true
    height: Vars.MainWindowsHeight
    width: Vars.MainWindowsWidth
    navbar.backButton.onClicked: {
        parentWindow.show()
        window.hide()
    }
    navbar.nextButton.onClicked: {
        nextDialog.show()
        window.hide()
    }

    navbar.cancelButton.onClicked: cancelDialog.show()
    content: Item {
        id: container
        x: Vars.MainWindowsDescsLeft
        y: Vars.MainWindowsDescsTop
        width: parent.width - x * 2
        height: parent.height - y * 2

        Components.Descs {
            spacing: Vars.MainWindowsDescSpacing
            title.text: Languages.fromString(window.language,
                                             Languages.WelcomeDialogTitle)
            title.width: container.width
            title.font.pixelSize: Vars.MainWindowsTitleFontSize
            desc.x: Vars.DescLeftSpace
            desc.text: Languages.fromString(window.language,
                                            Languages.WelcomeDialogDesc)
            desc.width: container.width - desc.x * 2
            desc.font.pixelSize: Vars.MainWindowsDescFontSize
        }
    }
    topBannerContainer.visible: false
    leftBanner: Constants.LeftBanner {}
}
