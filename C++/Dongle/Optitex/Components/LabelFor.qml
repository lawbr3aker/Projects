import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Constants" as Constants
Item {
    id: root
    property alias space: container.spacing
    property alias text: label.text
    property alias font: label.font
    property alias contentItem: container.content
    readonly property alias label: label
    height: parent.height
    width: parent.width
    ColumnLayout {
        id: contentContainer
        anchors.fill: parent
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            id: container
            Constants.Label {
                id: label
            }
            required property Item content
            onContentChanged: {
                if (!content.parent)
                    content.parent = container
            }
        }
    }
}
