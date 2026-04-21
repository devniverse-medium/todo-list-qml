import QtQuick 2.15

import MainScreenControl 1.0

MainScreenDesign {
    id: root

    btnPlus.onClicked: function() {
        let descTarefa = textField.text

        control.addTask(descTarefa)
    }

    Component.onCompleted: function() {
        tasks.model = control.tasks
    }

    onDeleteTask: function(index) {
        control.deleteTask(index)
    }

    MainScreenControl {
        id: control
    }
}
