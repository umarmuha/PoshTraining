Param (
    [string]$ComputerName = (Read-Host 'Please enter the name of the computer you want to log into'),
    [int]$DriveType = 3
)
Get-WmiObject -Class win32_logicaldisk -Filter "DriveType=$DriveType" -ComputerName $ComputerName |
Select-Object -Property @{n='ComputerName';e={$_.__SERVER}},
                        @{n='Drive';e={$_.DeviceID}},
                        @{n='FreeSpace(GB)';e={$_.Freespace / 1GB -as [int]}}