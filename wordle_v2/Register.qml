import QtQuick 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Page {

    anchors.fill: parent
    signal requestPageChange(string page);

    property bool isNotificationVisible: false

    property string name: "";
    property string surname: "";
    property string email: "";
    property string telephone: "";
    property string password: "";
    property string passwordRepeat: "";

    function checkFields() {
        if(name !== "" &&
                surname !== "" &&
                email !== "" &&
                telephone !== "" &&
                password !== "" &&
                passwordRepeat !== "" &&
                password === passwordRepeat

          ) {
            return true;
        }
        return false;
    }




    Column{
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            width: 505
            height: 20
        }

        RegisterHeader {

        }

        Rectangle {
            width: 505
            height: 44
        }

        InputFieldWithLabel{
            id: nameInputFieldInRegisterId
            labelName: "Name"
            isFocus: true
            onGetTextInputResult: {
                if(text !== ""){
                     name = text;
                     isNotificationVisible = false
                }else {
                    // Notify user.
                    isNotificationVisible = true
                    notificationTextId.text = "Name cannot be empty"
                }

                //console.log("Name : " + text)
            }
        }
        InputFieldWithLabel{
            labelName: "Surname"
            onGetTextInputResult: {
                if(text !== ""){
                     surname = text;
                    isNotificationVisible = false
                }else {
                    // Notify user.
                    isNotificationVisible = true
                    notificationTextId.text = "Surname cannot be empty"

                }

                //console.log("Surname : " + text)
            }

        }
        InputFieldWithLabel{
            labelName: "Email"
            onGetTextInputResult: {
                if(text !== ""){
                     email = text;
                     isNotificationVisible = false
                }else {
                    // Notify user.
                    isNotificationVisible = true
                    notificationTextId.text = "Email cannot be empty"
                }
                //console.log("Email : " + text)
            }

        }
        InputFieldWithLabel{
            labelName: "Telephone"
            onGetTextInputResult: {
                if(text !== ""){
                     telephone = text;
                    isNotificationVisible = false
                }else {
                    // Notify user.
                    isNotificationVisible = true
                    notificationTextId.text = "Telephone cannot be empty"
                }

                //console.log("Telephone : " + text)
            }

        }
        InputFieldWithLabel{
            labelName: "Password"
            onGetTextInputResult: {
                if(text !== ""){
                     password = text;
                    isNotificationVisible = false
                }else {
                    // Notify user.
                    isNotificationVisible = true
                    notificationTextId.text = "Password cannot be empty"
                }

                //console.log("Telephone : " + text)
            }

        }
        InputFieldWithLabel{
            labelName: "Repeat Password"
            onGetTextInputResult: {
                if(text !== "" && password === text){
                     passwordRepeat = text;
                    isNotificationVisible = false;
                }else {
                    // Notify user.
                    isNotificationVisible = true;
                    notificationTextId.text = "Password cannot be empty and passwords should be the same"
                }

                //console.log("Telephone : " + text)
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



        Row{
            spacing: 30
            anchors.horizontalCenter: parent.horizontalCenter
            StyledButton {
                color: "#6AAA64"
                text: "Register"

                onButtonClicked: {
                    var isValidProperties = checkFields();
                    console.log(isValidProperties);
                    if(isValidProperties) {
                        // Register User
                        isNotificationVisible = false;
                        UserManager.registerUser(name,surname,email,telephone,password);
                        requestPageChange("mainPageWithoutLogin");

                    }else {
                        isNotificationVisible = true;
                        notificationTextId.text = "Please fill all fields properly"

                    }
                }
            }
            StyledButton {
                color: "#000000"
                text: "Back to Main Page"
                onButtonClicked: {
                    requestPageChange("mainPageWithoutLogin")
                }
            }

        }


    }
    Component.onCompleted: {
           nameInputFieldInRegisterId.forceActiveFocus(); // Focus on email field on load
       }


}
