import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "Component"

Rectangle {
    color: "gray"

    MenuBar {
        id:menuBar
        anchors.fill: parent
        property int previousIndex: 0

        onPageChange: {

            if(previousIndex + 1 == index || previousIndex == menuList.count - 1 && index == 0) {
                stackView.delegate = rightToLeftDelegate;
            } else {
                stackView.delegate = leftToRightDelegate;
            }

            switch (index) {
            case 0:
                stackView.push(userInfo)
                break;
            case 1:
                stackView.push(zonePanel)
                break;
            case 2:
                stackView.push(aboutPanel)
                break;
            }

            previousIndex = index;
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent;
        anchors.topMargin: 24

        initialItem:userInfo;

        UserInfoPanel{ id: userInfo; visible: false}
        ZonePanel {id:zonePanel; visible: false}
        AboutPanel {id:aboutPanel; visible: false}

        delegate: rightToLeftDelegate;

        StackViewDelegate {
            id: rightToLeftDelegate
            function transitionFinished(properties)
            {
                properties.exitItem.x = 0
            }

            property Component pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: enterItem.width
                    to: 0
                }
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: -exitItem.width
                }
            }
        }

        StackViewDelegate {
            id: leftToRightDelegate

            function transitionFinished(properties)
            {
                properties.enterItem.x = 0
            }

            property Component pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: exitItem.width
                }
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: -enterItem.width
                    to: 0
                }
            }
        }
    }
}
