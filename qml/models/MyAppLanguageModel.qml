import QtQuick


ListModel {
    readonly property var languagesForTranslationTool: [
        qsTranslate("Languages", "English"),
        qsTranslate("Languages", "German")
    ]

    ListElement {
        language: "English"
        abbrev: "en_US"
    }
    ListElement {
        language: "German"
        abbrev: "de_DE"
    }
}
