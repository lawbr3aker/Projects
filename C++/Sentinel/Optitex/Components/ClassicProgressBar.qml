import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

ProgressBar {
    id: control
    value: 0
    clip: true
    readonly property alias bar: bar

    contentItem: Item {
        implicitHeight: control.height
        implicitWidth: control.width
        Rectangle {
            id: background
            radius: 5
            anchors.fill: parent
            border.color: "#999999"
        }
        Rectangle {
            id: bar
            y: 1
            height: control.height - 2
            radius: background.radius
            LinearGradient {
                id: linGr
                anchors.fill: parent
                source: parent
                start: Qt.point(0, 0)
                end: Qt.point(bar.width, 0)
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "#17a81a"
                    }
                    GradientStop {
                        id: grad
                        color: Qt.lighter("#17a81a", 2)
                    }
                    GradientStop {
                        position: 1.0
                        color: "#17a81a"
                    }
                }
                transitions: [
                    Transition {
                        NumberAnimation {
                            target: object
                            property: "position"
                            duration: 200
                            easing.type: Easing.InOutQuad
                        }
                    }
                ]
                PropertyAnimation {
                    target: grad
                    property: "position"
                    from: 0
                    to: 1
                    duration: 2000
                    running: true
                    loops: Animation.Infinite
                }
            }
        }
    }
}
