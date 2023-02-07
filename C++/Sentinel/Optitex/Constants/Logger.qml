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
        spacing: 5
        ColumnLayout {
            id: titleContainer
            width: parent.width
            spacing: 4
            Item {
                height: progressBarTitle.implicitHeight
                Constants.Label {
                    id: progressBarTitle
                    textFormat: Text.RichText
                    font.pixelSize: 15
                    font.family: "Consolas"
                }
            }
            Components.ClassicProgressBar {
                id: progressBar
                width: container.width
                height: 20
                Layout.alignment: Qt.AlignHCenter
            }
        }
        Row {
            ColumnLayout {
                spacing: 7
                Item {
                    id: textLogContainer
                    visible: false
                    implicitHeight: container.height - advanceButton.height
                                    - parent.spacing - titleContainer.height
                    implicitWidth: container.width
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
                        content.textFormat: Text.RichText
                        content.font.pixelSize: 15
                        content.font.family: "Consolas"
                    }
                }
                Components.PushButton {
                    id: advanceButton
                    Layout.leftMargin: 10
                    text: Languages.fromString(
                              container.language,
                              textLogContainer.visible ? Languages.InstallingDialogLessAdvancedButtonText : Languages.InstallingDialogAdvancedButtonText)
                    onClicked: textLogContainer.visible = !textLogContainer.visible
                }
            }
        }
    }
}
