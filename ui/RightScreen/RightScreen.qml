import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    Plugin {
           id: mapPlugin
           name: "osm"
       }

       Map {
           id: map
           anchors.fill: parent
           plugin: mapPlugin
           center: QtPositioning.coordinate(42.28, -83.74) // Oslo
           zoomLevel: 14
           property geoCoordinate startCentroid

           PinchHandler {
               id: pinch
               target: null
               onActiveChanged: if (active) {
                   map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
               }
               onScaleChanged: (delta) => {
                   map.zoomLevel += Math.log2(delta)
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               onRotationChanged: (delta) => {
                   map.bearing -= delta
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               grabPermissions: PointerHandler.TakeOverForbidden
           }
           WheelHandler {
               id: wheel
               acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                ? PointerDevice.Mouse | PointerDevice.TouchPad
                                : PointerDevice.Mouse
               rotationScale: 1/120
               property: "zoomLevel"
           }
           DragHandler {
               id: drag
               target: null
               onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
           }
           Shortcut {
               enabled: map.zoomLevel < map.maximumZoomLevel
               sequence: StandardKey.ZoomIn
               onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
           }
           Shortcut {
               enabled: map.zoomLevel > map.minimumZoomLevel
               sequence: StandardKey.ZoomOut
               onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
           }
       }

       Image {
           id: lockIcon
           anchors {
               left: parent.left
               top: parent.top
               margins: 20
           }
           width: parent.width / 40
           fillMode: Image.PreserveAspectFit
           source: (systemHandler.carLocked ? "../assets/lock-solid.png" : "../assets/lock-open-solid.png")

           MouseArea {
               anchors.fill: parent
               onClicked: systemHandler.setCarLocked(!systemHandler.carLocked)
           }
       }

       Text {
           id: dateTimeDisplay
           anchors {
               left: lockIcon.right
               leftMargin: 40
               bottom: lockIcon.bottom
           }
           font.pixelSize: 20
           font.bold: true
           color: "black"

           text: systemHandler.currentTime
       }


       Text {
           id: outdoorTemperatureDisplay
           anchors {
               left: dateTimeDisplay.right
               leftMargin: 40
               bottom: lockIcon.bottom
           }
           font.pixelSize: 20
           font.bold: true
           color: "black"

           text: systemHandler.outdoorTemp + "°F"
       }


       Image {
           id: userIcon
           anchors {
               right: usernameDisplay.left
               bottom: lockIcon.bottom
               rightMargin: 5
               bottomMargin: 3
           }
           width: parent.width / 50
           fillMode: Image.PreserveAspectFit
           source: "../assets/user-solid.png"
       }

       Text {
           id: usernameDisplay
           anchors {
               left: outdoorTemperatureDisplay.right
               leftMargin: 50
               bottom: lockIcon.bottom
           }
           font.pixelSize: 20
           font.bold: true
           color: "black"

           text: systemHandler.userName
       }

       NavigationSearchBar {
           id: searchBar
           width: parent.width * 1/3
           height: parent.height * 1/12
           anchors {
               left: lockIcon.left
               top: lockIcon.bottom
               topMargin: 15
           }
       }

       CanvasPanel {
           visible: false
           id: canvasPanel
           width: parent.width
           height: parent.height * 5/6
       }

       function toggleVisible() {
           canvasPanel.visible = !canvasPanel.visible;
       }



       width: parent.width * 2/3


}
