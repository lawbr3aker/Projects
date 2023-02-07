import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls
import QtQuick.Layouts 1.12 as Qt_Layouts

import "../../Core/Components/Buttons" as Components_Buttons
import "../../Core/Components/Inputs" as Components_Inputs
import "../../Core/Components/Menus" as Components_Menus
import "../../Core/Constants/Texts" as Components_Texts

Qt_Quick.Item {
    id: root

    property int spacing: 20
    property int fontSize: 20
    property int padding: 10

    function onClick(what){}

    Qt_Layouts.RowLayout {
        anchors.centerIn: parent
        spacing: root.spacing

        Qt_Layouts.ColumnLayout {
            Qt_Layouts.Layout.alignment: Qt.AlignHCenter
            spacing: root.spacing

            Components_Buttons.Button {
                Qt_Layouts.Layout.fillWidth: true
                aFont.pixelSize: root.fontSize
                padding: root.padding

                onClicked: root.onClick("simple")
                text: "کارشناسی سواری"
            }
            Components_Buttons.Button {
                Qt_Layouts.Layout.fillWidth: true
                aFont.pixelSize: root.fontSize
                padding: root.padding

                text: "فهرست"
            }
        }
        Qt_Layouts.ColumnLayout {
            Qt_Layouts.Layout.alignment: Qt.AlignHCenter
            spacing: root.spacing

            Components_Buttons.Button {
                Qt_Layouts.Layout.fillWidth: true
                aFont.pixelSize: root.fontSize
                padding: root.padding

                onClicked: root.onClick("heavy")
                text: "کارشناسی سنگین"
            }
            Components_Buttons.Button {
                Qt_Layouts.Layout.fillWidth: true
                aFont.pixelSize: root.fontSize
                padding: root.padding

                onClicked: root.onClick("setting")
                text: "تنظیمات"
            }
        }
    }
}
