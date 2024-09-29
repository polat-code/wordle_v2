#include "databasemanager.h"

DatabaseManager::DatabaseManager(const QString &dbName) : databaseName(dbName) {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(databaseName);
}


DatabaseManager::~DatabaseManager() {
    closeDatabase();
}

bool DatabaseManager::openDatabase() {
    if (!db.open()) {
        qDebug() << "Error: connection with database failed - " << db.lastError();
        return false;
    } else {
        qDebug() << "Database connected successfully!";
        return true;
    }
}

void DatabaseManager::closeDatabase() {
    if (db.isOpen()) {
        db.close();
    }
}
bool DatabaseManager::addUser(const QString &name,const QString &surname,const QString &email,const QString &telephone,const QString &password) {
    QSqlQuery query;
        QString createTable = "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, surname TEXT,email TEXT, telephone TEXT,password TEXT)";
        if (!query.exec(createTable)) {
            qDebug() << "Error creating table:" << query.lastError();
        } else {
            qDebug() << "Table created successfully!";
        }
    query.prepare("INSERT INTO users (name, surname,email,telephone,password ) VALUES (:name, :surname,:email,:telephone, :password)");
    query.bindValue(":name", name);
    query.bindValue(":surname", surname);
    query.bindValue(":email", email);
    query.bindValue(":telephone", telephone);
    query.bindValue(":password", password);

    if (!query.exec()) {
        qDebug() << "Error adding user:" << query.lastError();
        return false;
    } else {
        qDebug() << "User added successfully!";
        return true;
    }
}

QString DatabaseManager::findNameAndSurnameByEmailAndPassword(const QString &email, const QString &password) {
    QSqlQuery query;
    query.prepare("SELECT * FROM users WHERE email = :email AND password = :password LIMIT 1;");
    query.bindValue(":email", email);
    query.bindValue(":password", password);

    if (query.exec()) {
        // Check if the query found a result
        if (query.next()) {
            // Get the values of the found record (columns)
            int id = query.value(0).toInt();             // Assuming 'id' is in the first column
            QString name = query.value(1).toString();    // Assuming 'name' is in the second column
            QString surname = query.value(2).toString(); // Assuming 'surname' is in the third column

            // Print or use the values as needed
            //qDebug() << "User found:";
            //qDebug() << "ID:" << id;
            //qDebug() << "Name:" << name;
            //qDebug() << "Surname:" << surname;
            return name + " " + surname;
        } else {
            // No user found with the given email and password
            qDebug() << "No user found with the given email and password.";
            return "";
        }
    } else {
        // If the query failed to execute, print the error
        qDebug() << "Error executing query:" << query.lastError().text();
        return "";
    }
}
