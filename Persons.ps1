$numberOfPersons = 5

if(-Not($dryRun -eq $True)) {
    # Write real import logic here
    $numberOfPersons = 250    
}

Write-Verbose "Starting person import" -Verbose
for ($i=0; $i -lt $numberOfPersons; $i++) {
$persons = @(
        @{
            ExternalId	= "JohnD-$i"
            DisplayName	= "John Doe"
            FirstName	= "John"
            LastName	= "Doe"
            Convention	= "B"
            Contracts	= @(
                @{
                    SequenceNumber	= "1"
                    DepartmentName	= "Administration"
                    DepartmentCode	= "ADMINISTR"
                    TitleName		= "Manager"
                    TitleCode		= "Man"
                    StartDate		= Get-Date("2018-01-01") -Format "o"
                    EndDate			= $null
                }
            )
        },
        @{
            ExternalId	= "JaneD-$i"
            DisplayName	= "Jane Doe"
            FirstName	= "Jane"
            LastName	= "Doe"
            Convention	= "B"
            Contracts	= @(
                @{
                    SequenceNumber	= "1"
                    DepartmentName	= "Administration"
                    DepartmentCode	= "ADMINISTR"
                    TitleName		= "Secretary"
                    TitleCode		= "Sec"
                    StartDate		= Get-Date("2015-03-02") -Format "o"
                    EndDate			= $null
                }
            )
        }
    )

    foreach ($person in $persons) {
        Write-Output $person | ConvertTo-Json
    }
}

Write-Verbose "Person import completed" -Verbose