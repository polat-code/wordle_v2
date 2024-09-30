import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Page {
    id: gamePageId
    anchors.fill: parent
    signal requestPageChange(string page);
    Column{
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 505
            height: 30
        }

        Rectangle {
            width: 505
            height: 44
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: guessWordHeaderId
                text: qsTr("Guess Word")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 36
            }
        }

        GameFeedbackMessage {
            id: gameFeedBackMessageId
            message: ""
        }

        GameRowsContainer {
            onSendAMessage: {
                gameFeedBackMessageId.message = message
                gameFeedBackMessageId.textColor = color;

            }
        }
    }

    Component.onCompleted: {
        gamePageId.forceActiveFocus(); // Set focus to the email input field when the page is loaded
    }

}
