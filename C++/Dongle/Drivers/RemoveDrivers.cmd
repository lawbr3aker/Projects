@Echo OFF

Set TempDir=%cd%
Set CurrentDir=%~dp0
Set Devcon_Path="%CurrentDir%devcon.exe"

Call cd %CurrentDir%

Call regedit /s keyr

Call %Devcon_Path% remove root\Mkbus
@if exist %SYSTEMROOT%\system32\drivers\Mkbus.sys del %SYSTEMROOT%\system32\drivers\Mkbus.sys

Call %Devcon_Path% remove root\Optitex
@if exist %SYSTEMROOT%\system32\drivers\Optitex.sys del %SYSTEMROOT%\system32\drivers\Optitex.sys

Call %Devcon_Path% remove tap0901.inf TAP0901
@if exist %SYSTEMROOT%\system32\drivers\tap0901.sys del %SYSTEMROOT%\system32\drivers\tap0901.sys

Call cd %TempDir%

