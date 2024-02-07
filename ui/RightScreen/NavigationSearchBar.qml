import QtQuick 2.15

Rectangle {
    id: navSearchBox
    radius: 5
    color: "#f0f0f0"

    Image{
        id: searchIcon

        anchors {
            left: parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * .45
        fillMode: Image.PreserveAspectFit

        source: "../assets/search-solid.png"
    }

    Text{
        id: navigationText
        color: "#a6a6a6"
        text: "Navigate"
        font.pixelSize: 16
        font.bold: true
        anchors {
            verticalCenter: parent.verticalCenter
            left: searchIcon.right
            leftMargin: 20
        }
    }
}
