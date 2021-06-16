#Powershell Script to Return WAN IPV4 Address

Function ReturnIPV4 {

Invoke-RestMethod http://ipinfo.io/ | select ip

}

ReturnIPV4