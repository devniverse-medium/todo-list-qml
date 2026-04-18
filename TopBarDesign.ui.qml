import QtQuick 2.15
import QtQuick.Layouts
import "custom"

Item {
    id: root

    property alias btnClose: btnClose

    Rectangle {
        id: container

        anchors.fill: parent

        CustomButton {
            id: btnClose

            vText: "X"
            height: parent.height
            width: height
            anchors.right: parent.right
            vRadius: 0
            vColor: "#6A5ACD"
        }
    }
}
