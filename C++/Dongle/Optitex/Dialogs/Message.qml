import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Constants/Vars.js" as Vars
Components.TemplateWindow {

    id: window
    required property Components.TemplateWindow parentWindow
    readonly property alias icon: icon
    property alias msgContent: contentsContainer.msgContent
    readonly property alias contentsContainer: contentsContainer
    fixed: true
    width: Vars.MessageWindowsWidth
    height: Vars.MessageWindowsHeight

    content: RowLayout {
        id: contentsContainer
        Layout.preferredWidth: window.width
        Layout.preferredHeight: window.height
        Item {
            id: icon
            property alias image: image
            width: Vars.MessageIconsSize * 1.50
            height: width
            visible: false
            Image {
                id: image
                anchors.centerIn: parent
                sourceSize.width: Vars.MessageIconsSize
                sourceSize.height: Vars.MessageIconsSize
            }
        }
        required property Item msgContent
        onMsgContentChanged: if (!msgContent.parent) msgContent.parent = contentsContainer
    }
    Shortcut {
        sequence: "Return"
        onActivated: if (window.navbar.cancelButton.enabled)
                         window.navbar.cancelButton.clicked()
    }
    leftBannerContainer.visible: false
    topBannerContainer.visible: false
    modality: Qt.WindowModal
}
