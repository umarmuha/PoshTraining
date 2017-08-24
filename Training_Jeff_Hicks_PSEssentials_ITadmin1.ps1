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
                          
