$dnvmInstalled = Get-Command dnvm -erroraction 'silentlycontinue'
If (!$dnvmInstalled)
{
    "Installing DNVM..."
    ""
    &{$Branch='dev';iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.ps1'))}
    ""
}

Function GetRequiredVersion()
{    
    $captures = gc "global.json" | 
                select-string -Pattern '"version"\s*:\s*"(?<version>[0-9a-zA-Z\-\.]+)"'
                 
    If ($captures.Matches.Count -le 0)
    {
        Throw "Cannot resolve required version"
    }

    $captures.Matches[0].Groups["version"].Value
}

$version = GetRequiredVersion;

"Installing runtimes..."
""
&dnvm install $version -r clr
&dnvm install $version -r coreclr -alias default
&dnvm use default
""

"Restoring packages..."
""
&dnu restore
""

"Building projects.."
""
&dnu build ./src/* ./samples/*
""