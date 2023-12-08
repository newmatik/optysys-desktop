import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import components.shared
import models


MyAppAutoWidthMenu {
    title: qsTranslate("HeaderBar", "&Options")

    MyAppAutoWidthMenu {
        title: qsTranslate("HeaderBar", "&Language")

        Repeater {
            model: MyAppLanguageModel {}

            MenuItem {
                text: qsTranslate("Languages", model.language)
                onTriggered: timer.start()

                Timer {
                    // Delay it so possible animations have time
                    id: timer
                    interval: 125
                    onTriggered: Qt.uiLanguage = model.abbrev
                }
            }
        }
    }

    MenuSeparator { }

    Action {
        id: action

        text: qsTranslate("HeaderBar", "Showcase translated Qt strings")

        property var loader: Loader { }

        property var component: Component {
            MessageDialog {
                title: qsTranslate("MessageBoxes", "Title")
                text: qsTranslate("MessageBoxes", "Change the language and look at the 'Yes' and 'Cancel' buttons")
                buttons: MessageDialog.Yes | MessageDialog.Cancel
                visible: true

                onAccepted: { action.loader.sourceComponent = null }
                onRejected: { action.loader.sourceComponent = null }
            }
        }

        onTriggered: {
            loader.sourceComponent = component
        }
    }

}
