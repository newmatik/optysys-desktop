import QtQuick 2.0
import QtTest

Item {
    property var model: MyAppLanguageModel {}

    TestCase {
        name: "MyAppLanguageModelTest"

        function test_language_de_exists(data) {
            const languages = extractLanguages()
            verify(languages.includes('de_DE'))
        }

        function test_language_en_exists(data) {
            const languages = extractLanguages()
            verify(languages.includes('en_US'))
        }

        function extractLanguages() {
            const languages = []
            for (let i = 0; i < model.count; i++){
                languages.push(model.get(i).abbrev)
            }
            return languages
        }
    }
}
