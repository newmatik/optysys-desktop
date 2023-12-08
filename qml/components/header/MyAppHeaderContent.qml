import QtQuick
import QtQuick.Controls


Item {
    id: headerBarContent
    width: parent.width
    height: menuBar.height

    Row {
        width: parent.width
        spacing: 0

        MenuBar {
            id: menuBar
            background: Rectangle {
                color: "transparent"
            }

            MyAppMenu1 {}
            MyAppMenu2 {}
            MyAppOptionsMenu {}
            MyAppHelpMenu {}
        }

        Label {
            text: Qt.application.name
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: headerBarContent.width - menuBar.width * 2
            height: menuBar.height
            elide: LayoutMirroring.enabled ? Text.ElideLeft: Text.ElideRight
        }

        Item {
            id: buttonWrapper
            width: menuBar.width
            height: menuBar.height

            MyAppWindowMinimizeButton {
                height: buttonWrapper.height
                anchors.right: maximizeButton.left

                onClicked: {
                    appWindow.showMinimized()
                }
            }

            MyAppWindowMaximizeButton {
                id: maximizeButton
                height: buttonWrapper.height
                anchors.right: closeButton.left
                maximized: appWindow.visibility === Window.Maximized

                onClicked: {
                    if (appWindow.visibility === Window.Maximized) {
                        appWindow.showNormal()
                    } else {
                        appWindow.showMaximized()
                    }
                }
            }

            MyAppWindowCloseButton {
                id: closeButton
                height: buttonWrapper.height
                anchors.right: buttonWrapper.right

                onClicked: {
                    appWindow.close()
                }
            }
        }
    }

}
