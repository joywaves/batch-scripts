@Echo off
Setlocal EnableDelayedExpansion

IF NOT %1=="" ( set username=%1 ) else ( echo No User name   & goto:eof )
IF NOT %2=="" ( set fullname=%2 ) else ( echo No Full name   & goto:eof )
IF NOT %3=="" ( set newnamee=%3 ) else ( echo No Computername& goto:eof)

shift
shift
shift

net user %username% "" /ADD /fullname:%fullname%
net localgroup "Administrators" %username% /ADD

wmic computersystem where caption='%computername%' RENAME '%newnamee%'

echo Press Enter to reboot laptop
set /p input=

shutdown.exe /r /t 00
