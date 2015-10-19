function Exec
{
    # source: http://joshua.poehls.me/2012/powershell-script-module-boilerplate/

    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=1)]
        [scriptblock]$Command,
        [Parameter(Position=1, Mandatory=0)]
        [string]$ErrorMessage = "Execution of command failed.`n$Command"
    )
    & $Command
    if ($LastExitCode -ne 0) {
        throw "Exec: $ErrorMessage"
    }
}

"Setting up environment..."
""
Exec { dnvm use default }
""

"Restoring packages..."
""
Exec { dnu restore }
""

"Building projects.."
""
Exec { dnu build ./src/* ./samples/* }
""