import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/Optitex/Constants/Vars.js" as Vars
import "qrc:/Optitex/Constants" as Constants

Column {
    readonly property alias title: title
    readonly property alias desc: desc
    spacing: 3
    Constants.Label {
        id: title
        font.family: "Bahnschrift SemiBold SemiCondensed"
        font.pixelSize: Vars.TopBannerTitleFontSize
        wrapMode: Text.WordWrap
        font.weight: Font.DemiBold
    }
    Constants.Label {
        id: desc
        font.family: "Bahnschrift Light SemiCondensed"
        wrapMode: Text.WordWrap
        font.pixelSize: Vars.TopBannerDescFontSize
        font.letterSpacing: 1
    }
}
