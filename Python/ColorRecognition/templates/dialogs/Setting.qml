import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls
import QtQuick.Layouts 1.12 as Qt_Layouts

import "../../Core/Components/Buttons" as Components_Buttons
import "../../Core/Components/Inputs" as Components_Inputs
import "../../Core/Components/Menus" as Components_Menus

import Core 1.0

Qt_Quick.Item {
    id: root

    signal back

    required property DataHandler dataHandler
    readonly property alias           address : address.input.text
    readonly property alias             notes : inputs.inputs

    anchors.fill: parent
    Qt_Layouts.ColumnLayout {
        anchors.fill: parent
        Qt_Layouts.Layout.alignment: Qt.AlignTop
        Qt_Layouts.ColumnLayout {
            Qt_Layouts.Layout.alignment: Qt.AlignTop
            Qt_Layouts.Layout.leftMargin: 30
            Qt_Layouts.Layout.rightMargin: 30
            spacing: 20
            Components_Inputs.LabeledTextArea {
                Qt_Layouts.Layout.alignment : Qt.AlignCenter
                Qt_Layouts.Layout.fillWidth : true

                                  id : address
                      implicitHeight : 120
                          label.text : "ادرس:"
                input.font.pixelSize : 17
                          input.text : root.dataHandler.address

                input.onTextChanged : root.dataHandler.address = input.text
            }
            Components_Menus.DropDownInputs {
                Qt_Layouts.Layout.fillWidth : true

                         id : inputs
                     inputs : root.dataHandler.notes
                displayText : "تذکرات"

                onFieldsChanged : root.dataHandler.notes = inputs.inputs
            }
        }
        Qt_Layouts.RowLayout {
            Qt_Layouts.Layout.alignment: Qt.AlignBottom
            Qt_Layouts.Layout.fillWidth: true
            Qt_Layouts.Layout.rightMargin: 35
            Qt_Layouts.Layout.leftMargin: Qt_Layouts.Layout.rightMargin
            Qt_Layouts.Layout.topMargin: 50
            Qt_Layouts.Layout.bottomMargin: 10
            Qt_Quick.Row {
                Qt_Layouts.Layout.fillWidth: true
                Qt_Layouts.Layout.alignment: Qt.AlignLeft
                Components_Buttons.Button {
                    implicitWidth: 80
                    implicitHeight: 30
                    text: "قبل"
                    onClicked: root.back()
                }
            }
        }
    }
}
