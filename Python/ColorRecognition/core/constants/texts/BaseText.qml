import QtQuick 2.12 as Qt_Quick

import "../../../Core/Constants/Fonts" as Constants_Fonts

Qt_Quick.Text {
    id: root

    property bool alignedLeft: horizontalAlignment === Qt_Quick.Text.AlignLeft
    property bool alignedRight: !alignedLeft
}
