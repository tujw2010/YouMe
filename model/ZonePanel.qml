import QtQuick 2.0

Flickable {
    id:flickable
    contentWidth: width; contentHeight: height;
    flickableDirection:Flickable.HorizontalFlick

    signal moving(var item, real x);

    rebound: Transition {
        NumberAnimation {
            property: "x"
            duration: 200;
            easing.type: Easing.Linear
        }
    }

    onContentXChanged: {
        if(Math.abs(contentX) >= width / 3) {
            if(!flickable.dragging)
                flickStarted()
        }
    }

    onFlickStarted: {
        if(Math.abs(contentX) >= 40) {
            if (contentX > 0) {
                flickable.state = "toLeft"
            } else {
                flickable.state = "toRight"
            }

            flickable.cancelFlick();
            moving(flickable, contentX)
        }
    }

    transitions: Transition {
        NumberAnimation {
            property: "x"
            duration: 400;
            easing.type: Easing.Linear
        }
    }

    states: [
        State {
            name: "toRight"
            PropertyChanges {
                target: flickable
                x: flickable.width
            }
        },
        State {
            name: "toLeft"
            PropertyChanges {
                target: flickable
                x: -flickable.width
            }
        },
        State { name: "normal"}
    ]


    GridView {
        anchors.fill: parent;
        anchors.topMargin: 15; anchors.bottomMargin: 20;
        anchors.margins: 8
        clip:true

        cellWidth: 82; cellHeight:132;

        ListModel {
            id: imageModel
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
            ListElement {
                user: "涂健武"
                time:"2014-2-4"
            }
        }

        model: imageModel
        delegate: Item {
            width: 80; height: 130;

            Rectangle {
                anchors.fill: parent;
                color: "red"
            }
            Rectangle {
                id: imgTitle
                width: parent.width; height: 20
                anchors.bottom: parent.bottom;
                color:"black"
                opacity: 0.4
            }

            Text {
                anchors.left: imgTitle.left;anchors.leftMargin: 4
                anchors.verticalCenter: imgTitle.verticalCenter
                text:time
                font.pixelSize: 11
                color:"white"
                font.family: "微软雅黑"
            }

        }

    }
}
