import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    anchors{
        bottom: parent.bottom
    }

    color: "#262626"


    // LOGIC
    property string selectedShape: "../assets/cylinder.png"
    property var shapes: []

    property int posOnBuffer: 0
    property var undoBuffer: []

    function createShapeComponent(x, y) {
        var component = Qt.createComponent("ShapeComponent.qml")
        if (component.status === Component.Ready) {
            var customComponent = component.createObject(canvas, {"x": x, "y": y, "sourcearg": selectedShape})
            shapes.push(customComponent)
        }
    }

    function clear() {
        for (var i = 0; i < shapes.length; i++) {
            shapes[i].destroy();
        }
        shapes = []
    }

    function undo() { //TODO read from undoBuffer
    }

    function redo() { //TODO read from undoBuffer
    }

    function addToBuffer(){ //TODO add struct {transformtype, changex, changey}
        //clear buffer past posOnBuffer
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

    // Edit bar
    Rectangle {
        width: parent.width / 2
        height: parent.height / 10
        radius: 10
        color: "black"
        anchors{
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Button {
            background: Rectangle {
                color: "transparent"
            }
            anchors{
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 50
            }
            width: 30
            height: 30
            contentItem: Image {
                anchors.fill: parent
                source: "../assets/undo-solid.png"
            }
            onClicked: undo()
        }

        Button {
            background: Rectangle {
                        color: "transparent"
                    }
            anchors{
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 150
            }
            width: 30
            height: 30
            contentItem: Image {
                anchors.fill: parent
                source: "../assets/redo-solid.png"
            }
            onClicked: redo()
        }

        Button {
            background: Rectangle {
                        color: "transparent"
                    }
            anchors{
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 250
            }
            width: 70
            height: 30
            contentItem: Text {
                anchors.fill: parent
                text: "Clear"
                color: "White"
                font.pixelSize: 30
                font.bold: true
            }
            onClicked: clear()
        }
    }


    // Shape palette
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



}
