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
    QVector<LetterWithColor *> result;

    if (word.size() != m_word.size()) {
        qDebug() << "Invalid word length!";
        return result;
    }

    // Track letter usage in the target word using QString instead of QChar
    QMap<QString, int> letterUsage;

    // Step 1: Count the occurrences of each letter in the target word
    for (int i = 0; i < m_word.size(); ++i) {
        QString targetLetter = m_word[i].toUpper();
        letterUsage[targetLetter]++;
    }

    // Step 2: First pass - find all exact matches (GREEN)
    QVector<bool> matchedExact(word.size(), false);  // Track exact matches

    for (int i = 0; i < word.size(); ++i) {
        QString guessedLetter = word[i].toUpper();
        QString targetLetter = m_word[i].toUpper();

        LetterWithColor *letterWithColor = new LetterWithColor;
        letterWithColor->setLetter(guessedLetter);

        if (guessedLetter == targetLetter) {
            // Exact match
            letterWithColor->setColor(LetterWithColor::GREEN);
            matchedExact[i] = true; // Mark this position as an exact match
            letterUsage[targetLetter]--; // Decrease usage count
        }

        result.append(letterWithColor); // Add the letter to the result
    }

    // Step 3: Second pass - handle partial matches (YELLOW) and non-matches (GRAY)
    for (int i = 0; i < word.size(); ++i) {
        if (matchedExact[i]) {
            continue; // Skip already matched letters
        }

        QString guessedLetter = word[i].toUpper();

        if (m_word.contains(guessedLetter) && letterUsage[guessedLetter] > 0) {
            // Partial match (YELLOW)
            result[i]->setColor(LetterWithColor::YELLOW);
            letterUsage[guessedLetter]--; // Decrease usage count
        } else {
            // No match (GRAY)
            result[i]->setColor(LetterWithColor::GRAY);
        }
    }

    return result;
}


void GameManager::finishTheGame()
{
    m_word = "";
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


