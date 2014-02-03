import QtQuick 2.0
import "Component"

Item {

    Text {
        y:350
        text: "You and me, the zone just belongs to us."
    }

    Column {
        id: userInfoArea
        spacing: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Item {
            id: icon
            width: 80; height: 80;
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: iconBorder
                anchors.fill: parent; radius: width;
                color: "white"
                opacity: 0.4
            }

            Rectangle {
                id:iconImage
                color: "black"
                anchors.fill: icon; anchors.margins: 3
                radius: width;
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                spacing: 15

                ClearLineEdit {

                    width: 150; height:35
                }

                ClearLineEdit {
                    width: 150; height:35
                }
            }
        }
    }

    Column {
        id: loginArea
        anchors.left: userInfoArea.right; anchors.leftMargin: 20

        Rectangle {
            color: "white"
            width: 1; height: 130;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text:"登陆"
        }
    }

    Item {
        id:bar
        state: "show"
        width: parent.width; height: 90

        property int hideHeight: 18
        property int minY : bar.parent.height - bar.height
        property int maxY: bar.parent.height - hideHeight

        signal actionCode(int code);

        function toggle() {
            if (bar.state == "show") {
                bar.state = "hide";
            } else {
                bar.state = "show";
            }
        }

        function releaseSwitch() {
            if (bar.y <= minY + 1) {
                if (bar.state == "show") {
                    bar.state = "show";
                    return;
                }
            }
            if (bar.y >= maxY - 1) {
                if (bar.state == "hide") {
                    bar.state = "hide";
                    return;
                }
            }
            toggle();
        }

        Rectangle {
            color:"#534530"
            opacity: 0.9
            anchors.fill: parent
        }

        Row {
            id: knot
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 12
            anchors.topMargin: 5
            spacing: 4

            property int size: 4

            Rectangle {
                color:"white"
                width: knot.size;height: knot.size; radius: knot.size
            }
            Rectangle {
                color:"white"
                width: knot.size;height: knot.size; radius: knot.size
            }
            Rectangle {
                color:"white"
                width: knot.size;height: knot.size; radius: knot.size
            }
        }

        MouseArea {
            anchors.fill: parent
            drag.target: parent; drag.axis: Drag.YAxis;
            drag.minimumY: bar.minY; drag.maximumY: bar.maxY

            onClicked: parent.toggle()
            onReleased: parent.releaseSwitch()
        }

        GridView {
            id: grid
            anchors.fill: parent
            anchors.margins: 8
            anchors.topMargin: parent.hideHeight
            anchors.bottomMargin: 14
            cellHeight: 60; cellWidth: 60;
            snapMode:GridView.SnapToRow

            clip: true

            ListModel {
                id: loginModel
                ListElement {
                    img: "sef"
                    name: "注册"
                    code: "1"
                }
                ListElement {
                    name: "关于"
                    code: "4"
                }
            }

            model: loginModel

            delegate:Rectangle {
                width: 59;height: 59
                color: "white"

                Column {
                    anchors.fill: parent
                    spacing: 8

                    Rectangle {
                        id: background
                        anchors.horizontalCenter: parent.horizontalCenter
                        color:"#ee3524"
                        width: 35; height: 35
                        radius: width
                    }

                    Text {
                        id:action
                        text: name

                        anchors.horizontalCenter: parent.horizontalCenter
                        color:"red"
                    }
                }
            }
        }

        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: bar
                    y:bar.minY
                    focus:true
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: bar
                    y:bar.maxY
                    focus:true
                }
            }]

        transitions: Transition {
            NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad; duration: 150 }
        }
    }

}
