# Powershell v.1 profile
#

# Trying to make my powershell Bashlike :D
new-alias grep findstr


# To make links (symbolic )
function mklink { cmd /c mklink $args }

# I am already improved 
new-alias vi vim

#which command in wondws
New-Alias which get-command

#Touch To Create an Empty file or update timestamp
Function Touch-File
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}
