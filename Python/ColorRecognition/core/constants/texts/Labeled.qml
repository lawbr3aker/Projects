import QtQuick 2.12 as Qt_Quick
import QtQuick.Layouts 1.12 as Qt_Layouts

import "../../../Core/Components/Layouts" as Components_Layouts
import "../../../Core/Constants/Texts" as Constants_Text

Components_Layouts.BaseRow {
    id: root

    readonly property alias label: label

    Constants_Text.MonoText {
        id: label

        color: "#4248fb"
        font.pixelSize: 18
    }

    states: [
        Qt_Quick.State {
            when: label.alignedRight

            Qt_Quick.PropertyChanges {
                target: root

                layoutDirection: Qt.RightToLeft
            }
        }
    ]
}
