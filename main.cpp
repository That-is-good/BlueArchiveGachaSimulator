#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "rdstu.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/ico/resource/pictures/base/ico.png"));
    QQmlApplicationEngine engine;
    qmlRegisterType<rdStu>("Student",1,0,"Rdstu");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("BlueArchive", "Main");

    return app.exec();
}
