#include "usermanager.h"


UserManager::UserManager(DatabaseManager &dbManager):databaseManager(dbManager)
{
    databaseManager.openDatabase();

}

bool UserManager::registerUser(const QString &name, const QString &surname, const QString &email, const QString &telephone, const QString &password)
{
    // TODO Check the user already registers  or not.

    return databaseManager.addUser(name, surname, email, telephone, password);
}

QString UserManager::loginUser(const QString &email, const QString &password)
{
    return  databaseManager.findNameAndSurnameByEmailAndPassword(email,password);
}


