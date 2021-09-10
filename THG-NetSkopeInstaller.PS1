### NetSkoppe Installer Created by Bfreitas 07/14/21 Contact for help####
###Envoke Via CMD###
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/THG-Bfreitas/THG-NetskopeInstall/main/THG-NetSkopeInstaller.PS1'))" 


###### Vars#####
$Path="C:\temp"
$URL = "https://github.com/THG-Bfreitas/THG-NetskopeInstall/raw/main/NSClient_87.0.0.704.msi"
$OutputURL = "C:\temp\NSclient.msi"




####Decentralized Logging due to remote installation
Start-Transcript -Path $path\$scriptlogfile
Write-Host "everything will end up in $path\$scriptlogfile"

Write-host "Checking for folder"
####Folder check#####
if (!(Test-Path $Path))
{
New-Item -itemType Directory -Path $Path -Name $FolderName
}
else
{
cls
write-host "Folder already exists"
}
Write-host "Downloading $url"
##Download File Via $URL
Invoke-WebRequest -Uri "$URL" -OutFile "$outputURL"

Write-host "Starting MSI installation"
##Executing MSI 
msiexec /I C:\temp\NSClient.msi token=e6cFeDnQ3Kw38C54KNiy host=addon-hilbgroup.goskope.com mode=peruserconfig autoupdate=on

Stop-Transcript
