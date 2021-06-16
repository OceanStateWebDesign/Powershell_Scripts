#Powershell Script to Clear Caches

Function ClearLocalCaches {

Write-Host -ForegroundColor Yellow "Make Sure you ** RUN AS ADMIN ** -- Clearing DNS Cache, ARP Cache, ..."

Start-Sleep -Seconds 2

#Flush DNS Cache
ipconfig /flushdns;
Start-Sleep -Seconds 1

#Flush Arp Cache
arp -a -d;
Start-Sleep -Seconds 1

Write-Host "Done"
Start-Sleep -Seconds 1

}

ClearLocalCaches