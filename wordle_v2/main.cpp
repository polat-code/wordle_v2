#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databasemanager.h"
#include "usermanager.h"
#include "gamemanager.h"
#include "letterwithcolor.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // Initiliaze the database and userManager
    DatabaseManager dbManager("test01_wordle_db.db");
    UserManager userManager(dbManager);

    LetterWithColor letterWithColor1;
    letterWithColor1.setLetter("A");
    qDebug() << letterWithColor1.letter();

    LetterWithColor letterWithColor2;
    letterWithColor2.setLetter("b");
    qDebug() << letterWithColor2.letter();

    LetterWithColor letterWithColor3;
    letterWithColor3.setLetter("e");
    qDebug() << letterWithColor3.letter();

    LetterWithColor letterWithColor4;
    LetterWithColor letterWithColor5;


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty("UserManager",&userManager);





    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
