#pragma once

#include <QObject>
#include <qqml.h>
#include <QThread>
#include <fstream>
#include <unistd.h>
#include <windows.h>
#include <tchar.h>

#define BUFSIZE 4096

class Worker : public QObject {
Q_OBJECT
public:
    explicit Worker() : QObject() {
    }

public slots:

    short Run(QString command) {
        qDebug() << "sadfsad";
        HANDLE g_hChildStd_IN_Rd = nullptr;
        HANDLE g_hChildStd_OUT_Rd = nullptr;
        HANDLE g_hChildStd_OUT_Wr = nullptr;
        //
        SECURITY_ATTRIBUTES saAttr;
        saAttr.nLength = sizeof(SECURITY_ATTRIBUTES);
        saAttr.bInheritHandle = TRUE;
        saAttr.lpSecurityDescriptor = nullptr;
        //
        if (!CreatePipe(&g_hChildStd_OUT_Rd, &g_hChildStd_OUT_Wr, &saAttr, 0)
            or !SetHandleInformation(g_hChildStd_OUT_Rd, HANDLE_FLAG_INHERIT, 0))
            return GetLastError();
        //
        qDebug() << (LPSTR )command.toStdString().c_str();
        PROCESS_INFORMATION piProcInfo;
        STARTUPINFO siStartInfo;
        //
        ZeroMemory(&piProcInfo, sizeof(PROCESS_INFORMATION));
        ZeroMemory(&siStartInfo, sizeof(STARTUPINFO));
        // set STARTUP attributes
        siStartInfo.cb = sizeof(STARTUPINFO);
        siStartInfo.hStdError = g_hChildStd_OUT_Wr;
        siStartInfo.hStdOutput = g_hChildStd_OUT_Wr;
        siStartInfo.hStdInput = g_hChildStd_IN_Rd;
        siStartInfo.dwFlags |= STARTF_USESTDHANDLES;
        //
        if (!CreateProcess(nullptr,
                           (TCHAR *)command.toStdString().c_str(),
                           nullptr,
                           nullptr,
                           TRUE,
                           CREATE_NO_WINDOW,
                           nullptr,
                           nullptr,
                           &siStartInfo,
                           &piProcInfo))
            exit(GetLastError());
        else {
            // Close unused handles
            CloseHandle(g_hChildStd_OUT_Wr);
            CloseHandle(g_hChildStd_IN_Rd);
            CloseHandle(piProcInfo.hProcess);
            CloseHandle(piProcInfo.hThread);
        }
        //
        DWORD dwRead;
        CHAR chBuf[BUFSIZE];
        // Read output
        while (ReadFile(g_hChildStd_OUT_Rd, chBuf, BUFSIZE, &dwRead, nullptr)
               and dwRead != 0) {
            chBuf[dwRead] = '\0';
            emit append(chBuf);
        }
        emit end();
        return 0;
    }


signals:

    void append(QString);

    void end();
};

class Controller : public QObject {
Q_OBJECT
public:
    explicit Controller() : QObject() {
        w = new Worker();
        t = new QThread;
        w->moveToThread(t);
        connect(this, SIGNAL(start(QString)), w, SLOT(Run(QString)));
        connect(w, SIGNAL(append(QString)), this, SIGNAL(append(QString)));
        connect(w, SIGNAL(end()), this, SIGNAL(end()));
        t->start();
    }

private:
    Worker *w;
    QThread *t;
signals:

    void append(QString);

    void start(QString);

    void end();
};
