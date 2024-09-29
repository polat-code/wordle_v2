import QtQuick 2.14

Rectangle {
    width: 505
    height: 410
    anchors.horizontalCenter: parent.horizontalCenter

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        GameBoxRow {
            isInfoVisible: true
            isBoxClickable: true
        }
        GameBoxRow {
            isInfoVisible: false
            isBoxClickable: false
        }
        GameBoxRow {
            isInfoVisible: false
            isBoxClickable: false
        }
        GameBoxRow {
            isInfoVisible: false
            isBoxClickable: false
        }
        GameBoxRow {
            isInfoVisible: false
            isBoxClickable: false
        }
        GameBoxRow {
            isInfoVisible: false
            isBoxClickable: false
        }

        Rectangle {
            width: 505
            height: 30
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 505
            height: 100
            Column {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: grayInfoTextId
                    text: "Gray: Not Match,"
                    color: "#3A3A3C"
                    font.pointSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: yellowInfoTextId
                    text: "Yellow : Word has the letter,"
                    color: "#D1B036"
                    font.pointSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: greenInfoTextId
                    text: "Green: Word has the letter in same position"
                    color: "#6AAA64"
                    font.pointSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }




}
