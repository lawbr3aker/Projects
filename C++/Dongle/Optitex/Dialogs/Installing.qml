import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars
import Optitex.Dongle 1.0

Components.MainWindow {
    BackEnd {
        id: file
        filePath: "\"Drivers/BeforeInstall.cmd\""
    }
    Component.onCompleted: file.language = language

    id: window
    fixed: true
    width: Vars.MainWindowsWidth
    height: Vars.MainWindowsHeight
    navbar.backButton.visible: false
    navbar.nextButton.enabled: false
    navbar.nextButton.onClicked: {
        nextDialog.show()
        window.hide()
    }

    navbar.cancelButton.text: Languages.fromString(window.language,
                                                   Languages.CancelButtonText)
    navbar.cancelButton.onClicked: cancelDialog.show()
    required property Dialogs.Ready2Restart nextDialog

    Connections {
        id: con
        target: file
        property bool succeed: true
        function onAppend(string) {
            console.log(string)
            if (string.substring(0, 2) == "->")
                logger.progressBarTitle.text = string.substring(2, string.length)
            else
                logger.log.content.text += string

            if (string.includes("failed"))
                con.succeed = false
            if (string.includes("successful") && logger.progressBar.bar.width < logger.progressBar.parent.width)
                logger.progressBar.bar.width += logger.progressBar.width / 5
        }
        function onEnd() {
            logger.progressBarTitle.text = "finished!"
            if (con.succeed)
                window.navbar.nextButton.enabled = true
        }
    }

    content: Constants.Logger {
        language: window.language
        x: 50
        width: parent.width - 2 * x
        height: parent.height - Vars.NavbarVerticalInset
        id: logger
    }
    leftBannerContainer.visible: false
    topBanner: Constants.TopBanner {
        title.text: Languages.fromString(window.language,
                                    Languages.InstallingDialogTitle)
        desc.text: Languages.fromString(window.language,
                                    Languages.InstallingDialogDesc)
    }

    onVisibleChanged: if (visible) file.run()
}
