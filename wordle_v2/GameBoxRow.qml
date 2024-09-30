import QtQuick 2.14

Row {
    width: 505
    height: 77
    spacing: 8
    anchors.horizontalCenter: parent.horizontalCenter
    property string resultValue: ""
    property string letter1: ""
    property string letter2: ""
    property string letter3: ""
    property string letter4: ""
    property string letter5: ""
    property bool isInfoVisible: false
    property bool isBoxClickable: false


    signal passNextRow();


    Rectangle{

       id: gameBox1Id
       width: 75
       height: 75
       color: "#3A3A3C"
       border.color: "#3A3A3C"
       border.width: 2
       radius: 10
       TextInput {
           id: gameBox1LetterId
           maximumLength: 1
           color: "white"
           font.pointSize: 40
           width: 75
           height: 75
           focus: isBoxClickable
           horizontalAlignment: TextInput.AlignHCenter
           verticalAlignment: TextInput.AlignVCenter
           onTextChanged: {
                gameBox1LetterId.text = gameBox1LetterId.text.toUpperCase()
                letter1 = gameBox1LetterId.text
           }
           MouseArea {
               anchors.fill: parent

               onClicked: {
                   gameBox1LetterId.focus = isBoxClickable && true
               }
           }

       }
    }



    Rectangle{
       id: gameBox2Id
       width: 75
       height: 75
       color: "#3A3A3C"
       border.color: "#3A3A3C"
       border.width: 2
       radius: 10
       TextInput {
           id: gameBox2LetterId
           maximumLength: 1
           color: "white"
           font.pointSize: 40
           width: 75
           height: 75
           focus: true
           horizontalAlignment: TextInput.AlignHCenter
           verticalAlignment: TextInput.AlignVCenter


           onTextChanged: {
                gameBox2LetterId.text = gameBox2LetterId.text.toUpperCase();
                letter2 = gameBox2LetterId.text
           }

           MouseArea {
               anchors.fill: parent
               onClicked: {
                   gameBox2LetterId.focus = isBoxClickable && true
               }
           }

       }
    }

    Rectangle{
       id: gameBox3Id
       width: 75
       height: 75
       color: "#3A3A3C"
       border.color: "#3A3A3C"
       border.width: 2
       radius: 10
       TextInput {
           id: gameBox3LetterId
           maximumLength: 1
           color: "white"
           font.pointSize: 40
           width: 75
           height: 75
           focus: true
           horizontalAlignment: TextInput.AlignHCenter
           verticalAlignment: TextInput.AlignVCenter
           onTextChanged: {
               gameBox3LetterId.text = gameBox3LetterId.text.toUpperCase()
                letter3 = gameBox3LetterId.text
           }
           MouseArea {
               anchors.fill: parent

               onClicked: {
                   gameBox3LetterId.focus = isBoxClickable && true
               }
           }

       }
    }

    Rectangle{
       id: gameBox4Id
       width: 75
       height: 75
       color: "#3A3A3C"
       border.color: "#3A3A3C"
       border.width: 2
       radius: 10
       TextInput {
           id: gameBox4LetterId
           maximumLength: 1
           color: "white"
           font.pointSize: 40
           width: 75
           height: 75
           focus: true
           horizontalAlignment: TextInput.AlignHCenter
           verticalAlignment: TextInput.AlignVCenter
           onTextChanged: {
               gameBox4LetterId.text = gameBox4LetterId.text.toUpperCase()
                letter4 = gameBox4LetterId.text
           }
           MouseArea {
               anchors.fill: parent

               onClicked: {
                   gameBox4LetterId.focus = isBoxClickable && true
               }
           }

       }
    }
    Rectangle {
        id: gameBox5Id
        width: 75
        height: 75
        color: "#3A3A3C"
        border.color: "#3A3A3C"
        border.width: 2
        radius: 10

        TextInput {
            id: gameBox5LetterId
            maximumLength: 1
            color: "white"
            font.pointSize: 40
            width: 75
            height: 75
            focus: true
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter

            onTextChanged: {
                gameBox5LetterId.text = gameBox5LetterId.text.toUpperCase()
                letter5 = gameBox5LetterId.text
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    gameBox5LetterId.focus = isBoxClickable && true
                }
            }
        }
    }


    Rectangle{
       id: gameRowInfoId
       width: gameRowInfoTextId.implicitWidth
       height: gameRowInfoTextId.implicitHeight
       visible: isInfoVisible
       anchors.verticalCenter: parent.verticalCenter

       Row {
           id: gameRowInfoTextId
           anchors.verticalCenter: parent.verticalCenter


           StyledButton {
               color: "#6AAA64"
               text: "Check"
               onButtonClicked: {
                   var data =  GameManager.checkSimilarity(letter1 + letter2 + letter3 + letter4 + letter5)
                   var isGameOver = GameManager.checkGameIsOverOrNoT(data);

                   gameBox1Id.color = data[0] === "green" ? "#6AAA64" : (data[0] === "yellow" ? "#D1B036": "#3A3A3C");

                   gameBox2Id.color = data[1] === "green" ? "#6AAA64" : (data[1] === "yellow" ? "#D1B036": "#3A3A3C");
                   gameBox3Id.color = data[2] === "green" ? "#6AAA64" : (data[2] === "yellow" ? "#D1B036": "#3A3A3C");
                   gameBox4Id.color = data[3] === "green" ? "#6AAA64" : (data[3] === "yellow" ? "#D1B036": "#3A3A3C");
                   gameBox5Id.color = data[4] === "green" ? "#6AAA64" : (data[4] === "yellow" ? "#D1B036": "#3A3A3C");

                   if(isGameOver) {
                       console.log("Game is over")
                   }else {
                       passNextRow();
                   }

               }
               customWidth: 90

           }

           // Margin
           Rectangle{
               height: gameRowInfoTextId.implicitHeight
               width: 10
           }

            Row {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: qsTr("To write a letter in a box,  ")
                    font.pointSize: 16
                }
                Text {
                    text: qsTr("Click")
                     font.bold: true
                     font.pointSize: 16
                     font.underline: true
                }
                Text {
                    text: qsTr(" the box")
                    font.pointSize: 16
                }

            }

       }




    }


}
