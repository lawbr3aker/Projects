import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Constants/Backgrounds" as Constants_Background
import       "../../../Core/Constants/Texts" as Constants_Texts

Qt_Controls.RadioButton {
    id: root

    background: Constants_Background.BaseRounded {
        anchors {
            fill: parent
        }
    }

    indicator: Constants_Background.OnlyBorder {
        width : parent.height * 0.6
        height: width

        anchors {
            verticalCenter: parent.verticalCenter
        }

        x: content.alignedLeft ? parent.width - width - y : y

        Constants_Background.BaseRounded {
            width: parent.height * 0.5
            height: width

            anchors.centerIn: parent
            visible: root.checked
        }
    }

    contentItem: Constants_Texts.MonoText {
        id: content

        text: root.text
    }
}
