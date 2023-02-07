import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import "./Optitex/Dialogs" as Dialogs
import "./Optitex/Components" as Components

Item {
    id: root
    property string language: "english"
    Dialogs.SuccessInstallation {
        id: success
        language: root.language
    }

    Dialogs.InstallingDriver {
        id: installingDriver
        language: root.language
        nextDialog: success
    }
    Component.onCompleted: installingDriver.visible = true
}
