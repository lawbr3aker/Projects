import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Constants/Vars.js" as Vars
Item {
    width: 300
    height: parent.height
    Image {
        anchors.left: parent.left
        width: parent.width
        height: parent.height - Vars.NavbarVerticalInset
        source: "qrc:/Optitex/Assets/Images/LeftBanner.png"
    }
}
