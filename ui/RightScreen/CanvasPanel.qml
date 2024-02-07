import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    anchors{
        bottom: parent.bottom
    }

    color: "#262626"

    function createShapeComponent(x, y) {
        var component = Qt.createComponent("ShapeComponent.qml")
        if (component.status === Component.Ready) {
            var customComponent = component.createObject(canvas, {"x": x, "y": y, "sourcearg": selectedShape})
        }
    }



    Rectangle {
        id: canvas
        anchors.fill: parent
        color: "#262626"
        anchors.margins: 50

        MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        createShapeComponent(mouseX, mouseY)
                    }
                }



    }

    Rectangle {
        width: parent.width / 10
        height: parent.height * .8
        radius: 10
        color: "black"
        anchors{
            verticalCenter: parent.verticalCenter
        }

        Button {
            background: Rectangle {
                        color: "transparent"
                    }
            anchors{
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 50
            }
                    id: squareButton
                    width: 50
                    height: 50
                    contentItem: Image {
                        anchors.fill: parent
                        source: "../assets/square.png"
                    }
                    onClicked: selectedShape = "../assets/square.png"
                }

                Button {
                    background: Rectangle {
                                color: "transparent"
                            }
                    anchors{
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 150
                    }
                    id: circleButton
                    width: 50
                    height: 50
                    contentItem: Image {
                        anchors.fill: parent
                        source: "../assets/sphere.png"
                    }
                    onClicked: selectedShape = "../assets/sphere.png"
                }

                Button {
                    background: Rectangle {
                                color: "transparent"
                            }
                    anchors{
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                        topMargin: 250
                    }
                    id: cylinderButton
                    width: 50
                    height: 50
                    contentItem: Image {
                        anchors.fill: parent
                        source: "../assets/cylinder.png"
                    }
                    onClicked: selectedShape = "../assets/cylinder.png"
                }
    }


    property var selectedShape: "../assets/cylinder.png"
    property var shapes: []
}
