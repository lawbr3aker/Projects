import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/Optitex/Constants" as Constants

TextField {
    selectByMouse: true
    id: control
    font.pixelSize: 17
    background: Constants.Background {
        implicitWidth: parent.width
        color: "#dadada"
    }
}
