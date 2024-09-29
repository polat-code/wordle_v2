#ifndef GAMEMANAGER_H
#define GAMEMANAGER_H

#include <QObject>
#include "letterwithcolor.h"

class GameManager : public QObject
{
    Q_OBJECT
public:
    explicit GameManager(QObject *parent = nullptr);
    ~GameManager();  // Destructor to manage dynamic memory

    Q_PROPERTY(QString word READ word WRITE setWord NOTIFY wordChanged)

    Q_INVOKABLE void startAGame();
    Q_INVOKABLE bool checkWordWhetherInWordList(QString word);
    Q_INVOKABLE QVector<LetterWithColor*> checkSimilarity(QString word);
    Q_INVOKABLE void finishTheGame();
    Q_INVOKABLE bool checkGameIsOverOrNoT(QVector<LetterWithColor*> userColoredWord);

    QString word();
    void setWord(QString my_word);

signals:
    void wordChanged();

private:
    QString m_word;

};

#endif // GAMEMANAGER_H
