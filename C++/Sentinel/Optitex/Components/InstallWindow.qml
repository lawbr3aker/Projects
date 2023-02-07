import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Constants/Vars.js" as Vars
import Optitex.Sentinel 1.0

Components.MainWindow {
    readonly property alias file: file
    readonly property alias banner: topBanner
    readonly property alias logger: logger
    id: window

    width: 650
    height: 370

    navbar.backButton.visible: false

    navbar.nextButton.enabled: false
    navbar.nextButton.onClicked: {
        nextWindowEvent()
        window.hide()
    }

    navbar.cancelButton.onClicked: cancelDialog.show()

    BackEnd {
        id: file
    }

    content: Constants.Logger {
        id: logger
        x: 50
        width: parent.width - 2 * x
        height: parent.height - Vars.NavbarVerticalInset

        language: window.language
    }

    leftBannerContainer.visible: false

    topBanner: Constants.TopBanner {
        id: topBanner
    }

    onVisibleChanged: if (visible)
                          file.run()
}
