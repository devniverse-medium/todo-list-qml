import QtQuick 2.15

CustomButtonDesign {
    id: root

    signal clicked

    mouseArea.onClicked: () => {
        root.clicked()
    }
}
