import QtQuick 2.15
import QtQuick.Layouts
import "custom"

Item {
    id: root

    property alias btnPlus: btnPlus
    property alias textField: textField

    anchors.fill: parent

    Rectangle {
        id: background
        height: 550
        width: 650
        anchors.centerIn: parent
        border {
            width: 1
            color: "#808080"
        }
        radius: 8

        Text {
            id: title
            text: "Minhas tarefas"
            font.bold: true
            font.pixelSize: 20

            anchors {
                top: parent.top
                topMargin: 40
                horizontalCenter: parent.horizontalCenter
            }
        }

        RowLayout {
            id: addItemRow
            anchors {
                top: title.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 50
            }

            height: 50
            width: parent.width * 0.75

            EditTextField {
                id: textField
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            CustomButton {
                id: btnPlus
                vText: "+"
                Layout.fillHeight: true
                Layout.preferredWidth: 50
            }
        }
    }
}
