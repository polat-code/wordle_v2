#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databasemanager.h"
#include "usermanager.h"
#include "gamemanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // Initiliaze the database and userManager
    DatabaseManager dbManager("test01_wordle_db.db");
    UserManager userManager(dbManager);
    GameManager gameManager;


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty("UserManager",&userManager);
    engine.rootContext()->setContextProperty("GameManager",&gameManager);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
