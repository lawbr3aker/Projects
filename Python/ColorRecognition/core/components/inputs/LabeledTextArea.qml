import QtQuick 2.12 as Qt_Quick
import QtQuick.Layouts 1.12 as Qt_Layouts

import "../../../Core/Components/Layouts" as Components_Layouts
import "../../../Core/Constants/Texts" as Constants_Text

Qt_Quick.Item {
    id: root
    readonly property alias input: input
    readonly property alias label: cont.label
    Constants_Text.Labeled {
        id: cont
        anchors.fill: parent
        BaseTextArea {
            id: input

            leftPadding: 5
            rightPadding: leftPadding
            font.pixelSize: 19
            Qt_Layouts.Layout.fillWidth: true
            Qt_Layouts.Layout.fillHeight: true

        }
    }
}
