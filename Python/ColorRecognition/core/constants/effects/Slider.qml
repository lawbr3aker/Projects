import QtQuick 2.12 as Qt_Quick

Qt_Quick.Item {
    id: self

    implicitWidth: parent.width
    implicitHeight: parent.height

    property var where: -width

    function moveLeft() {
        where   = x - width
        moveAnimation.running = true
    }
    function moveRight() {
        where   = x + width
        moveAnimation.running = true
    }

    Qt_Quick.SequentialAnimation {
        id: moveAnimation

        Qt_Quick.NumberAnimation {
            target: self
            property: "x"
            duration: 500
            to: where
            easing.type: Qt_Quick.Easing.InOutBack
        }
    }
}
