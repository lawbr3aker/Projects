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
    readonly property alias navbar: navbarContainer
    readonly property alias contentContainer: contentContainer

    readonly property alias topBannerContainer: _topBannerContianer
    property alias topBanner: _topBannerContianer.topBanner

    readonly property alias leftBannerContainer: _leftBannerContainer
    property alias leftBanner: _leftBannerContainer.leftBanner

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
        RowLayout {
            id: _topBannerContianer
            property Item topBanner
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: Vars.TopBannerHeight
            onTopBannerChanged: {
                if (!topBanner.parent)
                    topBanner.parent = _topBannerContianer
            }
        }
        RowLayout {
            spacing: 0
            id: contentContainer
            Column {
                id: _leftBannerContainer
                Layout.preferredHeight: parent.height
                property Item leftBanner
                onLeftBannerChanged: {
                    if (!leftBanner.parent)
                        leftBanner.parent = _leftBannerContainer
                }
            }

            ColumnLayout {
                id: _contentContainer
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: contentContainer.width - _leftBannerContainer.width

                property Item content
                onContentChanged: {
                    if (!content.parent)
                        content.parent = _contentContainer
                }
            }
        }
        Item {
            Layout.preferredWidth: contextContainer.width
            Layout.preferredHeight: navbarContainer.height

            id: navbarCont
            Components.NavigationButtons {
                id: navbarContainer
                language: window.language
            }
        }
    }
}
