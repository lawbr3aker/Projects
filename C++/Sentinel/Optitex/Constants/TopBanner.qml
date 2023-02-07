import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Constants/Vars.js" as Vars
Item {
    readonly property alias title: descs.title
    readonly property alias desc: descs.desc
    Layout.fillWidth: true
    height: Vars.TopBannerHeight
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#726a9a"
            }
            GradientStop {
                position: 1.0
                color: "#f9f9fa"
            }
        }
    }
    RowLayout {
        x: 10
        height: parent.height * 0.8
        width: parent.width
        Layout.alignment: Qt.AlignVCenter
        Components.Descs {
            id: descs
            title.width: parent.width - _image.width - (parent.x * 2)
            desc.width: title.width
            desc.wrapMode: Text.WordWrap
            desc.x: Vars.TopBannerDescX 
        }
    }
    Item {
        id: _image
        height: parent.height
        width: 200
        anchors.right: parent.right

        Image {
            anchors.centerIn: parent
            source: "qrc:/Optitex/Assets/Images/Logo.png"
            height: parent.height * 0.7
            width: parent.width * 0.8
        }
    }
}
