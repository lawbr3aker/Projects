import QtQuick 2.12
import QtQuick.Controls 2.5
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Constants/Vars.js" as Vars
Button {
    id: control
    contentItem: Constants.Label {
        text: control.text
    }
    leftPadding: Vars.ButtonsHorizontalPadding
    rightPadding: leftPadding
    topPadding: Vars.ButtonsVerticalPadding
    bottomPadding: topPadding
    background: Constants.Background {
        anchors.fill: parent
    }
}
