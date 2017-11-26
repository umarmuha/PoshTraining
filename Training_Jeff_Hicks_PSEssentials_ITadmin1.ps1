#Training from Jeff Hicks Powershell Essentials IT admin 1

#$a = @[]

$svc = get-service browser

"The $($svc.DisplayName) is $($svc.Status)"


#Foreach Enumerator Example
$files = dir 'C:\temp' -file
foreach ($file in $files) 

    { $fileage = ((get-date) - $file.lastwritetime ) 
                 "$($file.Name) =$fileage"
    }

#Example

if (-not (Test-Path "C:\boobooga")) {
    Write-Host "Creating boobooga folder" -ForegroundColor Green
    Mkdir "C:\boobooga" -whatif
 }
 
 
 #Example - Split the names and then add folders for each name
 $n = "alice","bob","carol","David"
 $n.split(",")
foreach ($name in $n) {
    Write-Host "Adding folders for Team Member $name" -ForegroundColor Green
    Mkdir "C:\Temp\$name"
    }                           
    
 #Example - Split the name and then remove folders for each name     
 $n = "alice","bob","carol","David"
 $n.split(",")
foreach ($name in $n) {
    Write-Host "Removing folders for Team Member $name" -ForegroundColor Green
    Remove-Item -path "C:\Temp\$name"
    }                           

    $a = 0..10
    $a = $a[0..($a.Count-2)]