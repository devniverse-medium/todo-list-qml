import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: main

    width: 640
    height: 480
    visible: true
    visibility: Window.FullScreen
    title: qsTr("TO-DO List")
    color: "#FFFAFA"

    TopBar {
        id: topBar
        height: 35
        width: parent.width
        onClose: function() {
            main.close()
        }
    }

    MainScreen {
        id: mainScreen

        anchors.fill: parent
    }
}
