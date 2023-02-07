@Echo OFF

Set "temp_dir=%cd%"
Set "current_dir=%~dp0"
Set "startup=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"

Set "sentinel_msi_path=%current_dir%Sentinel Protection Installer 7.6.7.msi"
Set "data_path=%AppData%\Optitex Pattern Desing\Sentinel"
Set "log_dir=%data_path%\Log"
Set "log_file=%log_dir%\Sentinel.txt"

WMic os get osarchitecture | FindStr /i /C:"64-bit" > nul && (
    Set nir_cmd="%current_dir%..\x86\nircmd.exe"
) || (
    Set nir_cmd="%current_dir%..\x86\nircmd.exe"
)

Set "echo_title=Echo -^>  "
Set "echo_log=Echo -^>. "
Set "echo_log_error=Echo -^>.!"
Set "echo_title_error=Echo -^>! "
Set "echo_progressbar=Echo -^># "

Set "b_start=^<b^>"
Set "b_end=^<\b^>"
Set "spacer=%echo_log% -----------"

Set "error=%b_start%^ Exist ❗%b_end%"
Set "succeed=%b_start%^ Succeed ✔️%b_end%"

CD  "%current_dir%"

%echo_log% Making %b_start%data dir%b_end%
Call :MakeDir "%data_path%" && %echo_log%  %succeed% || %echo_log_error% %error%
%echo_progressbar% 10

%spacer%
%echo_log% Making %b_start%log dir%b_end%
Call :MakeDir "%log_dir%" && %echo_log%  %succeed% || %echo_log_error% %error%
%echo_progressbar% 10

%spacer%
%echo_title% Waiting to start
%echo_log% %b_start%Holding stage%b_end%
Call :Delay 5

%spacer%
%echo_title% Opening file
%echo_log% Opening %b_start%%sentinel_msi_path%%b_end%
%echo_progressbar% 25

%spacer%
%echo_title% Running...
%echo_log% Starting %b_start%Sentinel msi%b_end%
MSIExec /i "%sentinel_msi_path%" /QN /L*V "%log_file%"
%echo_progressbar% 45

%spacer%
%echo_log% View log for more at %b_start%"%log_file%"%b_end%

%spacer%
%echo_log% 🔴 Append %b_start%second stage to startup%b_end%
%echo_title% Make second stage
%nir_cmd% shortcut "%current_dir%2ndStage.cmd" "%startup%" "OPD Sentinel 2nd Stage" "" "" "" "min"
%echo_log% %succeed%
%echo_progressbar% 10

%spacer%
%echo_title% %b_start%Finish 😃!%b_end%
%echo_log% %b_start%😃%b_end%

Goto :MainExit

:MakeDir
If NOT EXIST %1 (
    MkDir %1
    Exit /b 0
)
Exit /b 1

:Delay
Ping localhost -n %1 > nul
Exit /b 0

:MainExit
Exit /b 0
