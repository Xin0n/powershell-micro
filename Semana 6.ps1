$vcenter = "vcenter-01.playground.net"
$user = "nnitto"
$password = "Wetcom01"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
Connect-VIServer -Server $vcenter -User $user -Password $password

$vm = Get-View -ViewType VirtualMachine -Filter @{"Name" = "VM"}
$vmhostView = Get-View -ID $vm.Runtime.Host
$vmhostView.Summary.Runtime