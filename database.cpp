
#include "database.h"
#include <QSqlQuery>
#include <QVariantList>
#include <QDebug>

Database::Database(QObject *parent) : QObject(parent)
{
    // Initialize SQLite database
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("StickyNotesDB.db");

    if (!db.open()) {
        qWarning() << "Failed to open database!";
    } else {
        qDebug() << "Database opened successfully!";
         createTable();
    }
}

Database::~Database()
{
    db.close();
}

bool Database::createTable()
{
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS Tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, deadline TEXT)");
    return query.isValid();
}

bool Database::insertTask(const QString &taskName, const QString &deadline)
{
    QSqlQuery query;
    query.prepare("INSERT INTO Tasks (name, deadline) VALUES (:name, :deadline)");
    query.bindValue(":name", taskName);
    query.bindValue(":deadline", deadline);
    return query.exec();
}

QVariantList Database::getTasks()
{
    QVariantList tasks;
    QSqlQuery query("SELECT * FROM Tasks");
    while (query.next()) {
        QVariantMap task;
        task["taskId"] = query.value("id").toInt();
        task["taskName"] = query.value("name").toString();
        task["deadline"] = query.value("deadline").toString();
        tasks.append(task);
    }
    return tasks;
}

bool Database::deleteTask(int taskId)
{
    QSqlQuery query;
    query.prepare("DELETE FROM Tasks WHERE id = :id");
    query.bindValue(":id", taskId);
    return query.exec();
}
