#ifndef LETTERWITHCOLOR_H
#define LETTERWITHCOLOR_H

#include <QObject>

class LetterWithColor : public QObject
{
    Q_OBJECT
public:
    enum BackgroundColor {
        YELLOW,
        GREEN,
        GRAY
    };

    Q_PROPERTY(QString letter READ letter WRITE setLetter NOTIFY letterChanged)
    Q_PROPERTY(BackgroundColor color READ color WRITE setColor NOTIFY colorChanged)

    Q_ENUM(BackgroundColor);
    explicit LetterWithColor(QObject *parent = nullptr);

    QString letter();
    void setLetter(QString my_letter);

    BackgroundColor color();
    void setColor(BackgroundColor my_color);


signals:

    void letterChanged();
    void colorChanged();


private:
    QString m_letter;
    BackgroundColor m_color;

};

#endif // LETTERWITHCOLOR_H
