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



    gameManager.startAGame();
    qDebug() << gameManager.checkWordWhetherInWordList("eager");
    qDebug() << gameManager.checkSimilarity("eager");

/*
    // Test case 1: Exact match
    QString guess1 = "HELLO";
    qDebug() << "Testing with guess:" << guess1;
    QVector<LetterWithColor *> result1 = gameManager.checkSimilarity(guess1);



    // Test case 2: Partial match
    QString guess2 = "HOLLY";
    qDebug() << "Testing with guess:" << guess2;
    QVector<LetterWithColor *> result2 = gameManager.checkSimilarity(guess2);


    // Test case 3: No match
    QString guess3 = "EGGER";
    qDebug() << "Testing with guess:" << guess3;
    QVector<LetterWithColor *> result3 = gameManager.checkSimilarity(guess3);
    qDebug() << "Testing with guess:" << result3[0]->color();

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

    */

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
