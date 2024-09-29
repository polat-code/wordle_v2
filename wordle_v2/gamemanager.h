#ifndef GAMEMANAGER_H
#define GAMEMANAGER_H

#include <QObject>
#include "letterwithcolor.h"

class GameManager : public QObject
{
    Q_OBJECT
public:
    explicit GameManager(QObject *parent = nullptr);

    Q_INVOKABLE void startAGame();
    Q_INVOKABLE bool checkWordWhetherInWordList(QString word);
    Q_INVOKABLE QVector<LetterWithColor *> checkSimilarity(QString word);
    Q_INVOKABLE void finishTheGame();
    Q_INVOKABLE bool checkGameIsOverOrNoT(const LetterWithColor& userColoredWord); // Updated to pass by const reference

signals:

};

#endif // GAMEMANAGER_H
