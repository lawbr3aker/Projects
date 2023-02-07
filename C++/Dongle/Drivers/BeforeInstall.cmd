@Echo OFF

Set BCDEdit_Path=

Call wmic os get osarchitecture | findstr /i /C:"64-bit" > nul && (
    Set BCDEdit_Path=%windir%\System32\bcdedit.exe
) || (
    Set BCDEdit_Path=%windir%\Sysnative\bcdedit.exe
)

If NOT Exist %BCDEdit_Path% (
    Goto fatal_BCDEdit_NotFound
)

Echo -^> Configure device installation settings...
Call reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f

Echo -^> Disabling UAC...
Call reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
Call reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
Call reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f

ECHO -^> Enable test signing...
Call %BCDEdit_Path% -set TESTSIGNING ON

Goto exit

:fatal_BCDEdit_NotFound
Echo FatalError: BCDEdit.exe not found on system.

:exit
Call exit /b 0