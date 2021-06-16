#Powershell Script to Enable RDP via Registry 
#Tested on: Windows 10, 

Function EnableRDP {

Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\‘ -Name “fDenyTSConnections” -Value 0

}

EnableRDP