<#
#Powershell cmdlet to group Processes by Company and then export them into a file as well
$Path = 'C:\Users\umarmuha\My Documents\GitHub\PoshTraining\ProcessByCompanyName.txt'
$ProSvc = Get-Process | Sort-Object -Property Company | Format-Table -GroupBy Company
$ProSvc | out-file $Path
#>

#Cmdlet that reveals the number of about files and also the quantity

$i=0
$Directory= Get-ChildItem "$PSHOME\about*. *" -Recurse
Foreach ( $Aboutfile in $Directory ) { $Aboutfile.name ; $i++}
Write-Host "There are $i about files"
