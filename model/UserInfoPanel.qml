import QtQuick 2.0

Rectangle {
    color: "gray"

    Column {
        id:contentArea
        anchors.fill: parent;
        anchors.topMargin: 45; anchors.bottomMargin: 20;
        anchors.margins: 8
        spacing: 18

        Column {

            Text {
                text: "涂健武"
            }

            Rectangle {
                width:60; height: 60;
                color: "red"
            }
        }

        Column {
            Text {
                text: "某某某"
            }

            Rectangle {
                width:60; height: 60;
                color: "red"
            }
        }

    }

    Column {
        anchors.bottom: contentArea.bottom
        Text {
            text: "爱情保鲜剂"
        }

        Text {
            width: contentArea.width
            text:"包容，没有谁是十全十美，两个人在一起，就是互相包容。《心灵捕手》中西恩描绘妻子放屁的表情，不是嫌弃，不是不堪，那是一种对另一方的缺点的包容与宠溺，是她的缺点只有我知道的占有的荣耀。正是缺点才铸就了每个独一无二的人，才决定了允许谁进入自己的世界。"
            wrapMode: Text.WrapAnywhere
        }
    }
}
