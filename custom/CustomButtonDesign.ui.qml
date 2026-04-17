import QtQuick 2.15

Item {
    height: 50
    width: 50

    property alias mouseArea: mouseArea
    property alias container: container

    Rectangle {
        id: container
        anchors.fill: parent
        color: mouseArea.pressed ? "#6A5ACD" : "#836FFF"
        radius: 8

        Text {
            text: "+"
            font.pixelSize: 30
            color: "white"
            anchors.centerIn: parent
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: container
    }
}
