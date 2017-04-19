#gets free disk space from local and remote systems
function Get-VDisk {
    [CmdletBinding()]
    param (
        [string]$ComputerName
    )
    
    begin {
        $TotalGB = @{Name="Capacity(GB)";expression={[math]::round(($_.Size/ 1073741824),2)}}
        $FreeGB = @{Name="FreeSpace(GB)";expression={[math]::round(($_.FreeSpace / 1073741824),2)}}
        $FreePerc = @{Name="Free(%)";expression={[math]::round(((($_.FreeSpace / 1073741824)/($_.Size / 1073741824)) * 100),0)}}
    }
    
    process {
        $volumes = Get-WmiObject -computer $ComputerName win32_logicaldisk | Where-object {$_.Size -ne $null}
        $volumes | Select-Object SystemName, DeviceID, $TotalGB, $FreeGB, $FreePerc | Format-Table -AutoSize
    }
    
    end {
    }
}
