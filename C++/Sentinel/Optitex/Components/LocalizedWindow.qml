import QtQuick 2.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Components" as Components

Window {
    id: window
    function delay(duration) {
        var timeStart = new Date().getTime();
        while (new Date().getTime() - timeStart < duration);
    }
    required property string language
    onLanguageChanged: {
        if (visible) {
            visible = false
            delay(200)
            visible = true

        }
    }
    Rectangle {
        color: "#f9f9fa"
        anchors.fill: parent
        z: -100
    }

    visible: true
    width: 100
    height: 100
}
