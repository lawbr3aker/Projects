import QtQuick 2.12 as Qt_Quick
import QtQuick.Controls 2.12 as Qt_Controls
import QtQuick.Layouts 1.12 as Qt_Layouts

import "../../Core/Components/Buttons" as Components_Buttons
import "../../Core/Components/Inputs" as Components_Inputs
import "../../Core/Components/Menus" as Components_Menus
import "../../Core/Constants/Texts" as Components_Texts

Qt_Quick.Item {
    id: root

    function colorRecognitionClicked() {}

    Qt_Layouts.ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        Components_Buttons.Button {
            id: title

            Qt_Layouts.Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            text: "کار شناسی تشخیص رنگ"
            aFont.pixelSize: 30
            padding: 10

            onClicked: colorRecognitionClicked()
        }
    }
}
