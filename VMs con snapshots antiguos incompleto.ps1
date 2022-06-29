$vcenter = "vcenter-01.playground.net"
$user = "nnitto"
$password = "Wetcom01"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
Connect-VIServer -Server $vcenter -User $user -Password $password

$todayDate = Get-Date

$snapshots = Get-VM | Get-Snapshot 

$snapshots | Select-Object VM, created 
