#include "letterwithcolor.h"

LetterWithColor::LetterWithColor(QObject *parent) : QObject(parent),
    m_letter(""), m_color(BackgroundColor::GRAY)
{

}

QString LetterWithColor::letter()
{
    return m_letter;
}

void LetterWithColor::setLetter(QString my_letter)
{
    if(my_letter != m_letter) {
        m_letter = my_letter;
        emit letterChanged();
    }
}

LetterWithColor::BackgroundColor LetterWithColor::color()
{
    return m_color;
}

void LetterWithColor::setColor(LetterWithColor::BackgroundColor my_color)
{
    if(my_color != m_color) {
        m_color = my_color;
        emit colorChanged();
    }
}
