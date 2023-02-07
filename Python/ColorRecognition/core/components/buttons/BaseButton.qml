import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Constants/Backgrounds" as Constants_Background
import "../../../Core/Constants/Texts" as Constants_Texts
import "../../../Core/Constants/States" as Constants_States
import "../../../Core/Constants/Types" as Constants_Types

Qt_Controls.Button {
    id: root

    property alias aFont: content.font
    readonly property var content: content

    padding: 4

    contentItem: Constants_Texts.MonoText {
        id: content

        horizontalAlignment: Qt.AlignHCenter
        text: root.text
    }
    
    background: Constants_Background.BaseRounded {
        id: background
        border.width: 0
        anchors {
            fill: root
        }
    }

    states: [
        Qt_Quick.State {
            when: root.down
            Qt_Quick.PropertyChanges {
                target: content
                color: "#4248fb"
            }
            Qt_Quick.PropertyChanges {
                target: background
                border.color: "#4248fb"
                border.width: 2
                color: "#f3f3f3"
            }
        },
        Constants_States.OnHoverDarker {
            when: root.hovered

            background: background
        }
    ]
}
