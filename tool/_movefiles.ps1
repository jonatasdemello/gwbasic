function MoveQBasic
{
    $list = Get-ChildItem -Filter *.bas
    foreach ($file in $list)
    {
        $c = Get-Content $file -totalcount 5 # read first 5 lines
        if ($c[0] -notmatch '^\d' -AND  $c[1] -notmatch '^\d' -AND $c[2] -notmatch '^\d')
        {
            Move-Item $file -Destination _QB\ #-WhatIf
        }    
        #Write-Host $file + " => " + $n
        #Move-Item $n -Destination asc\ #-WhatIf
        #Move-Item $file -Destination 1\ #-WhatIf
    }
}

function MoveGWBasic
{
    $list = Get-ChildItem -Filter *.bas
    foreach ($file in $list)
    {
        $c = Get-Content $file -totalcount 5 # read first 5 lines
        if ($c[0] -match '^\d' -AND  $c[1] -match '^\d' -AND $c[2] -match '^\d')
        {
            Move-Item $file -Destination 1\ #-WhatIf
        }    
        #Write-Host $file + " => " + $n
        #Move-Item $n -Destination asc\ #-WhatIf
        #Move-Item $file -Destination 1\ #-WhatIf
    }
}


MoveQBasic