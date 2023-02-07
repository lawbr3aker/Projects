import QtQuick.Controls 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Constants/Backgrounds" as Constants_Background

Qt_Controls.TextArea {
    id: root

    padding: 2
    font {
        family: "Kalligraaf Arabic Medium"
        pixelSize: 18
    }

    background: Constants_Background.OnlyBorder {
        anchors {
            fill: root
        }
    }
}
