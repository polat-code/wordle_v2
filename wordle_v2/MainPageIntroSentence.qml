import QtQuick 2.14

Rectangle {
    width: 505
    height: 96
    //color: "red"
    anchors.horizontalCenter: parent.horizontalCenter

    Column {
         id:mainPageIntroSentenceContainerId
         anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id:mainPageIntroSentenceText1Id
            text: "Get 6 chances to guess"
            font.bold: true
            font.pointSize: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id:mainPageIntroSentenceText2Id
            text: "a 5-letter word"
            font.bold: true
            font.pointSize: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }


}


