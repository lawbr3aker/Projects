import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.LocalizedObject {
    id: container

    readonly property alias backButton: backButton
    readonly property alias nextButton: nextButton
    readonly property alias cancelButton: cancelButton

    height: root.height + Vars.NavbarVerticalInset * 2
    width: root.width

    x: parent.width - width - Vars.NavbarHorizontalInset
    y: parent.height - height

    RowLayout {
        id: root
        anchors.centerIn: parent
        spacing: 10
        RowLayout {
            spacing: 5
            Components.PushButton {
                id: backButton
                text: Languages.fromString(container.language,
                                           Languages.BackButtonText)
            }
            Components.PushButton {
                id: nextButton
                text: Languages.fromString(container.language,
                                           Languages.NextButtonText)
            }
        }
        Components.PushButton {
            id: cancelButton
            text: Languages.fromString(container.language,
                                       Languages.CancelButtonText)
        }
    }
}
