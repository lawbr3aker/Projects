import QtQuick 2.12 as Qt_Quick

import "../../../Core/Constants/Types" as Constants_Types

Qt_Quick.Rectangle {
    id: root

    readonly property var setting: Constants_Types.Setting {
        property color color: "#4248fb"
    }

    readonly property color baseColor: color

    color: setting.color
    radius: 8
}
