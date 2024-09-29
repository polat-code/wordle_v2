import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12

Window {
    visible: true
    width: Screen.width

    height: Screen.height
    title: qsTr("Wordle Game")




    Loader {
            id: pageLoader
            anchors.fill: parent
            sourceComponent: mainPageWithoutLogin

            property string userNameAndSurname: ""
        }

        // Handle signals from pages
        function switchToPage(page) {
            if (page === "mainPageWithoutLogin") {
                pageLoader.sourceComponent = mainPageWithoutLogin;
            } else if (page === "loginPage") {
                pageLoader.sourceComponent = loginPage;
            } else if (page === "gamePage") {
                pageLoader.sourceComponent = gamePage;
                GameManager.startAGame();
            } else if (page === "mainPageWithLogin") {
                pageLoader.sourceComponent = mainPageWithLogin;
            } else if (page === "registerPage") {
                pageLoader.sourceComponent = registerPage;
            }
        }

        // Load each page dynamically as a Component
        Component {
            id: mainPageWithoutLogin
            MainPageWithoutLogin {
                onRequestPageChange: switchToPage(page)
            }
        }

        Component {
            id: loginPage
            Login {
                onRequestPageChange: switchToPage(page)
                onSendFullName: {
                    userNameAndSurname = fullName;
                }
            }

        }

        Component {
            id: gamePage
            Game {
                onRequestPageChange: switchToPage(page)
            }
        }

        Component {
            id: mainPageWithLogin
            MainPageWithLogin {
                onRequestPageChange: switchToPage(page)
                userFullName :userNameAndSurname

            }
        }

        Component {
            id: registerPage
            Register {
                onRequestPageChange: switchToPage(page)
            }
        }




}
