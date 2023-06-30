## Load the Citrix snap-ins
Add-PSSnapIn Citrix.*
 
## ## Get the current Delivery Controller database connections
Get-ConfigDBConnection
Get-AcctDBConnection
Get-AnalyticsDBConnection              #  7.6 and newer
Get-AppLibDBConnection                 #  7.8 and newer
Get-OrchDBConnection                   #  7.11 and newer
Get-TrustDBConnection                  #  7.11 and newer
Get-HypDBConnection
Get-ProvDBConnection
Get-BrokerDBConnection
Get-EnvTestDBConnection
Get-SfDBConnection
Get-MonitorDBConnection
Get-MonitorDBConnection -DataStore Monitor
Get-LogDBConnection
Get-LogDBConnection -DataStore Logging
Get-AdminDBConnection