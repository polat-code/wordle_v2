import QtQuick 2.14

Rectangle {
    width: 505
    height: 410
    anchors.horizontalCenter: parent.horizontalCenter

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        GameBoxRow {
            id:firstGameBoxRowId
            isInfoVisible: true
            isBoxClickable: true
            onPassNextRow: {
                firstGameBoxRowId.isInfoVisible = false;
                firstGameBoxRowId.isBoxClickable = false;
                secondGameBoxRowId.isInfoVisible = true
                secondGameBoxRowId.isBoxClickable = true;
            }
        }
        GameBoxRow {
            id:secondGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                secondGameBoxRowId.isInfoVisible = false;
                secondGameBoxRowId.isBoxClickable = false;
                thirdGameBoxRowId.isInfoVisible = true
                thirdGameBoxRowId.isBoxClickable = true;
            }
        }
        GameBoxRow {
            id:thirdGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                thirdGameBoxRowId.isInfoVisible = false;
                thirdGameBoxRowId.isBoxClickable = false;
                fourthGameBoxRowId.isInfoVisible = true
                fourthGameBoxRowId.isBoxClickable = true;
            }
        }
        GameBoxRow {
            id:fourthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                fourthGameBoxRowId.isInfoVisible = false;
                fourthGameBoxRowId.isBoxClickable = false;
                fifthGameBoxRowId.isInfoVisible = true
                fifthGameBoxRowId.isBoxClickable = true;
            }
        }
        GameBoxRow {
            id:fifthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                fifthGameBoxRowId.isInfoVisible = false;
                fifthGameBoxRowId.isBoxClickable = false;
                sixthGameBoxRowId.isInfoVisible = true
                sixthGameBoxRowId.isBoxClickable = true;
            }
        }
        GameBoxRow {
            id:sixthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                sixthGameBoxRowId.isInfoVisible = false;
                sixthGameBoxRowId.isBoxClickable = false;

            }
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
