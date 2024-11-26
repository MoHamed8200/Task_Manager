// #ifndef DATABASE_H
// #define DATABASE_H

// #include <QObject>
// #include <QQmlEngine>

// class Database : public QObject
// {
//     Q_OBJECT
//     QML_ELEMENT
// public:
//     explicit Database(QObject *parent = nullptr);

// signals:

// };

// #endif // DATABASE_H
// #include <QCoreApplication>
// #include <QtSql>
// #include <QDebug>

// class Database : public QObject
// {
//     Q_OBJECT
// public:
//     explicit Database(QObject *parent = nullptr)
//         : QObject(parent)
//     {
//         // Open SQLite database
//         db = QSqlDatabase::addDatabase("QSQLITE");
//         db.setDatabaseName("mydatabase.db");

//         if (!db.open()) {
//             qWarning() << "Failed to open database!";
//         } else {
//             qDebug() << "Database opened successfully!";
//         }
//     }

//     Q_INVOKABLE bool createTable() {
//         QSqlQuery query;
//         query.exec("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)");

//         return query.isValid();
//     }

//     Q_INVOKABLE bool insertUser(const QString &name) {
//         QSqlQuery query;
//         query.prepare("INSERT INTO users (name) VALUES (:name)");
//         query.bindValue(":name", name);
//         return query.exec();
//     }

//     Q_INVOKABLE QVariantList getUsers() {
//         QVariantList users;
//         QSqlQuery query("SELECT * FROM users");
//         while (query.next()) {
//             users.append(query.value("name").toString());
//         }
//         return users;
//     }

// private:
//     QSqlDatabase db;
// };

#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariantList>

class Database : public QObject
{
    Q_OBJECT
public:
    explicit Database(QObject *parent = nullptr);
    ~Database();

    Q_INVOKABLE bool createTable();
    Q_INVOKABLE bool insertTask(const QString &taskName, const QString &deadline);
    Q_INVOKABLE QVariantList getTasks();

private:
    QSqlDatabase db;
};

#endif // DATABASE_H
