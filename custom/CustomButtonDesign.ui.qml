import QtQuick 2.15

Item {
    id: root

    height: 50
    width: 50

    property alias mouseArea: mouseArea
    property alias container: container
    property string vText: ""
    property string vColor: "#836FFF"
    property string vPressedColor: "#6A5ACD"
    property real vRadius: 8

    Rectangle {
        id: container
        anchors.fill: parent
        color: mouseArea.pressed ? root.vPressedColor : root.vColor
        radius: root.vRadius

        Text {
            text: root.vText
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
