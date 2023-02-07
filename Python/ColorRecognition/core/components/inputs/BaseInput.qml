import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Constants/Backgrounds" as Constants_Background

Qt_Controls.TextField {
    id: root

    width: 100

    padding: 2
    font {
        family: "Kalligraaf Arabic Medium"
        pixelSize: 20
    }

    background: Constants_Background.OnlyBorder {
        anchors {
            fill: root
        }
    }
}
