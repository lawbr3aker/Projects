import QtQuick 2.0
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Components" as Components
import Optitex.Sentinel 1.0

Item {
    id: root

    required property BackEnd file
    required property Constants.Logger logger

    property bool succeed: true

    function onSucceed() {}
    Connections {
        target: root.file

        function onAppend(string) {
            const type = string.substring(0, 5)
            if (type.startsWith("->")) {
                const logText = string.substring(5, string.length - 1)
                console.log("text:" + logText)
                if (type.includes(".")) {
                    if (type.includes("!")) {
                        root.logger.log.content.text += qsTr(
                                    "<font color=\"red\">%1</font>").arg(
                                    logText)
                    } else {
                        root.logger.log.content.text += logText
                    }
                } else {
                    if (type.includes("!"))
                        root.logger.progressBarTitle.text = qsTr(
                                    "<font color=\"red\">%1</font>").arg(
                                    logText)
                    else if (type.includes("#")) {
                        root.logger.progressBar.bar.width
                                += root.logger.progressBar.width / 100 * logText
                    } else
                        root.logger.progressBarTitle.text = logText
                }
            }
        }
        function onEnd() {
            if (root.succeed)
                root.onSucceed()
        }
    }
}
