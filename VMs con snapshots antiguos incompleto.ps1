$vcenter = "vcenter-01.playground.net"
$user = "nnitto"
$password = "Wetcom01"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
Connect-VIServer -Server $vcenter -User $user -Password $password

$todayDate = Get-Date

$7daysago = $todaydate.AddDays(-7)

$snapshotselect = $snapshots | Select-Object VM, created 

$snapshots = Get-VM | Get-Snapshot | Where{$_.Created -lt $7daysago} | $snapshotselect | Export-Csv -Path c:\snapshots.csv


