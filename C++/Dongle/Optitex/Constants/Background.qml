import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    color: control.hovered ? "#a0a0a0" : "#dadada"
    border.color: control.focus ? "black" : "#ffffff"
    border.width: 1
    radius: 5
    layer.enabled: control.enabled && control.focus
    layer.effect: DropShadow {
        verticalOffset: 0.8
        horizontalOffset: 0.5
        color: "#494949"
        samples: 16
        spread: 0.1
    }
}
