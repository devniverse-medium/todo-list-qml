import QtQuick 2.15

Item {
    id: root

    property string text: input.text

    width: 200
    height: 50
    clip: true

    Rectangle {
        id: background
        radius: 8
        anchors.fill: parent
        border {
            width: 1.5
            color: "#6A5ACD"
        }
    }

    TextInput {
        id: input
        anchors {
            fill: parent
            margins: 10
        }
        verticalAlignment: TextInput.AlignVCenter

        font.pixelSize: 16
    }

}
