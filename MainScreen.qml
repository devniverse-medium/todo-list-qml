import QtQuick 2.15

import MainScreenControl 1.0

MainScreenDesign {
    id: root

    btnPlus.onClicked: function() {
        let descTarefa = textField.text
    }

    Component.onCompleted: control.test()

    MainScreenControl {
        id: control
    }
}
