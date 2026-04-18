import QtQuick 2.15

TopBarDesign {
    id: root

    signal close

    btnClose.onClicked: function() {
        root.close()
    }
}
