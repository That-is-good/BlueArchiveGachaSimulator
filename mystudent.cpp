#include "mystudent.h"

Mystudent::Mystudent(QObject *parent)
    : QObject{parent}
{}

Mystudent::Mystudent(const Mystudent & mystudent)
{
    this->name = mystudent.name;
    this->introduction = mystudent.introduction;
    this->school = mystudent.school;
    this->club = mystudent.club;
    this->armytype = mystudent.armytype;
    this->weapon = mystudent.weapon;
    this->birthday = mystudent.birthday;
    this->academy = mystudent.academy;
    this->portrait = mystudent.portrait;
    this->voice = mystudent.voice;
}

Mystudent &Mystudent::operator=(const Mystudent &mystudent)
{
    this->name = mystudent.name;
    this->introduction = mystudent.introduction;
    this->school = mystudent.school;
    this->club = mystudent.club;
    this->armytype = mystudent.armytype;
    this->weapon = mystudent.weapon;
    this->birthday = mystudent.birthday;
    this->academy = mystudent.academy;
    this->portrait = mystudent.portrait;
    this->voice = mystudent.voice;
    return *this;
}

void Mystudent::initialisation(QString name, QString introduction, QString school,QString club, QString armytype,
                      QString weapon, QString birthday, QString academy, QString portrait, QString voice){
    this->name = name;
    this->introduction = introduction;
    this->school = school;
    this->club = club;
    this->armytype = armytype;
    this->weapon = weapon;
    this->birthday = birthday;
    this->academy = academy;
    this->portrait = portrait;
    this->voice = voice;
}

QString Mystudent::getName()
{
    return this->name;
}

QString Mystudent::getIntroduction()
{
    return this->introduction;
}

QString Mystudent::getSchool()
{
    return this->school;
}

QString Mystudent::getClub()
{
    return this->club;
}

QString Mystudent::getArmytype()
{
    return this->armytype;
}

QString Mystudent::getWeapon()
{
    return this->weapon;
}

QString Mystudent::getBirthday()
{
    return this->birthday;
}

QString Mystudent::getAcademy()
{
    return this->academy;
}

QString Mystudent::getPortrait()
{
    return this->portrait;
}

QString Mystudent::getVoice()
{
    return this->voice;
}
