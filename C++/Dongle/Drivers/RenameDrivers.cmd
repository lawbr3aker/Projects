@Echo OFF

setlocal EnableDelayedExpansion

Set "TARGET_NAME=Optitex Pattern Design 15"

Set TempDir=%cd%
Set CurrentDir=%~dp0

cd "%CurrentDir%"

Set SetAcl_Path=

wmic os get osarchitecture | findstr /i /C:"64-bit" > nul && (
    Set "SetAcl_Path=%CurrentDir%/x64/SetAcl.exe"
) || (
    Set "SetAcl_Path=%CurrentDir%/x86/SetAcl.exe"
)

"%SetAcl_Path%" -on "HKLM\System\ControlSet001\Enum\ROOT\NET" -ot reg -actn setowner -ownr "n:Administrators" -rec Yes > nul
"%SetACL_Path%" -on "HKLM\System\ControlSet001\Enum\ROOT\NET" -ot reg -actn ace -ace "n:Administrators;p:full" -rec Yes > nul
"%SetACL_Path%" -on "HKLM\System\ControlSet001\Enum\ROOT\NET" -ot reg -actn ace -ace "n:Users;p:full" -rec Yes > nul

Set I=1

For /f "tokens=*" %%a In ('reg query "HKLM\System\ControlSet001\Enum\ROOT\NET"') Do (
    Call :Rename2Publisher "%%a"
)

Goto exit

:Rename2Publisher
For /f "tokens=3*" %%a In ('reg QUERY %1 /v "HardwareID"') Do (
    Set "HardwareID=%%a %%b"
    Echo !HardwareID! | findstr /i /C:"TAP0901" > nul && (
        Set "RepeatCount="
        If NOT !I! EQU 1 (
            Set "RepeatCount= #!I!"
        )
        reg ADD %1 /v "FriendlyName" /t REG_SZ /d "%TARGET_NAME%!RepeatCount!" /f
        Set /a I=I + 1
        exit /b /0
    ) || (
        exit /b /1
    )
)

:exit
cd %TempDir%
exit /b 0
