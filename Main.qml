import QtQuick
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment")

    RightScreen{
        id: rightScreen
    }

    LeftScreen{
        id: leftScreen
    }

    BottomBar{
        id: bottomBar
        onToggleVisiblity: {
            rightScreen.toggleVisible();
        }
    }

    Connections {
            target: bottomBar
            ignoreUnknownSignals: true
            onToggleVisibility : {
                rightScreen.toggleVisible();
            }
        }
}
