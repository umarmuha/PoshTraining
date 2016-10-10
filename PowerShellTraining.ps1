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


