import QtQuick 2.6
import QtQuick.Controls 2.2

ScrollView {
    id: scrollView
    width: 200
    height: 24
    readonly property alias content: contentText
    TextArea {
        id: contentText
        property int preContentHeight: 0
        wrapMode: TextArea.Wrap
        selectByMouse: true
        font.pixelSize: 13
        onContentHeightChanged: {
            if(contentHeight > 14 && contentHeight < 56) {
                if(contentHeight != preContentHeight) {
                    preContentHeight = contentHeight;
                    scrollView.height += 14;
                }
            }
        }
    }
    ScrollBar.vertical.policy : ScrollBar.AlwaysOn
    ScrollBar.vertical.width: 10
}
