import QtQuick 2.15

Rectangle {
    id: bottomBar
    signal toggleVisiblity()
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carSettingsIcon
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .85
        fillMode: Image.PreserveAspectFit

        source: "../assets/caricon.png"
    }

    Text {
        id: volume
        anchors {
            left: carSettingsIcon.left
            leftMargin: 70
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 30
        font.bold: true
        color: "white"

        text: "< 70 >"
    }

    Text {
        id: ac_control
        anchors {
            right: parent.right
            rightMargin: 70
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 30
        font.bold: true
        color: "white"

        text: "< 70 >"
    }

    Rectangle {
            id: painterbutton
            width: 50
            height: 50
            color: "grey"
            radius: 5
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 5
            }

            Image {
                width: parent.width
                height: parent.height
                source: "../assets/palette-solid.png"
            }

            MouseArea {
                anchors.fill: parent


                onClicked: {
                    bottomBar.toggleVisiblity();
                }
            }
        }



}
