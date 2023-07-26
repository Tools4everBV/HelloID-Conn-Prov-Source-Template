$numberOfDepartments = 2

if(-Not($dryRun -eq $True)) {
    # Write real import logic here
    $numberOfDepartments = 20    
}

Write-Verbose "Starting department import" -Verbose
for ($i=0; $i -lt $numberOfDepartments; $i++) {
    Write-Output @(
        @{
            ExternalId          = "ADMINISTR_$i"
            DisplayName         = "Administration $i"
            ManagerExternalId   = "JohnD-0"
        },
        @{
            ExternalId          = "HRM_$i"
            DisplayName         = "Human & Resource management $i"
            ParentExternalId    = "ADMINISTR_$i"
        }
    ) | ConvertTo-Json
}
Write-Verbose "Department import completed" -Verbose
