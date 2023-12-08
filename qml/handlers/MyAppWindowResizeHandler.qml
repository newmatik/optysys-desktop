import QtQuick


DragHandler {
    target: null
    grabPermissions: TapHandler.TakeOverForbidden

    property int borderWidth

    onActiveChanged: {
        if (active) {
            const p = centroid.position
            const b = borderWidth + 15
            let e = 0
            if (p.x < b)
                e |= Qt.LeftEdge
            if (p.x >= width - b)
                e |= Qt.RightEdge
            if (p.y < b)
                e |= Qt.TopEdge
            if (p.y >= height - b)
                e |= Qt.BottomEdge
            appWindow.startSystemResize(e)
        }
    }

}
