import QtQuick


MouseArea {
    hoverEnabled: true
    acceptedButtons: Qt.NoButton

    property int borderWidth

    cursorShape: {
        const p = Qt.point(mouseX, mouseY)
        const b = borderWidth + 15
        if (p.x < b && p.y < b)
            return Qt.SizeFDiagCursor
        if (p.x >= width - b && p.y >= height - b)
            return Qt.SizeFDiagCursor
        if (p.x >= width - b && p.y < b)
            return Qt.SizeBDiagCursor
        if (p.x < b && p.y >= height - b)
            return Qt.SizeBDiagCursor
        if (p.x < b || p.x >= width - b)
            return Qt.SizeHorCursor
        if (p.y < b || p.y >= height - b)
            return Qt.SizeVerCursor
    }

}
