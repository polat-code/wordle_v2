import QtQuick 2.14

Rectangle {
    id: buttonRectId


    property color buttonColor: buttonRectId.color;
    property string text: buttonTextId.text
    property int customWidth: 224
    signal buttonClicked();


    width: buttonRectId.customWidth
    height: 50
    radius: 13

    Text {
        id: buttonTextId
        anchors.centerIn: parent
        text: buttonRectId.text
        color: "white"
        font.pointSize: 20

    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            buttonRectId.buttonClicked();
        }
        onEntered: {
            buttonTextId.color = buttonColor
            buttonRectId.border.color = buttonColor
            buttonRectId.border.width = 2
            buttonRectId.color = "white"
        }

        onExited: {
            buttonRectId.color = buttonTextId.color
            buttonTextId.color = "white"
        }

    }

}
