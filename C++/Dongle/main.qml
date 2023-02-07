import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import "./Optitex/Dialogs" as Dialogs
import "./Optitex/Components" as Components

Item {
    Dialogs.Ready2Restart {
        visible: false
        id: restart
        language: selectLang.language
    }

    Dialogs.Installing {
        id: installing
        visible: false
        language: selectLang.language
        nextDialog: restart
        parentWindow: ready2Install
    }

    Dialogs.Ready2Install {
        id: ready2Install
        visible: false
        language: selectLang.language
        nextDialog: installing
        parentWindow: enterPassword
    }
    Dialogs.EnterPassword {
        id: enterPassword
        visible: false
        nextDialog: ready2Install
        language: selectLang.language
        parentWindow: selectLang
    }
    Dialogs.Welcome {
        id: welcome
        parentWindow: selectLang
        nextDialog: enterPassword
        language: selectLang.language
        visible: false
    }

    Dialogs.SelectLang {
        id: selectLang
        visible: false
        nextDialog: welcome
        language: "english"

    }
    Component.onCompleted: selectLang.visible = true
}
