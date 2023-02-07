import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.15
import "qrc:/Optitex/Components" as Components
import "qrc:/Optitex/Languages.js" as Languages
import "qrc:/Optitex/Dialogs" as Dialogs
import "qrc:/Optitex/Constants" as Constants
import "qrc:/Optitex/Constants/Vars.js" as Vars

Components.MainWindow {
    id: window
    required property Dialogs.Welcome nextDialog
    fixed: true
    height: Vars.WindowsHeight
    width: Vars.WindowsWidth

    onLanguageChanged: if (langs.currentText != language) langs.currentIndex = langs.model.indexOf(language)

    navbar.backButton.visible: false

    navbar.nextButton.onClicked: {
        nextDialog.show()
        window.hide()
    }

    navbar.cancelButton.onClicked: cancelDialog.show()
    content: Components.LabelFor {
        text: Languages.fromString(language,
                                   Languages.LanguagesComboBoxLabelText)
        Layout.alignment: Qt.AlignCenter
        space: 10
        contentItem: Components.ClassicComboBox {
            id: langs
            width: Vars.EntriesWidth
            model: Languages.asList

            onCurrentTextChanged: {
                window.language = currentText
            }
        }
    }
    leftBannerContainer.visible: false
    topBanner: Constants.TopBanner {
        title.text: Languages.fromString(window.language,
                                    Languages.SelectLangDialogTitle)
        desc.text: Languages.fromString(window.language,
                                    Languages.SelectLangDialogDesc)
    }
}
