# Remove all Countries in the "Automatic app sign-in" section from the "Digital Markets Act JSON File" 
# https://techcommunity.microsoft.com/blog/windows-itpro-blog/upcoming-changes-to-windows-single-sign-on/4008151


$fileName = 'C:\Windows\System32\IntegratedServicesRegionPolicySet.json'
$NewAcl = Get-Acl -Path $fileName

# Allow system to write
#$identity = "NT AUTHORITY\SYSTEM" # LocalSystem
$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name # Current administrative user
$fileSystemRights = "FullControl"
$type = "Allow"
$fileSystemAccessRuleArgumentList = $identity, $fileSystemRights, $type
$fileSystemAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList
$NewAcl.SetAccessRule($fileSystemAccessRule)
Set-Acl -Path $fileName -AclObject $NewAcl

# JSON-Datei laden
$json = Get-Content -Raw -Path $fileName | ConvertFrom-Json

# Abschnitt mit "$comment": "Automatic app sign-in" finden und den Bereich "disabled" leeren
foreach ($policy in $json.policies) {
    if ($policy.'$comment' -eq "Automatic app sign-in") {
        $policy.conditions.region.disabled = @()
    }
}

# JSON-Datei speichern
$json | ConvertTo-Json -Depth 10 | Set-Content -Path $fileName
 
