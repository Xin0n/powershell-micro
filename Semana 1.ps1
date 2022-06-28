$uservcenter = "nnitto"
$passvcenter = "Wetcom01"
$vcenterserver = "vcenter-01.playground.net"
Connect-VIServer -Server $vcenterserver -User $uservcenter -Password $passvcenter