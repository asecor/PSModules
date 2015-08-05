function Format-SQLDisk{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$True)]
    [string[]]$computername
)
Invoke-Command -ComputerName $computername -ScriptBlock {get-disk | where PartitionStyle -eq "raw" | Initialize-Disk -PartitionStyle GPT -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -AllocationUnitSize 65536 -NewFileSystemLabel "SQLDATA" -Force -Confirm:$false}
}