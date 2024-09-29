import QtQuick 2.14

Rectangle {

    width: 505
    height: 58
    //color: "red"
    anchors.horizontalCenter: parent.horizontalCenter
    Row {
       id: wordleGameHeaderId
       anchors.centerIn: parent
       anchors.horizontalCenter: parent.horizontalCenter
       Text {
           text: "W"
           font.pixelSize: 48
           color: "#6AAA64"   // Green color
       }

       Text {
           text: "or"
           font.pixelSize: 48
           color: "#000000"  // Black color
       }

       Text {
           text: "d"
           font.pixelSize: 48
           color: "#D1B036"  // Yellow color
       }

       Text {
           text: "le"
           font.pixelSize: 48
           color: "#000000"  // Black color
       }

       Text {
           text: " G"
           font.pixelSize: 48
           color: "#6AAA64"   // Green color
       }
       Text {
           text: "a"
           font.pixelSize: 48
           color: "#D1B036"  // Yellow color
       }
       Text {
           text: "me"
           font.pixelSize: 48
           color: "#000000"  // Black color
       }

    }
}
