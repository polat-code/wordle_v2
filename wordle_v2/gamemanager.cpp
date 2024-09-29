#include "gamemanager.h"
#include "letterwithcolor.h"

GameManager::GameManager(QObject *parent) : QObject(parent)
{

}

void GameManager::startAGame()
{

}

bool GameManager::checkWordWhetherInWordList(QString word)
{
    return true;
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


