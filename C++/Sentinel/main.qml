import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import "./Optitex/Dialogs" as Dialogs
import "./Optitex/Components" as Components

Item {
    id: root
    property string language: selectLang.language

    Dialogs.Ready2Restart {
        visible: false
        id: restart
        language: root.language
    }

    Dialogs.RunSentinel {
        id: installing
        visible: false
        language: root.language
        parentWindow: ready2Install
        function nextWindowEvent() {
            restart.show()
        }
    }

    Dialogs.Ready2Install {
        id: ready2Install
        visible: false
        language: root.language
        parentWindow: enterPassword
        function nextWindowEvent() {
            installing.show()
        }
    }
    Dialogs.EnterPassword {
        id: enterPassword
        visible: false
        nextDialog: ready2Install
        language: root.language
        parentWindow: selectLang
    }
    Dialogs.Welcome {
        id: welcome
        parentWindow: selectLang
        nextDialog: enterPassword
        language: root.language
        visible: false
    }

    Dialogs.SelectLang {
        id: selectLang
        visible: false
        nextDialog: welcome
        language: "english"
    }

    Component.onCompleted: {
        selectLang.visible = true
    }
}
