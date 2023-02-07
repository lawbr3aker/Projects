@Echo OFF

setlocal EnableDelayedExpansion

Set "temp_dir=%cd%"
Set "current_dir=%~dp0"
Set "startup=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"

Set "usb_dir=HKLM\SYSTEM\ControlSet001\Enum\USB"
Set "aladdin_dir=HKLM\SYSTEM\ControlSet001\Enum\Aladdin"
Set order=%usb_dir%; ^
          %aladdin_dir%;

CD  "%current_dir%"

WMic os get osarchitecture | FindStr /i /C:"64-bit" > nul && (
    Set "acl_path=%current_dir%..\x64\SetAcl.exe"
) || (
    Set "acl_path=%current_dir%..\x86\SetAcl.exe"
)

For %%a In (%order%) Do (
    "%acl_path%" -on %%a -ot reg -actn setowner -ownr "n:Administrators"  -rec Yes > nul
    "%acl_path%" -on %%a -ot reg -actn ace -ace "n:Administrators;p:full" -rec Yes > nul
    "%acl_path%" -on %%a -ot reg -actn ace -ace "n:Users;p:full"          -rec Yes > nul
)

For %%a In (%order%) Do (
    For /f "tokens=*" %%b In ('Reg QUERY %%a') Do (
        Call :RenameToMaintaincer "%%b"
        For /f "tokens=*" %%c In ('Reg QUERY "%%b"') Do (
            Call :RenameToMaintaincer "%%c"
            For /f "tokens=*" %%d In ('Reg QUERY "%%c"') Do (
                Call :RenameToMaintaincer "%%d"
            ) 2> nul
        ) 2> nul
    ) 2> nul
)

Goto :MainExit

:RenameToMaintaincer
Set current_maintainer=Optitex Pattern Design
For /f "tokens=3*" %%a in ('reg QUERY %1 /v "DeviceDesc" 2^> nul') Do (
    Set "driver_desc=%%a %%b"
    For /F "delims=; tokens=2*" %%c in ("!driver_desc!") do (
        Set "driver_name=%%c"
        Set "new_name="
        Echo "!driver_name!" | findstr /i /C:"Sentinel" > nul && (
            Set "new_name=!driver_name:Sentinel=%current_maintainer%!"
        )
        Echo "!driver_name!" | findstr /i /C:"SafeNet" > nul && (
            Set "new_name=!driver_name:SafeNet=%current_maintainer%!"
        )
        If NOT "!new_name!" EQU "" (
            Echo Renaming '!driver_name!' to '!new_name!'
            Reg ADD %1 /v "FriendlyName" /t REG_SZ /d "!new_name!" /f
        )
    )
)
Exit /b /0

:MainExit
Exit /b 0
