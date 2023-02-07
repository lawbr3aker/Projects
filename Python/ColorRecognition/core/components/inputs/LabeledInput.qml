import QtQuick 2.12 as Qt_Quick

import "../../../Core/Components/Layouts" as Components_Layouts
import "../../../Core/Constants/Texts" as Constants_Text

Constants_Text.Labeled {
    id: root

    readonly property alias input: input

    BaseInput {
        id: input

        leftPadding: 5
        rightPadding: leftPadding
        font.pixelSize: 19

        implicitWidth: 170
    }
}
