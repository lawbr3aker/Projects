#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "Optitex/Scripts/OptitexSentinel.h"
#include "Optitex/Scripts/Optitex.h"
#include <cstring>
#include <QStandardPaths>

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QGuiApplication::setWindowIcon(QIcon(":/Optitex/Assets/Images/Icon.png"));
    QGuiApplication::setApplicationDisplayName("Optitex Sentinel");
    qmlRegisterType<OptitexSentinel>("Optitex.Sentinel", 1, 0, "BackEnd");
    QQmlApplicationEngine engine;
    //
    QUrl url;
    url = QStringLiteral("qrc:/main.qml");
    //
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            }, Qt::QueuedConnection);
    //
    engine.load(url);
    auto root = engine.rootObjects()[0];
    if (argc >= 2){
        root->setProperty("language", argv[1]);
    }
    return QGuiApplication::exec();
}
