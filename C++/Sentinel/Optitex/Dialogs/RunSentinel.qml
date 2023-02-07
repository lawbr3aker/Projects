import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.InstallWindow {
    id: window
    file.filePath: "\"Assets/Sentinel/Run.cmd\""

    navbar.nextButton.onClicked: {

    }

    Constants.LogHandler {
        file: window.file
        function onSucceed() {
            window.navbar.nextButton.enabled = true
        }
        logger: window.logger
    }

    banner.title.text: Languages.fromString(window.language,
                                            Languages.InstallingDialogTitle)
    banner.desc.text: Languages.fromString(window.language,
                                           Languages.InstallingDialogDesc)
}
