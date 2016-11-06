    #Powershell Logical Contructs using (if,elseif) and switch#

    #Using the if and elseif contruct

    <#
    $procs = Get-Process

    if ($procs.count -gt 1000) {
        Write-Host "You have a lot of processes"
    } else {
        Write-Host "less than 100 process"
        }
        #>


    #Using the SWITCH construct

    <#
    $name = Read-Host 'please enter the name of the server'

    Switch -Regex ($name) {

    "LON"   { Write-Host 'the server is located in London' 
            }
    "Tokyo" { Write-Host 'the server is located in Japan' 
            }
    }
    #>



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



    # If were to accomplish the same task with the "if" construct it will look like this

    <#
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



    ######################### 44 - POWERSHELL SCRIPTING LOOPING CONSTRUCTS ################################## 
    # ForEach, For, While / Until / Do

    #Not so efficient way of doing the foreach object command

    <#
    #1..10 | ForEach-Object { notepad.exe }

    Measure-Command {
        Get-Process -name notepad |
        ForEach-Object { $_.Kill() }
    }
    #>


    <#
    Measure-Command {
    $processes = Get-Process -Name notepad
        foreach ($proc in $processes) {
        $proc.kill()
        }
    }
    #>

    <#
    $array1 = "one", "two", "three", "four", "five"
    $array2 = "fred", "barney", "wilma", "betty", "pebbles"
    $string = "one day we saw two eat four"

    for ($x = 0; $x -lt $array1.Count; $x++) {
        echo "Loop $x"
        $string = $string -replace $array1[$x],$array2[$x]
    
    }
    $string
    #>

    <#
    $array1 = "cbtnuggets.com", "gmail.com", "company.com"
    $array2 = "nuggetlab.com", "outlook.com", "compnay.pri"

    $emails = 'john@cbtnuggets.com',
            'joe@gmail.com',
            'fred@company.com'
    foreach ($email in $emails) {
        
    for ($x = 0; $x -lt $array1.Count; $x++) {
        $email = $email -replace $array1[$x],$array2[$x]
    
    }
    Write-Output $email
    }
    #>

    <#
    $existing = 'Server1', 'Server3', 'Server4', 'Server5', 'Server2'

    $candidate = 0

    do {
        $candidate++
        $possiblename = "Server$candidate"
    } while ($existing.Contains($possiblename))
    $possiblename
    #>

    <#
    $this = 5
    $that = 5
    while ($this -eq $that) {
        Write-Host 'Hello'
        $that++
    }
    #>

    ###############################45 Powershell SCRIPTING Basic Function .... #################################################

    <#
    function Get-Computersysteminfo { 
        Get-WmiObject -Class win32_computersystem -ComputerName localhost | 
            Select-Object Name, Manufacturer, Model
    }
    Get-Computersysteminfo

    #>
    ########################47-Powershell SCRIPTING from Command to Script to function to module############################


    # $env:PSModulePath #location where module are saved. Once in the User MyDocuments directory and the other where Microsoft saves there modules



    ##############50 LAB-E################

param (
    [string[]]$Computer
)

    function Get-ComputerInfo {
        foreach ($comp in $Computer) {    
            $proc = Get-WmiObject -Class win32_processor -ComputerName $Computer 
            $os   = Get-WmiObject -Class win32_operatingsystem -ComputerName $Computer
        }
    }
            $properties = @{'Processor Name'= $proc.Name;
                            'Operating System Manufacturer' = $os.manufacturer;
                            'Operating System Version' = $os.version
            }

Write-Host "$properties"















