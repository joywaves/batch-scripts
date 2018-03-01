echo off
set username=%1
set fullname=%2
set newnamee=%3
shift
shift
shift
net user %username% "" /ADD /fullname:%fullname%
net localgroup "Administrators" %username% /ADD

WMIC COMPUTERSYSTEM WHERE CAPTION=’%computername%’ RENAME ‘%newnamee%’

shutdown.exe /r /t 00
