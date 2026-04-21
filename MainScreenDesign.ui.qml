import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import "custom"

Item {
    id: root

    property alias btnPlus: btnPlus
    property alias textField: textField
    property alias tasks: tasks

    signal deleteTask(int index)

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

        ListView {
            id: tasks

            anchors {
                top: addItemRow.bottom
                topMargin: 20
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                margins: 20
            }

            delegate: Rectangle {
                    width: ListView.view.width
                    height: 50
                    color: "transparent"
                    border { width: 1; color: "#ccc" }

                    Text {
                        text: model.dsTask
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                    }

                    CheckBox {
                        id: checkbox
                        checked: model.isDone
                        anchors.right: btnDelete.left
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        id: btnDelete
                        text: "Apagar"
                        width: 50
                        height: 20
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.verticalCenter: parent.verticalCenter

                        Connections {
                            target: btnDelete
                            function onClicked() {
                                root.deleteTask(index)
                            }
                        }
                    }
            }
        }
    }
}
