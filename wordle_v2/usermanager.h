#ifndef USERMANAGER_H
#define USERMANAGER_H

#include <QObject>
#include "databasemanager.h"

class UserManager : public QObject
{
    Q_OBJECT
public:
    explicit UserManager(DatabaseManager &dbManager);

    Q_INVOKABLE bool registerUser(const QString &name,const QString &surname,const QString &email,const QString &telephone,const QString &password);
    Q_INVOKABLE QString loginUser(const QString &email, const QString &password);
signals:


private:
    DatabaseManager databaseManager;

};

#endif // USERMANAGER_H
