import QtQuick 2.15

Item {
    property alias shape: shapeItem

    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        color: "transparent"
        border.color: "transparent"
        MouseArea {
            anchors.fill: parent
            onClicked: parent.clicked()
        }
    }

    Item {
        id: shapeItem
        anchors.centerIn: parent
    }

    signal clicked
}
