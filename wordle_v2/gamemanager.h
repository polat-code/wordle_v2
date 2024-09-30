#ifndef GAMEMANAGER_H
#define GAMEMANAGER_H

#include <QObject>
#include "letterwithcolor.h"
#include <QVariantList>

class GameManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString word READ word WRITE setWord NOTIFY wordChanged)
public:
    explicit GameManager(QObject *parent = nullptr);

    Q_INVOKABLE void startAGame();
    Q_INVOKABLE bool checkWordWhetherInWordList(QString word);
    Q_INVOKABLE QVariantList checkSimilarity(QString word);
    Q_INVOKABLE void finishTheGame();
    Q_INVOKABLE bool checkGameIsOverOrNoT(QVariantList colorList); // Updated to pass by const reference

    QString word();
    void setWord(QString my_word);

signals:

    void wordChanged();

private:
    QString m_word;

};

#endif // GAMEMANAGER_H
