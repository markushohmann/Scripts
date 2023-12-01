## Replace <dbserver> with the SQL server name, and instance if present, e.g "ServerName\SQLInstanceName". 
## If no SQL Instance name is mentioned, this commandlet will try to connect to the default SQL instance.
## Replace <dbname> with the name of your restored Database
## Note: AdminDBConnection should be first
 
$ServerName = "SQLSERVER"
$SiteDBName = "SiteDB"
$LogDBName = "LogDB"
$MonitorDBName = "MonDB"
$csSite = "Server=$ServerName;Initial Catalog=$SiteDBName;Integrated Security=True"
$csLogging = "Server=$ServerName;Initial Catalog=$LogDBName;Integrated Security=True"
$csMonitoring = "Server=$ServerName;Initial Catalog=$MonitorDBName;Integrated Security=True"
 
Set-AdminDBConnection -DBConnection $csSite
Set-ConfigDBConnection -DBConnection $csSite
Set-AcctDBConnection -DBConnection $csSite
Set-AnalyticsDBConnection -DBConnection $csSite              # 7.6 and newer
Set-HypDBConnection -DBConnection $csSite             
Set-ProvDBConnection -DBConnection $csSite
Set-AppLibDBConnection -DBConnection $csSite                 # 7.8 and newer
Set-OrchDBConnection -DBConnection $csSite                   # 7.11 and newer
Set-TrustDBConnection -DBConnection $csSite                  # 7.11 and newer
Set-BrokerDBConnection -DBConnection $csSite
Set-EnvTestDBConnection -DBConnection $csSite
Set-SfDBConnection -DBConnection $csSite
Set-LogDBConnection -DBConnection $csSite
Set-LogDBConnection -DataStore Logging -DBConnection $null
Set-LogDBConnection -DBConnection $null
Set-LogDBConnection -DBConnection $csSite
Set-LogDBConnection -DataStore Logging -DBConnection $csLogging
Set-MonitorDBConnection -DBConnection $csSite
Set-MonitorDBConnection -DataStore Monitor -DBConnection $null
Set-MonitorDBConnection -DBConnection $null
Set-MonitorDBConnection -DBConnection $csSite
Set-MonitorDBConnection -DataStore Monitor -DBConnection $csMonitoring