## Load the Citrix snap-ins
Add-PSSnapIn Citrix.*

## Disable configuration logging for the XD site:
Set-LogSite -State Disabled
 
## ## Clear the current Delivery Controller database connections
## Note: AdminDBConnection must be the last command
Set-ConfigDBConnection -DBConnection $null
Set-AcctDBConnection -DBConnection $null
Set-AnalyticsDBConnection -DBConnection $null             #  7.6 and newer
Set-AppLibDBConnection -DBConnection $null                #  7.8 and newer
Set-OrchDBConnection -DBConnection $null                  #  7.11 and newer
Set-TrustDBConnection -DBConnection $null                 #  7.11 and newer
Set-HypDBConnection -DBConnection $null
Set-ProvDBConnection -DBConnection $null
Set-BrokerDBConnection -DBConnection $null
Set-EnvTestDBConnection -DBConnection $null
Set-SfDBConnection -DBConnection $null
Set-MonitorDBConnection -DataStore Monitor -DBConnection $null
Set-MonitorDBConnection -DBConnection $null
Set-LogDBConnection -DataStore Logging -DBConnection $null
Set-LogDBConnection -DBConnection $null
Set-AdminDBConnection -DBConnection $null -force