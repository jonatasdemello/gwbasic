$list = gci -Filter *.asc
foreach ($file in $list){
    $f1 = Get-Content $file
    $f2 = Get-Content $file.FullName.replace(".asc",".bas")

    $fileA = $file.FullName
    $fileB = $file.FullName.replace(".asc",".bas")
    if(Compare-Object -ReferenceObject $(Get-Content $fileA) -DifferenceObject $(Get-Content $fileB))
    {
        "files are different - " + $fileA
    }
    Else {
        #"Files are the same"
        Move-Item $fileA -Destination bkp\ #-WhatIf
    }

    #$n = $file.BaseName + ".BAS"
    #Write-Host $file + " => " + $n
    #Move-Item $n -Destination asc\ #-WhatIf
    #Move-Item $file -Destination asc\ #-WhatIf
}