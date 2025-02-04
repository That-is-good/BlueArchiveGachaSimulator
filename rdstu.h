#ifndef RDSTU_H
#define RDSTU_H

#include <QObject>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QList>
#include <QRandomGenerator>
#include "mystudent.h"

class rdStu : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int level READ getLevel WRITE setLevel);
    Q_PROPERTY(int index READ getIndex WRITE setIndex);

public:
    explicit rdStu(QObject *parent = nullptr);
    Q_INVOKABLE void initialisation(QString filep);
    Q_INVOKABLE int rand(int);
    int getLevel();
    void setLevel(const int &);
    int getIndex();
    void setIndex(const int &);
    Q_INVOKABLE int getSize();
    Q_INVOKABLE QString getCur(int);

private:
    QList<Mystudent> *stu;
    int stu_level = 0;
    int stu_index = 0;
    int stu_size = 0;
signals:
};

#endif // RDSTU_H
