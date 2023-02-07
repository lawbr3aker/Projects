import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.LocalizedWindow {
    id: window

    property bool fixed: false
    property Components.TemplateWindow parentWindow
    readonly property alias contextContainer: contextContainer
    readonly property alias navbar: navbar
    readonly property alias contentContainer: contentContainer

    readonly property alias topBannerContainer: topBannerContianer
    property alias topBanner: topBannerContianer.topBanner

    readonly property alias leftBannerContainer: leftBannerContainer
    property alias leftBanner: leftBannerContainer.leftBanner

    property alias content: _contentContainer.content
    color: "#f9f9fa"
    onFixedChanged: {
        if (fixed) {
            window.minimumWidth = width
            window.maximumWidth = width
            window.maximumHeight = height
            window.minimumHeight = height
        }
    }
    ColumnLayout {
        id: contextContainer
        width: window.width
        height: window.height
        spacing: 0
        RowLayout {
            id: topBannerContianer
            property Item topBanner
            width: parent.width
            height: Vars.TopBannerHeight
            onTopBannerChanged: {
                if (!topBanner.parent)
                    topBanner.parent = topBannerContianer
            }
        }
        RowLayout {
            spacing: 0
            id: contentContainer
            Layout.fillHeight: true
            Column {
                id: leftBannerContainer
                height: parent.height
                property Item leftBanner
                onLeftBannerChanged: {
                    if (!leftBanner.parent)
                        leftBanner.parent = leftBannerContainer
                }
            }

            ColumnLayout {
                id: _contentContainer
                height: parent.height
                width: contentContainer.width - leftBannerContainer.width

                property Item content
                onContentChanged: {
                    if (!content.parent)
                        content.parent = _contentContainer
                }
            }
        }
        Column {
            Layout.fillWidth: true
            id: navbarContainer

            Components.NavigationButtons {
                id: navbar
                language: window.language
            }
        }
    }
}
