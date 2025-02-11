#include "rdstu.h"

rdStu::rdStu(QObject *parent)
    : QObject{parent}
{}

void rdStu::initialisation(QString filep)
{
    stu = new QList<Mystudent>[3];
    QJsonObject jsonraw;
    QJsonArray jsonlevel[3];
    QFile jsonReader(filep);
    if (jsonReader.open(QFile::ReadOnly | QFile::Text)){
        jsonraw = (QJsonDocument::fromJson(jsonReader.readAll(), nullptr)).object();
        jsonReader.close();
        jsonlevel[0] = jsonraw.value("level1").toArray();
        jsonlevel[1] = jsonraw.value("level2").toArray();
        jsonlevel[2] = jsonraw.value("level3").toArray();
        for (ushort var = 0; var < 3; ++var) {
            for (ushort i = 0; i < jsonlevel[var].size(); ++i) {
                QJsonObject jsonobj = jsonlevel[var][i].toObject();
                Mystudent s;
                s.initialisation(
                    jsonobj.value("name").toString(), jsonobj.value("introduction").toString(),jsonobj.value("school").toString(),
                    jsonobj.value("club").toString(),jsonobj.value("armytype").toString(),jsonobj.value("weapon").toString(),
                    jsonobj.value("birthday").toString(),jsonobj.value("academy").toString(),jsonobj.value("portrait").toString(),
                    jsonobj.value("voice").toString()
                );
                stu[var].append(s);
            }
        };
    }
}

int rdStu::rand(int max)
{
    return QRandomGenerator::system()->bounded(max);
}

int rdStu::getLevel()
{
    return this->stu_level;
}

void rdStu::setLevel(const int& level)
{
    this->stu_level = level;
}

int rdStu::getIndex()
{
    return this->stu_index;
}

void rdStu::setIndex(const int & index)
{
    this->stu_index = index;
}

int rdStu::getSize()
{
    return this->stu[this->stu_level].size();
}

QString rdStu::getCur(int param)
{
switch (param) {
    case 1:
        return this->stu[this->stu_level][this->stu_index].getIntroduction();
        break;
    case 2:
        return this->stu[this->stu_level][this->stu_index].getSchool();
        break;
    case 3:
        return this->stu[this->stu_level][this->stu_index].getClub();
        break;
    case 4:
        return this->stu[this->stu_level][this->stu_index].getArmytype();
        break;
    case 5:
        return this->stu[this->stu_level][this->stu_index].getWeapon();
        break;
    case 6:
        return this->stu[this->stu_level][this->stu_index].getBirthday();
        break;
    case 7:
        return this->stu[this->stu_level][this->stu_index].getAcademy();
        break;
    case 8:
        return this->stu[this->stu_level][this->stu_index].getPortrait();
    case 9:
        return this->stu[this->stu_level][this->stu_index].getVoice();
    default:
        return this->stu[this->stu_level][this->stu_index].getName();
    }
}

QString rdStu::randomVoiceFile(QString filep)
{
    QDir dir(filep);
    if (dir.exists() && !dir.isEmpty()){
        QStringList lst = dir.entryList(QStringList() << "*.ogg");
        return lst[rand(lst.size())];
    }
    return "";
}
