import QtQuick          2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls
import QtQuick.Layouts  1.12 as Qt_Layouts

import "../../Core/Components/Buttons" as Components_Buttons
import "../../Core/Components/Inputs"  as Components_Inputs
import "../../Core/Components/Menus"   as Components_Menus

import Printer 1.0
import Core 1.0

Qt_Quick.Item {
    id: root

    anchors.fill: parent

    signal back
    signal saveForm
    signal printForm

    onSaveForm: {
        printer.address = dataHandler.address
          printer.notes = dataHandler.notes

        printer.save(carsMenu.currentIndex, dataHandler.output_dir)
        dataHandler.add_car_form(printer)
    }
    onPrintForm: {
        printer.address = dataHandler.address
          printer.notes = dataHandler.notes

        printer.print(carsMenu.currentIndex, dataHandler.output_dir)
        dataHandler.add_car_form(printer)
    }

    required property DataHandler dataHandler
    readonly property alias          carsMenu : carsMenu
             property alias              cars : carsMenu.model


    readonly property CarFormPrinter printer: CarFormPrinter {
                    id : printer
              car_name : car_name.input.text
                 model : model.input.text
                 color : color.input.text
        chassis_number : chassis_number.input.text
                by_who : by_who.input.text
            car_number : car_number.input.text
          motor_number : motor_number.input.text
             cellphone : cellphone.input.text
                  time : time.input.text
           description : description.input.text
    }

    Qt_Layouts.ColumnLayout {
        anchors.fill : root
             spacing : 10
        Components_Menus.BaseDropDown {
            Qt_Layouts.Layout.alignment : Qt.AlignHCenter

                       id : carsMenu
            implicitWidth : 300
             currentIndex : -1
              displayText : "انتخاب ماشین"
        }
        Qt_Layouts.RowLayout {
            Qt_Layouts.Layout.leftMargin  : 70
            Qt_Layouts.Layout.rightMargin : 30
            Qt_Layouts.Layout.fillWidth   : true
            Qt_Quick.Row {
                Qt_Layouts.Layout.alignment: Qt.AlignLeft |  Qt.AlignTop
                Qt_Layouts.Layout.fillWidth: true
                Qt_Layouts.ColumnLayout {
                    Components_Inputs.LabeledInput {
                                id : car_number
                        label.text : "شماره پلاک:"
                    }
                    Components_Inputs.LabeledInput {
                                id : motor_number
                        label.text : "شماره موتور:"
                    }
                    Components_Inputs.LabeledInput {
                                id : cellphone
                        label.text : "همراه:"
                    }
                    Components_Inputs.LabeledInput {
                                id : time
                        label.text : "ساعت:"
                    }
                }
            }
            Qt_Layouts.RowLayout {
                Qt_Layouts.Layout.alignment: Qt.AlignRight
                Qt_Layouts.Layout.fillWidth: true
                Qt_Layouts.ColumnLayout {
                    Components_Inputs.LabeledInput {
                                id : car_name
                        label.text : "اتوموبیل:"
                    }
                    Components_Inputs.LabeledInput {
                                id : model
                        label.text : "مدل:"
                    }
                    Components_Inputs.LabeledInput {
                                id : color
                        label.text : "رنگ:"
                    }
                    Components_Inputs.LabeledInput {
                                id : chassis_number
                        label.text : "شماره شاسی:"
                    }
                    Components_Inputs.LabeledInput {
                                id : by_who
                        label.text : "توسط خانم/اقای:"
                    }
                }
            }
        }
        Qt_Layouts.RowLayout {
            Qt_Layouts.Layout.fillHeight  : true
            Qt_Layouts.Layout.fillWidth   : true
            Qt_Layouts.Layout.leftMargin  : 30
            Qt_Layouts.Layout.rightMargin : 30
            Components_Inputs.LabeledTextArea {
                Qt_Layouts.Layout.fillWidth  : true
                Qt_Layouts.Layout.fillHeight : true

                                  id : description
                          label.text : "توضیحات:"
                input.font.pixelSize : 15
            }
        }
        Qt_Layouts.RowLayout {
            Qt_Layouts.Layout.alignment    : Qt.AlignBottom
            Qt_Layouts.Layout.fillWidth    : true
            Qt_Layouts.Layout.rightMargin  : 35
            Qt_Layouts.Layout.leftMargin   : Qt_Layouts.Layout.rightMargin
            Qt_Layouts.Layout.topMargin    : 5
            Qt_Layouts.Layout.bottomMargin : 10
            Qt_Quick.Row {
                Qt_Layouts.Layout.fillWidth : true
                Qt_Layouts.Layout.alignment : Qt.AlignLeft
                Components_Buttons.Button {
                     implicitWidth : 80
                    implicitHeight : 30
                              text : "قبل"

                    onClicked: root.back()
                }
            }
            Qt_Layouts.RowLayout {
                Qt_Layouts.Layout.fillWidth: true
                Qt_Layouts.Layout.leftMargin: 50
                Qt_Layouts.Layout.alignment: Qt.AlignLeft
                Components_Buttons.Button {
                     implicitWidth : 100
                    implicitHeight : 30
                              text : "ثبت"

                    onClicked: root.saveForm()
                }
                Components_Buttons.Button {
                     implicitWidth : 80
                    implicitHeight : 30
                              text : "چاپ"

                    onClicked: root.printForm()
                }
            }
        }
    }
}
