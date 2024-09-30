#include "gamemanager.h"
#include "letterwithcolor.h"
#include <QDebug>
#include <QVariantList>

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
QVariantList GameManager::checkSimilarity(QString word)
{
    QVariantList result;

    if (word.size() != m_word.size()) {
        qDebug() << "Invalid word length!";
        return result;
    }

    // Make both uppercase.
    QString userWord = word.toUpper();
    QString searchWord = m_word.toUpper();

    qDebug() << "TargetWord  : " + searchWord;
    qDebug() << "userWord  : " + userWord;

    // To track which letters have already been matched as green or yellow.
    QVector<bool> searchWordMatched(searchWord.size(), false);
    QVector<bool> userWordMatched(userWord.size(), false);

    // Initialize result with "gray" by default.
    for (int i = 0; i < userWord.size(); ++i) {
        result.append("gray");  // Initialize each element as "gray"
    }

    // First pass: Check for "green" (correct position).
    for (int i = 0; i < userWord.size(); ++i) {
        if (userWord[i] == searchWord[i]) {
            result[i] = "green";  // Update to "green"
            searchWordMatched[i] = true;  // Mark this position as matched in the search word
            userWordMatched[i] = true;  // Mark this position as matched in the user word
        }
    }

    // Second pass: Check for "yellow" (correct letter, wrong position).
    for (int i = 0; i < userWord.size(); ++i) {
        if (result[i] == "green") {
            continue;  // Skip already matched greens
        }

        bool foundYellow = false;
        for (int j = 0; j < searchWord.size(); ++j) {
            if (!searchWordMatched[j] && !userWordMatched[i] && userWord[i] == searchWord[j]) {
                result[i] = "yellow";  // Update to "yellow"
                searchWordMatched[j] = true;  // Mark this position as matched in the search word
                foundYellow = true;
                break;
            }
        }

        if (!foundYellow) {
            result[i] = "gray";  // Keep as "gray" if no match is found
        }
    }

    return result;
}


void GameManager::finishTheGame()
{
    m_word = "";
}

bool GameManager::checkGameIsOverOrNoT(QVariantList colorList)
{
    for(int i = 0;i < colorList.size();i++) {
        if(colorList.at(i) != "green") {
            return false;
        }
    }
    return true;
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


