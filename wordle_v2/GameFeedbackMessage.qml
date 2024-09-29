import QtQuick 2.14

Rectangle {
    id: gameFeedbackMessageId
    width: 505
    height: 44
    anchors.horizontalCenter: parent.horizontalCenter

    // Define an enum for text colors within the QtObject
    QtObject {
        id: textColorsEnumTypeId
        property int danger: 0
        property int success: 1
    }

    // Message and text color properties
    property string message: "Message"
    property int textColor: textColorsEnumTypeId.Success

    Text {
        id: guessWordHeaderId
        text: qsTr(gameFeedbackMessageId.message)
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20

        // Use the enum value to determine the color
        color: gameFeedbackMessageId.textColor === textColorsEnumTypeId.danger ? "red" : "green"
    }
}
