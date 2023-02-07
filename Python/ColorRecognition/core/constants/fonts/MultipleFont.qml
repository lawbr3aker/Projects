import QtQuick 2.12 as Qt_Quick

Qt_Quick.Item {
    id: root

    required property var source

    property var fonts: []

    property bool __change_applied: false
    property string __as_css_span: "<span>%2</span>"

    function get() {
        return source.text
    }

    Qt_Quick.Connections {
        target: source

        function onTextChanged() {
            if (!root.__change_applied) {
                root.__change_applied = true
                text = __as_css_span.arg(get())
            } else
                root.__change_applied = false
        }
    }

    onFontsChanged: {
        let correct_form = qsTr("\\\"%1\\\"")
        var font_family = fonts.map(font => correct_form.arg(font)).join(", ")

        __as_css_span = qsTr("<span style='font-family: %1'>%2</span>").arg(font_family)
    }
}
