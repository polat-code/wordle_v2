#include "gamemanager.h"
#include "letterwithcolor.h"
#include <QDebug>

GameManager::GameManager(QObject *parent) : QObject(parent), m_word("")
{

}

void GameManager::startAGame()
{

    // Get a random word from wordManager
    QString randomWord = "hello";
    m_word = randomWord.toUpper();

   //qDebug() << "m_word is : " + m_word;

}

bool GameManager::checkWordWhetherInWordList(QString word)
{
    // Check the word from wordManager.
    const QStringList wordList = {"apple", "hello", "world", "raise", "grape", "space", "learn"};
    for(int i = 0;i < wordList.length(); i++) {
        if(word.toUpper() == wordList[i].toUpper()) {
            return true;
        }
    }

    return false;
}

QVector<LetterWithColor *> GameManager::checkSimilarity(QString word)
{


}

void GameManager::finishTheGame()
{

}

bool GameManager::checkGameIsOverOrNoT(const LetterWithColor &userColoredWord)
{

}

QString GameManager::word()
{
    return m_word;

}

void GameManager::setWord(QString my_word)
{
    if(my_word != m_word) {
        m_word = my_word;
        emit wordChanged();
    }
}


