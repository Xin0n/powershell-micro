$vcenter = "vcenter-01.playground.net"
$user = "nnitto"
$password = "Wetcom01"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
Connect-VIServer -Server $vcenter -User $user -Password $password

$VMs = Get-View -ViewType VirtualMachine

ForEach ($vm in $VMs)
{
$VMInfo = {} | Select VMName,OSName,VMVersion,IPAddressNIC1,VMToolVersion,VMToolsStatus,Num_CPU,~

~Mem_GB,TotalDisk,DiskCapacity,DiskFree,DiskUsed #,Powerstate
$VMInfo.VMName = $vm.name
#$VMInfo.Powerstate = $vm.summary.runtime.powerstate
$VMInfo.OSName = $vm.config.GuestFullName
$VMInfo.VMVersion = $vm.config.version
$VMInfo.IPAddressNIC1 = $vm.Guest.IPAddress
$VMInfo.VMToolVersion = $vm.Guest.ToolsVersion
$VMInfo.VMToolsStatus = $vm.Guest.ToolsStatus
$VMInfo.Num_CPU = $vm.config.Hardware.NumCPU
$VMInfo.Mem_GB = ($vm.config.Hardware.MemoryMB)/1024
$VMInfo.TotalDisk = $vm.Guest.Disk.Length
$VMInfo.DiskCapacity = [math]::Round($vm.Guest.Disk.Capacity/1GB)
$VMInfo.DiskFree = [math]::Round($vm.Guest.Disk.FreeSpace/1GB)
$VMInfo.DiskUsed = $VMInfo.DiskCapacity – $VMInfo.DiskFree
