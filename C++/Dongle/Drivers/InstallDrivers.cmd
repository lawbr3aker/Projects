@Echo OFF

Set TempDir=%cd%
Set CurrentDir=%~dp0
Set Devcon_Path="%CurrentDir%devcon.exe"

cd %CurrentDir%

regedit /s Keyr
regedit /s Keys

Echo -^> Installing Mkbus
Call :InstallDriver root\Mkbus Mkbus.inf

Echo -^> Installing Optitex
Call :InstallDriver root\Optitex Optitex.inf

Echo -^> Installing Tap0901.inf
Call :InstallDriver TAP0901 Tap0901.inf

Echo -^> Renaming Drivers
Call RenameDrivers.cmd > nul && (
    Echo Drivers configuration was successful
)

%Devcon_Path% rescan > nul 2> nul

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\
If Exist "OptitexDongleKeys_Mains*" (
    del /f "OptitexDongleKeys_Mains*"
)

Goto exit

:InstallDriver
Set DriverInstallSubdir=%1
Set DriverPath=%2

%Devcon_Path% install %DriverPath% %DriverInstallSubdir% 2> nul | findstr /i /C:"Drivers installed successfully." > nul && (
    Echo Driver '%DriverPath%' installed successfully.
    Exit /b 0
)
Call :Fatal_DriverNotInstalled %DriverPath% %%a
exit /b 1

:Fatal_DriverNotInstalled
Echo -^>! While installing '%1' Driver, Some error happened!(Error: %errorlevel%)
Goto exit

:exit
cd %TempDir%
exit /b 1
