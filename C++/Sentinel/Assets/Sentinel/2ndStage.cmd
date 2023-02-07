@Echo OFF

Set "temp_dir=%cd%"
Set "current_dir=%~dp0"
Set "startup=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"

WMic os get osarchitecture | FindStr /i /C:"64-bit" > nul && (
    Set nir_cmd="%current_dir%..\x86\nircmd.exe"
) || (
    Set nir_cmd="%current_dir%..\x86\nircmd.exe"
)

CD %current_dir%

%nir_cmd% execmd Start /B "" "%current_dir%RenameDrivers.cmd"

Del "%startup%\OPD Sentinel 2nd Stage*"