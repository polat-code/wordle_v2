import QtQuick 2.14

Rectangle {
    width: 505
    height: 410
    anchors.horizontalCenter: parent.horizontalCenter

    signal sendAMessage(string message,color color);

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        GameBoxRow {
            id:firstGameBoxRowId
            isInfoVisible: true
            isBoxClickable: true
            onPassNextRow: {
                firstGameBoxRowId.isInfoVisible = false;
                firstGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(!isGameOver){
                    secondGameBoxRowId.isInfoVisible = true
                    secondGameBoxRowId.isBoxClickable = true;
                }else {
                    sendAMessage("Congratulations! You find it!","green")
                }




            }
        }
        GameBoxRow {
            id:secondGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                secondGameBoxRowId.isInfoVisible = false;
                secondGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(!isGameOver){
                    thirdGameBoxRowId.isInfoVisible = true;
                    thirdGameBoxRowId.isBoxClickable = true;
                }else {
                    sendAMessage("Congratulations! You find it!","green")
                }

            }
        }
        GameBoxRow {
            id:thirdGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                thirdGameBoxRowId.isInfoVisible = false;
                thirdGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(!isGameOver){
                    fourthGameBoxRowId.isInfoVisible = true;
                    fourthGameBoxRowId.isBoxClickable = true;
                }else {
                    sendAMessage("Congratulations! You find it!","green")
                }

            }
        }
        GameBoxRow {
            id:fourthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                fourthGameBoxRowId.isInfoVisible = false;
                fourthGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(!isGameOver){
                    fifthGameBoxRowId.isInfoVisible = true
                    fifthGameBoxRowId.isBoxClickable = true;
                }else {
                    sendAMessage("Congratulations! You find it!","green")
                }

            }
        }
        GameBoxRow {
            id:fifthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                fifthGameBoxRowId.isInfoVisible = false;
                fifthGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(!isGameOver){
                    sixthGameBoxRowId.isInfoVisible = true
                    sixthGameBoxRowId.isBoxClickable = true;
                }else {
                    sendAMessage("Congratulations! You find it!","green")
                }

            }
        }
        GameBoxRow {
            id:sixthGameBoxRowId
            isInfoVisible: false
            isBoxClickable: false
            onPassNextRow: {
                sixthGameBoxRowId.isInfoVisible = false;
                sixthGameBoxRowId.isBoxClickable = false;
                var isGameOver = GameManager.checkGameIsOverOrNoT(data);
                if(isGameOver) {
                     sendAMessage("Congratulations! You find it!","green")
                }

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
