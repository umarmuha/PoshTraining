

<#
$proc = Get-Process

if ($proc.count -gt 100) {
    Write-Host "you have a lot of processes"
} elseif ($proc[0].name -like 'a*') {
    Write-Host "The first process starts with a"
} 
#>

<#
$DISK = Get-WmiObject -Class win32_logicaldisk | Select-Object -First 1

if ($DISK.DriveType -eq 2) {
    Write-Host "Drive type is floppy"
} elseif ($DISK.drivetype -eq 3) {
    Write-Host "Drive type is fixed"
} elseif ($DISK.drivetype -eq 5) {
    Write-Host "Drive type is optical"
} else {
    Write-Host "Dunno what drive it is"
} 
#>

<#
$DISK = Get-WmiObject -Class win32_logicaldisk | Select-Object -First 1
switch ($DISK.DriveType) {
    2 { Write-Host "Disk is floppy"  }
    3 { Write-Host "Disk is fixed"}
    5 { Write-Host "Disk is optical"}
    Default { Write-Host "Dunno"}
}
#>

<#
$Name = Read-Host "Enter Server Name"

switch -Wildcard  ($Name) {
    "*DC*"      { Write-Host "Is a Domain Controller"}
    "*FS*"      { Write-Host "Is a File Server"}
    "*LON*"     { Write-Host "Server is located in LONDON"}
    "*NYC*"     { Write-Host "Server is located in NY City"} 
    Default { Write-Host "Dunno"}
}
#>

<#

$Name = Read-Host "Enter Server Name"

#In this Example by putting the carrot in front of LON, it will only show LONDON if the answer starts with LON

switch -Regex  ($Name) {
    "DC"      { Write-Host "Is a Domain Controller"}
    "FS"      { Write-Host "Is a File Server"}
    "^LON"     { Write-Host "Server is located in LONDON"}
    "NYC"     { Write-Host "Server is located in NY City"} 
    Default { Write-Host "Dunno"}
}

#>


<#
# If were to accomplish the same task with the "if" construct it will look like this

$Name = Read-Host "Enter the name of the server"

if ($Name -match "DC") { 
    Write-Host "Domain Controller"
    }
if ($Name -match "LON") {
    Write-Host "Server is located in LONDON"
}
if ($Name -match "^NYC") {
    Write-Host "Server is located in NY"
}
#>