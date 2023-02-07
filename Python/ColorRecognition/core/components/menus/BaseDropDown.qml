import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Components/Buttons" as Components_Buttons

import "../../../Core/Constants/Backgrounds" as Constants_Background
import "../../../Core/Constants/Texts" as Constants_Texts
import "../../../Core/Constants/States" as Constants_States

Qt_Controls.ComboBox {
    id: root

    property int itemsPadding: 5
    property int horizPadding: 10

    background: null

    states: [
        Qt_Quick.State {
            when: displayContent.contentItem.alignedRight
            Qt_Quick.PropertyChanges {
                target: root

                contentItem.anchors.right: root.right
                indicator.x: 10
                indicator.anchors.left: root.left
            }
        }
    ]

    delegate: Qt_Controls.ItemDelegate {
        id: delagate

        width: root.width
        height: 30

        padding: root.itemsPadding
        bottomPadding: 0

        function update() {
            root.displayText = modelData
            root.currentIndex = index
        }
        onClicked: update()
        background: Qt_Quick.Rectangle {color: "transparent"}
        contentItem: Components_Buttons.DropDownButton {
            id: delagateContent

            text: modelData

            onClicked: delagate.update()

            checked: root.currentIndex === index

            font {
                pixelSize: 18
            }

            background: Constants_Background.BaseRounded {
                anchors {
                    fill: parent
                }

                states: [
                    Constants_States.OnHoverDarker {
                        when: delagateContent.hovered

                        background: delagateContent.background
                    }
                ]
            }
        }
    }

    indicator: Qt_Quick.Canvas {
        id: indicator
        property color color:displayContent.down ? "#4248fb" : "white"
        x: root.width - width - 10
        y: (root.availableHeight - height) / 2
        anchors {
            leftMargin: x
            rightMargin: x
        }

        width: 15
        height: 10
        contextType: "2d"

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = color
            context.fill();
        }
        onColorChanged: requestPaint()
    }
    contentItem: Components_Buttons.Button {
        id: displayContent

        anchors.fill: root

        text: root.displayText
        onClicked: popup.visible = !popup.visible

        font {
            pixelSize: 20
        }
    }

    popup {
        y: root.height + 5

        background: Constants_Background.OnlyBorder {
            anchors {
                fill: parent
            }
        }

        contentItem: Qt_Quick.ListView {
            implicitHeight: contentHeight + root.itemsPadding

            model: root.popup.visible ? root.delegateModel : null

            currentIndex: root.highlightedIndex
        }
    }
}
