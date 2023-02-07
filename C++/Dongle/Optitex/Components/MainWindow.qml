import QtQuick 2.9
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Dialogs" as Dialogs

Components.TemplateWindow {
    id: window
    readonly property alias cancelDialog: cancelDialog
    property bool __readyToShow: visible
    Dialogs.Cancel {
        id: cancelDialog
        visible: false
        parentWindow: window
        language: window.language
    } 
    Shortcut {
        sequence: "Return"
        onActivated: if (window.navbar.nextButton.enabled) window.navbar.nextButton.clicked()
    }
}
