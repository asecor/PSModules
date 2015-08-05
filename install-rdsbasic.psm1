
function Install-RDSBasic{
    [cmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string[]]$computername
        )
    Invoke-Command -ComputerName $computername -ScriptBlock {Import-Module RemoteDesktop | Install-WindowsFeature –Name RDS-RD-Server | Out-Null | Set-RDLicenseConfiguration -LicenseServer RDSLICENCESERVER -Mode PerDevice -Force | Restart-Computer}
}

#$obj = gwmi -namespace "Root/CIMV2/TerminalServices" Win32_TerminalServiceSetting ; $obj.ChangeMode(2); $obj.SetSpecifiedLicenseServerList("RDSLICENCESERVER")