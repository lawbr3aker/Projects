#pragma once

#include <QFileInfo>
#include <QString>
#include <windows.h>
#include <shlobj.h>
#include <objbase.h>
#include <shobjidl.h>
#include <unistd.h>

#define BUFSIZE 4096

typedef void (WINAPI *AppendFunc_T)(LPCSTR);

static QString CurrentPath() {
    char *path = new char[MAX_PATH];
    getcwd(path, MAX_PATH);
    return path;
}

static QString toAbs(const QString &path) {
    QFileInfo temp(path);
    return temp.absoluteFilePath();
}

static HRESULT CreateLink(LPCSTR targetPath,
                          LPCSTR shortcutPath,
                          LPCSTR startInDir,
                          LPCSTR desc,
                          LPCSTR args = "") {
    IShellLink *link = NULL;
    HRESULT result = CoInitialize(NULL);

    if (!SUCCEEDED(result))
        return FALSE;


    result = CoCreateInstance(CLSID_ShellLink, NULL, CLSCTX_INPROC_SERVER, IID_IShellLink, (LPVOID *) &link);
    if (SUCCEEDED(result)) {
        IPersistFile *file;

        // Set the path to the shortcut target and add the description.
        link->SetPath(targetPath);
        link->SetDescription(desc);
        link->SetWorkingDirectory(startInDir);
        link->SetArguments(args);
        result = link->QueryInterface(IID_IPersistFile, (LPVOID *) &file);

        if (SUCCEEDED(result)) {
            WCHAR wsz[MAX_PATH];

            MultiByteToWideChar(CP_ACP, 0, shortcutPath, -1, wsz, MAX_PATH);
            result = file->Save(wsz, TRUE);
            if (!SUCCEEDED(result))
                return GetLastError();
            IShellLinkDataList *pdl;

            result = link->QueryInterface(IID_IShellLinkDataList, (void **) &pdl);
            if (result != S_OK) {
                file->Release();
                link->Release();
                CoUninitialize();
                return -4;
            }

            DWORD dwFlags = 0;

            result = pdl->GetFlags(&dwFlags);
            if (result != S_OK) {
                pdl->Release();
                file->Release();
                link->Release();
                CoUninitialize();
                return -5;
            }
            // Only set SLDF_RUNAS_USER if it's not set, otherwise
            // SetFlags returns an error.
            if ((SLDF_RUNAS_USER & dwFlags) != SLDF_RUNAS_USER) {
                result = pdl->SetFlags(SLDF_RUNAS_USER | dwFlags);
                if (result != S_OK) {
                    pdl->Release();
                    file->Release();
                    link->Release();
                    CoUninitialize();
                    return -6;
                }
            } else {
                pdl->Release();
                file->Release();
                link->Release();
                CoUninitialize();
                return GetLastError();
            }

            result = file->Save(NULL, true);
            if (result != S_OK) {
                pdl->Release();
                file->Release();
                link->Release();
                CoUninitialize();
                return GetLastError();
            }
            result = file->SaveCompleted(NULL);
            if (result != S_OK) {
                pdl->Release();
                file->Release();
                link->Release();
                CoUninitialize();
                return -9;
            }

            pdl->Release();
            file->Release();
            link->Release();
            CoUninitialize();
            return ERROR_SUCCESS;
        }
        link->Release();
    }

    CoUninitialize();

    return result;
}

inline bool PathExists(const QString &path) {
    const QFileInfo file(path);
    if ((!file.exists()) || (!file.isDir()) || (!file.isWritable()))
        return false;
    return true;
}
