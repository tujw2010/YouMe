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
        State {
            name: "normal"
        }
    ]

    Text {
        text:"空间"
    }
}
