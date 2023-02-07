import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Constants" as Constants

Item {
    id: root
    property alias space: container.spacing
    property alias text: label.text
    property alias font: label.font
    property alias contentItem: container.content
    readonly property alias contentContainer: container
    readonly property alias label: label
    property var alignment: Qt.AlignHCenter
    height: parent.height

    ColumnLayout {
        id: contentContainer
        height: parent.height
        width: parent.width
        RowLayout {
            id: container
            Layout.alignment: alignment
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
