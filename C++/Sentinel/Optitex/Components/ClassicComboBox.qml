import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Constants" as Constants

ComboBox {
    id: control
    background: Constants.Background {
        implicitWidth: parent.width
        implicitHeight: parent.height
    }
    delegate: ItemDelegate {
        width: control.width
        padding: 7
        height: dlg.height + padding * 2
        contentItem: Item {
            Constants.Label {
                x: 5
                id: dlg
                font.pixelSize: 15
                verticalAlignment: Text.AlignVCenter
                text: control.textRole ? (Array.isArray(
                                              control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
            }
        }
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }
    contentItem: Item {
        Constants.Label {
            font.capitalization: Font.Capitalize
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: control.currentText
            x: 10
            y: 10
        }
    }
    padding: 3
}
