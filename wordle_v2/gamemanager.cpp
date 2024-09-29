#include "gamemanager.h"
#include <QDebug>

GameManager::GameManager(QObject *parent) : QObject(parent), m_word("")
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

