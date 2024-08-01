$TimeZoneId = "W. Europe Standard Time"
Write-BISFLog -Msg "Set Time Zone"
Set-TimeZone -Id $TimeZoneId -PassThru
Write-BISFLog -Msg "Registered Scheduled Task for Starting BIS-F Preperation."
Add-BISFFinishLine