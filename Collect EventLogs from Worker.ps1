# Collect EventLogs from Worker

# Variables to define
$DesktopgroupName = "Desktop Prod" 
$LogFile = 'C:\temp\DesktopProd_EventID12_System.csv'

# Get all Worker from one specific Delivery Group
$VDAs = Get-BrokerDesktop -DesktopGroupName $DesktopgroupName -InMaintenanceMode $false -RegistrationState Registered

# Loop for every found Worker
foreach ($VDA in $VDAs) {
    Write-Output $VDA.DNSName
    # Connect to Worker set up script
    Invoke-Command $VDA.DNSName {
        # Script that is running on Worker   
        $Filter = @{
        LogName = 'System'
        ID = 12
    }
    # Collect Events from Eventlogs that matches the filter conditions
    Get-WinEvent -FilterHashTable $Filter | Where-Object {$_.Message -like "*broken*"}
    # Select Properties and Export to CSV
    } | Select-Object MachineName,TimeCreated,ID,Message | Export-Csv -Path $LogFile -Append
}