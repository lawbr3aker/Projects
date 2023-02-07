#pragma once

#include <QDir>
#include <QObject>
#include <QString>
#include <qqml.h>
#include <qqmlcontext.h>
#include "Optitex.h"
#include "Controller.h"
#include <windows.h>
#include <winreg.h>
#include <cstdio>
#include <string>
#include <tchar.h>
#include <unistd.h>

using String = std::string;

class OptitexDongleKeys : public QObject {
    Q_PROPERTY(QString filePath MEMBER _filePath FINAL)
    Q_PROPERTY(QString language MEMBER _language FINAL)
Q_OBJECT;
    QML_ELEMENT;
    Controller *controller;
public:
    explicit OptitexDongleKeys(QObject *parent = nullptr) : QObject(parent) {
        controller = new Controller();
        connect(controller, SIGNAL(append(QString)), this, SIGNAL(append(QString)));
        connect(controller, SIGNAL(end()), this, SIGNAL(end()));
    }


    Q_INVOKABLE void run() {
        controller->start(_filePath);
    }

    Q_INVOKABLE static void restartNow() {
        system("shutdown /r /f /c \"Install Optitex Dongle drivers!\"");
    }

    Q_INVOKABLE void install() {
        CreateLink(QString(R"("%0")").arg(toAbs("./OptitexDongle.exe")).toStdString().c_str(),
                   toAbs(QString(R"(%0\Microsoft\Windows\Start Menu\Programs\Startup\OptitexDongleKeys_Mains.lnk)").arg(
                           getenv("APPDATA"))).toStdString().c_str(),
                   toAbs("./").toStdString().c_str(),
                   "install drivers",
                   QString("after %0").arg(_language).toStdString().c_str());
    }

signals:

    void append(QString);

    void end();

private:
    QString _filePath,
            _language;

    static bool replace(std::string &str, const std::string &from, const std::string &to) {
        size_t start_pos = str.find(from);
        if (start_pos == std::string::npos)
            return false;
        str.replace(start_pos, from.length(), to);
        return true;
    }
};
