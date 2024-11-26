

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
    Q_INVOKABLE bool deleteTask(int taskId);

private:
    QSqlDatabase db;
};

#endif // DATABASE_H
