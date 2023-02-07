BaseDropDown {
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
}
