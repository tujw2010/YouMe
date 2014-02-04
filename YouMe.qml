import QtQuick 2.0
import "model"

Rectangle {
    id:window
    width: 320;height: 450

    Rectangle {
        anchors.fill: parent;
        id: appBackground
        color: "#b73b3b"
    }

    Column {
        anchors.fill: parent

        AppTitle {
            id: appTitle
            width: parent.width; height: 30;
        }

//        LoginPanel {
//            width: parent.width; height: parent.height - appTitle.height
//            clip: true
//        }

        MainPanel {
            width: parent.width; height: parent.height - appTitle.height
            clip: true
        }
    }

    MenuBar {
        id: menuBar
    }
}

