import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    visibility: Window.FullScreen
    title: qsTr("TO-DO List")
    color: "#FFFAFA"

    MainScreen {
        id: mainScreen

        anchors.fill: parent
    }
}
