import QtQuick 2.15
Image {
    property string sourcearg: "../assets/square.png"
    width: 80
    height: 80
    id: squareImage
    source: sourcearg

    MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAndYAxis
        }




    // Resizing from bottom right corner
        Rectangle {
            id: resizeHandle
            width: 20
            height: 20
            color: "transparent"
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            MouseArea {
                id: resizeArea
                anchors.fill: parent

                property real initialWidth: squareImage.width
                            property real initialHeight: squareImage.height
                            property real initialMouseX
                            property real initialMouseY


                onPressed: {
                    resizeArea.drag.target = resizeHandle // Set the target of the drag operation to the parent Image
                    resizeArea.initialWidth = squareImage.width
                    resizeArea.initialHeight = squareImage.height
                    resizeArea.initialMouseX = mouse.x
                    resizeArea.initialMouseY = mouse.y
                }

                onPositionChanged: {
                    var deltaX = mouse.x - resizeArea.initialMouseX
                    var deltaY = mouse.y - resizeArea.initialMouseY
                    squareImage.width = Math.max(20, resizeArea.initialWidth + deltaX)
                    squareImage.height = Math.max(20, resizeArea.initialHeight + deltaY)
                }
            }
        }


            Rectangle {
                id: rotateHandle
                width: 20
                height: 20
                color: "transparent"
                anchors.top: parent.top
                anchors.left: parent.left

                MouseArea {
                    id: rotateArea
                    anchors.fill: parent

                    property real initialAngle
                                property real initialMouseX
                                property real initialMouseY

                    onPressed: {
                        rotateArea.drag.target = rotateHandle
                        rotateArea.initialAngle = squareImage.rotation
                        rotateArea.initialMouseX = mouse.x
                        rotateArea.initialMouseY = mouse.y
                    }

                    onPositionChanged: {
                        var deltaX = mouse.x - rotateArea.initialMouseX
                        var deltaY = mouse.y - rotateArea.initialMouseY
                        squareImage.rotation = rotateArea.initialAngle + Math.atan2(deltaY, deltaX) * 180 / Math.PI
                    }
                }
            }




}

