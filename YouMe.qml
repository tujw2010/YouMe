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


    AppTitle {
        id: appTitle
        width: parent.width; height: 30;
    }

    MainPanel {
         x:0; y:appTitle.height
        width: parent.width; height: parent.height - appTitle.height
        clip: true;opacity: 0
        visible: loginPanel.state == "login"
    }

    LoginPanel {
        id:loginPanel
        x:0; y:appTitle.height
        width: parent.width; height: parent.height - appTitle.height
        clip: true;
    }

    MenuBar {
        id: menuBar
    }
}

