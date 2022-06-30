    $user = "nnitto"
    $paswd = "Wetcom01"
    $vserver = "vcenter-01.playground.net"

    Connect-VIServer -user $user -password $paswd -server $vserver

    Get-Datastore 