## Load the Citrix snap-ins
Add-PSSnapIn citrix.*
 
## Copy these variables from the previous step
## If you haven’t closed your PowerShell window, then the variables might still be defined. In that case, just run the Test commands
$ServerName = "SQLSERVER"
$SiteDBName = "SiteDB"
$LogDBName = "LogDB"
$MonitorDBName = "MonDB"
$csSite = "Server=$ServerName;Initial Catalog=$SiteDBName;Integrated Security=True"
$csLogging = "Server=$ServerName;Initial Catalog=$LogDBName;Integrated Security=True"
$csMonitoring = "Server=$ServerName;Initial Catalog=$MonitorDBName;Integrated Security=True"
 
Test-AcctDBConnection -DBConnection $csSite
Test-AdminDBConnection -DBConnection $csSite
Test-AnalyticsDBConnection -DBConnection $csSite    # 7.6 and newer
Test-AppLibDBConnection -DBConnection $csSite      # 7.8 and newer
Test-BrokerDBConnection -DBConnection $csSite
Test-ConfigDBConnection -DBConnection $csSite
Test-EnvTestDBConnection -DBConnection $csSite
Test-HypDBConnection -DBConnection $csSite
Test-LogDBConnection -DBConnection $csSite
Test-LogDBConnection -DataStore Logging -DBConnection $csLogging
Test-MonitorDBConnection -DBConnection $csSite
Test-MonitorDBConnection -Datastore Monitor -DBConnection $csMonitoring
Test-OrchDBConnection -DBConnection $csSite       # 7.11 and newer
Test-ProvDBConnection -DBConnection $csSite
Test-SfDBConnection -DBConnection $csSite
Test-TrustDBConnection -DBConnection $csSite       # 7.11 and newer