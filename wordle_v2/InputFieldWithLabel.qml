import QtQuick 2.14
import QtQuick.Window 2.14

Rectangle {
    width: 505
    height: 86

    property string labelName : textInputLabelId.text
    property string textInputResult: ""
    property bool isFocus: textInputId.focus

    signal getTextInputResult(string text);

    Column{
        spacing: 10
        Text {
            id:textInputLabelId
            text: labelName
            font.pointSize: 20
        }

        Rectangle {
            id: textInputRectTextId
            color: "white"
            width: 505
            height: 40
            border.color: "black"
            border.width: 2
            radius: 10

            TextEdit {
                id: textInputId
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter:parent.verticalCenter
                text: ""
                onTextChanged: {
                    getTextInputResult(textInputId.text);
                }
            }

            MouseArea {
               anchors.fill: parent
               onClicked: {
                   textInputId.focus = true
               }
           }
        }
    }
}

