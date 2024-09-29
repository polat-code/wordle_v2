#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QString>
#include <QDebug>

class DatabaseManager
{
public:
    DatabaseManager(const QString &dbName);
    ~DatabaseManager();

    bool openDatabase();
    void closeDatabase();

    bool addUser(const QString &name,const QString &surname,const QString &email,const QString &telephone,const QString &password);
    QString findNameAndSurnameByEmailAndPassword(const QString &email, const QString &password);
private:
    QSqlDatabase db;
    QString databaseName;
};


#endif // DATABASEMANAGER_H
