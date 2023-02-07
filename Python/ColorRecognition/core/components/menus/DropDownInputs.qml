import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls

import "../../../Core/Components/Buttons" as Components_Buttons
import "../../../Core/Components/Inputs" as Components_Inputs

import "../../../Core/Constants/Backgrounds" as Constants_Background
import "../../../Core/Constants/Texts" as Constants_Texts
import "../../../Core/Constants/States" as Constants_States

BaseDropDown {
    id: root

    signal fieldsChanged

    property var inputs : []
                  model : inputs

    delegate: Qt_Controls.ItemDelegate {
                   id : delagate
                width : root.width
              padding : root.itemsPadding
        bottomPadding : 0
           background : Qt_Quick.Rectangle {color: "transparent"}

        contentItem : Components_Inputs.BaseInput {
            id: delagateContent
            text: root.inputs[index]
            rightPadding: 10
            font.pixelSize: 18
            onTextChanged: {
                root.inputs[index] = text
                root.fieldsChanged()
            }
            background: Constants_Background.OnlyBorder {
                anchors {
                    fill: parent
                }
                border.width: 2
            }
        }
    }

}
