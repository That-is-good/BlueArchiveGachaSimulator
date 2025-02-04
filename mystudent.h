#ifndef MYSTUDENT_H
#define MYSTUDENT_H

#include <QObject>
#include <QString>

class Mystudent : public QObject
{
    Q_OBJECT
public:
    explicit Mystudent(QObject *parent = nullptr);
    Mystudent(const Mystudent&);
    Mystudent& operator=(const Mystudent&);
    void initialisation(QString name, QString introduction, QString school, QString club, QString armytype,
                        QString weapon, QString birthday, QString academy, QString portrait, QString voice);
    QString getName();
    QString getIntroduction();
    QString getSchool();
    QString getClub();
    QString getArmytype();
    QString getWeapon();
    QString getBirthday();
    QString getAcademy();
    QString getPortrait();
    QString getVoice();
private:
    QString name;
    QString introduction;
    QString school;
    QString club;
    QString armytype;
    QString weapon;
    QString birthday;
    QString academy;
    QString portrait;
    QString voice;
signals:
};

//Q_DECLARE_METATYPE(Mystudent);
#endif // MYSTUDENT_H
