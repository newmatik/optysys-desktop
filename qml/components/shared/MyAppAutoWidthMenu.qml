import QtQuick
import QtQuick.Controls


Menu {
    width: {
        let result = 0
        let padding = 0
        for (let i = 0; i < count; ++i) {
            let item = itemAt(i)

            if (!isMenuSeparator(item)) {
                result = Math.max(item.contentItem.implicitWidth, result)
                padding = Math.max(item.padding, padding)
            }
        }
        return result + padding * 2
    }

    function isMenuSeparator(item) {
        return item instanceof MenuSeparator
    }

}
