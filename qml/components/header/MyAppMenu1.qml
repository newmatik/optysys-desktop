import QtQuick.Controls
import components.shared


MyAppAutoWidthMenu {
    title: qsTranslate("HeaderBar", "&Menu 1")

    Action {
        text: qsTranslate("HeaderBar", "&Action 1")
        shortcut: "CTRL+N"

        onTriggered: {
            console.log("Action 1 pressed")
        }
    }

    Action {
        text: qsTranslate("HeaderBar", "&Action 2")

        onTriggered: {
            console.log("Action 2 pressed")
        }
    }

    Action {
        text: qsTranslate("HeaderBar", "&Action 3")

        onTriggered: {
            console.log("Action 3 pressed")
        }
    }

    Action {
        text: qsTranslate("HeaderBar", "&Action 4")

        onTriggered: {
            console.log("Action 4 pressed")
        }
    }

    MenuSeparator { }

    Action {
        text: qsTranslate("HeaderBar", "&Action 5")

        onTriggered: {
            console.log("Action 5 pressed")
        }
    }

}
