import QtQuick 2.14
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Languages.js" as Languages
Components.LocalizedObject {
    readonly property alias progressBar: progressBar
    readonly property alias progressBarTitle: progressBarTitle
    readonly property alias log: advancedLog
    id: container
    ColumnLayout {
        id: lay
        width: parent.width
        spacing: 10
        RowLayout {
            Layout.preferredWidth: parent.width
        }
        RowLayout {
            id: progressBarContainer
            Layout.preferredWidth: parent.width
            height: 10
            ColumnLayout {
                width: parent.width
                spacing: 4
                Item {
                    height: progressBarTitle.implicitHeight
                    Constants.Label {
                        id: progressBarTitle
                        font.pixelSize: 15
                    }
                }
                Components.ClassicProgressBar {
                    id: progressBar
                    width: container.width
                    height: 20
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
        Item {
            id: textLogContainer
            visible: false
            height: container.height - advanceButton.height - progressBarContainer.height
                    - (lay.children.length - 1) * lay.spacing
            width: container.width
            Rectangle {
                anchors.fill: parent
                color: "white"
                border.width: 1
                border.color: "#9d9d9d"
                radius: 5
            }

            Components.ScrollTextArea {
                id: advancedLog
                anchors.fill: parent
                content.readOnly: true
            }
        }
        Components.PushButton {
            Layout.leftMargin: 5
            id: advanceButton
            text: Languages.fromString(
                container.language,
                      textLogContainer.visible ?
                      Languages.InstallingDialogLessAdvancedButtonText :
                      Languages.InstallingDialogAdvancedButtonText)
            onClicked: textLogContainer.visible = !textLogContainer.visible
        }
    }
}
