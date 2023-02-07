#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "Optitex/Scripts/OptitexDongleKeys.h"
#include <cstring>

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QGuiApplication::setWindowIcon(QIcon(":/Optitex/Assets/Images/Icon.png"));
    QGuiApplication::setApplicationDisplayName("Optitex Dongle Keys");
    qmlRegisterType<OptitexDongleKeys>("Optitex.Dongle", 1, 0, "BackEnd");
    QQmlApplicationEngine engine;
    QUrl url;
    if (argc >= 2
        and strcmp(argv[1], "after") == 0) {
        url = QStringLiteral("qrc:/main2.qml");
    } else {
        url = QStringLiteral("qrc:/main.qml");
    }

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    engine.load(url);
    if (argc >= 3){
        engine.rootObjects()[0]->setProperty("language", argv[2]);
    }
    return QGuiApplication::exec();
}
