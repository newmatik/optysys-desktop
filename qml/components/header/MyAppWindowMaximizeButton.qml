import QtQuick.Controls


ToolButton {
    property bool maximized
    property url iconMaximize: "qrc:/data/icons/open_in_full_black_24dp.svg"
    property url iconNormalize: "qrc:/data/icons/close_fullscreen_black_24dp.svg"

    icon.source: maximized ? iconNormalize : iconMaximize
    icon.width: 18
    icon.height: 18
    focusPolicy: Qt.NoFocus

}
