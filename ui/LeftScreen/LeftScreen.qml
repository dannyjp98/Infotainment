import QtQuick 2.15

Rectangle {
    id: leftScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: rightScreen.left
        left: parent.left
    }

    color: "white"
    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * .75
        fillMode: Image.PreserveAspectFit
        source: "../assets/cybertruck.png"
    }

}
