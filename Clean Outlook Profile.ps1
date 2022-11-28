#  Clean Outlook  Profile

$Title = Outlook Profile Clean Up"
$host.UI.RawUI.WindowTitle = $Title

# Check if Script was running yet
$TestFile = $env:USERPROFILE + "\OutlookProfileCheckFile.txt"
if (Test-Path $TestFile -ErrorAction SilentlyContinue) {Exit}

# Variables
$RoamingOutlookPath = $env:APPDATA + "\Microsoft\Outlook"
$LocalOutlookPath = $env:LOCALAPPDATA + "\Microsoft\Outlook"
$RegOutlookPath = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Outlook' # Outlook 2010
# $RegOutlookPath = 'HKCU:\Software\Microsoft\Office\15.0\Outlook\Profiles\Outlook' # Outlook 2013

# Script Start

Write-Host "Outlook Profile Clean Up" -ForegroundColor Green
Start-Sleep -Seconds 5
write-host "Sollte Outlook noch geöffnet sein, bitte Outlook beenden." -ForegroundColor Red
Start-Sleep -Seconds 10
Write-Host "Das Outlook Profil wird nun bereinigt." -ForegroundColor Yellow
Start-Sleep -Seconds 5

if (Test-Path $RoamingOutlookPath -ErrorAction SilentlyContinue) {Remove-Item -Path $RoamingOutlookPath -Recurse -Force -ErrorAction SilentlyContinue}
Write-Host "..." -ForegroundColor Gray
if (Test-Path $LocalOutlookPath -ErrorAction SilentlyContinue) {Remove-Item -Path $LocalOutlookPath -Recurse -Force -ErrorAction SilentlyContinue}
Write-Host "..." -ForegroundColor Gray
if (Test-Path $RegOutlookPath -ErrorAction SilentlyContinue) {
    Remove-Item -Path $LocalOutlookPath -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -Path $RegOutlookPath -ErrorAction SilentlyContinue -Force | Out-Null

}
Write-Host "..." -ForegroundColor Gray

Write-Host "Das Outlook Profil wurde bereinigt. Das Tool beendet sich nun." -ForegroundColor Green
Start-Sleep -Seconds 10

# Set TestFile
New-Item $TestFile -ItemType File -Force -ErrorAction SilentlyContinue
