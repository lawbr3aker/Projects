import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ListView {
    id: listView
    property string checked
    delegate: RadioButton {
        id: sampleButton
        text: name
        checked: isChecked
        onCheckedChanged: {
            if (checked)
                listView.checked = index
        }
    }
}
