import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
// login.qml

Page {

    anchors.fill: parent
    signal requestPageChange(string page);
    signal sendFullName(string fullName);

    property string email: ""
    property string password: ""
    property bool isNotificationVisible: false;

    Column {
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 505
            height: 200
        }

        LoginHeader {}

        Rectangle {
            width: 505
            height: 44
        }

        InputFieldWithLabel {
            id: emailInputFieldInLoginId
            labelName: "Email"
            isFocus: true
            onGetTextInputResult: {
                email = text;
            }
        }

        InputFieldWithLabel {
            id: passwordInputFieldInLoginId
            labelName: "Password"
            isFocus: false
            onGetTextInputResult: {
                password = text;
            }
        }

        Rectangle {
            width: 505
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: notificationTextId
                text: ""
                visible: isNotificationVisible
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 16
            }
        }

        Row {
            spacing: 30
            anchors.horizontalCenter: parent.horizontalCenter

            StyledButton {
                color: "#6AAA64"
                text: "Login"
                onButtonClicked: {
                    passwordInputFieldInLoginId.isFocus = false;
                    emailInputFieldInLoginId.isFocus = false;
                    console.log("Email in login.qml : " + email);
                    console.log("Password in login.qml : " + password);

                    var nameAndSurname = UserManager.loginUser(email, password);
                    if (nameAndSurname === "") {
                        isNotificationVisible = true;
                        notificationTextId.text = "There is no such user!";
                    } else {
                        isNotificationVisible = false;
                        sendFullName(nameAndSurname);
                        requestPageChange("mainPageWithLogin");
                    }
                }
            }

            StyledButton {
                color: "#000000"
                text: "Back to Main Page"
                onButtonClicked: {
                    requestPageChange("mainPageWithoutLogin");
                }
            }
        }
    }

    Component.onCompleted: {
        emailInputFieldInLoginId.forceActiveFocus(); // Set focus to the email input field when the page is loaded
    }
}

