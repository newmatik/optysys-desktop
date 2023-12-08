import QtQuick

Item {
    width: parent.width
    height: headerBar.height

    TapHandler {
        gesturePolicy: TapHandler.DragThreshold

        onTapped: {
            if (tapCount === 2) {
                if (appWindow.visibility === Window.Maximized) {
                    appWindow.showNormal()
                } else {
                    appWindow.showMaximized()
                }
            }
        }
    }

    DragHandler {
        target: null
        grabPermissions: TapHandler.CanTakeOverFromAnything

        onActiveChanged: {
            if (active) {
                appWindow.startSystemMove()
            }
        }
    }

    MyAppHeaderContent {
        id: headerBar
    }

}
