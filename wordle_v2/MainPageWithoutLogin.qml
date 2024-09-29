import QtQuick 2.14
import QtQuick.Controls 2.12

Page {
    anchors.fill: parent
    signal requestPageChange(string page);

    Column{
        anchors.horizontalCenter: parent.horizontalCenter

        // Top Margin
        Rectangle {
            id: mainPageWithoutLogiTtopMargin
            width: 505
            height: 50
        }
        WordleLogo {}


        WordleGameHeader {}

        MainPageIntroSentence{}

        Rectangle {
            width: parent.implicitWidth
            height: 30
        }

        Row {

            spacing: 20
            StyledButton {
                color: "#6AAA64"
                text: "Play without login"
                customWidth: 200
                onButtonClicked: {
                    requestPageChange("gamePage");
                }

            }
            StyledButton {
                color: "#D1B036"
                text: "Login"
                customWidth: 200
                onButtonClicked: {
                    //console.log("hello")
                    requestPageChange("loginPage")
                }
            }
            StyledButton {
                color: "#000000"
                text: "Register"
                customWidth: 200
                onButtonClicked: {
                    //console.log("hello")
                    requestPageChange("registerPage")
                }
            }
        }

        Rectangle {
            width: 505
            height: 80
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter

            width: 505
            height: 29
            Column{
                spacing: 30
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: whatIsWordleGameTextId
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "What is Wordle Game ?"
                    font.pointSize: 24

                }


                Text {
                    id:wordleGameInfo
                    width: 500
                    wrapMode: Text.Wrap
                    font.pointSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: false
                    text: "Wordle is a popular word puzzle game where players try to guess a hidden five-letter word in six attempts. With each guess, the game provides feedback by highlighting correct letters in green if they're in the right position, yellow if they're in the word but misplaced, and gray if they're not in the word at all."
                }

            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    wordleGameInfo.visible = !wordleGameInfo.visible
                }

                onEntered: {
                    whatIsWordleGameTextId.color = "red"  // Change color when mouse enters the area
                    whatIsWordleGameTextId.font.bold = true
                    whatIsWordleGameTextId.font.underline = true
                }

                onExited: {
                    whatIsWordleGameTextId.color = "black"  // Revert color when mouse leaves the area
                    whatIsWordleGameTextId.font.bold = false
                    whatIsWordleGameTextId.font.underline = false
                }
            }




        }




    }



}
