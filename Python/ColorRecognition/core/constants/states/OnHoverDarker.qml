import QtQuick 2.12 as Qt_Quick

Qt_Quick.State {
    name: "hovered"

    required property var background

    Qt_Quick.PropertyChanges {
        target: background

        color: {
            color = Qt.darker(background.setting.color, 1.2)
        }
    }
}
