import QtQuick
import QtQuick.Controls
import components
import handlers


ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 720
    flags: Qt.FramelessWindowHint | Qt.Window

    LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property ApplicationWindow appWindow: window
    property int windowBorder: 5

    MyAppWindowBorderMouseCurser {
        borderWidth: windowBorder
        anchors.fill: parent
    }

    MyAppWindowResizeHandler {
        borderWidth: windowBorder
    }

    MyAppMainPage {
        anchors.fill: parent
        anchors.margins: appWindow.visibility === Window.Windowed ? windowBorder : 0
    }

    Component.onCompleted: {
        // load language from settings
        // Qt.uiLanguage = ...
    }

}
