Function Invoke-Main {
    # Install Chocolatey
    # Must run as admin before running this script: 
    if (Test-CommandExists "choco")
    {
        Write-Output "Chocolatey is installed... installing packages"
    }
    else
    {
        Write-Output "Chocolatey not found, installing chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
    }

    # Install my MFING packages
    # The always list
    choco install git -y
    choco install vim -y
    choco install googlechrome -y
    choco install jetbrainstoolbox -y
    choco install vscode -y
    choco install openoffice -y
    choco install gimp -y
    choco install spotify -y
    choco install steam -y
    choco install twitch -y
    choco install discord -y
    choco install 7zip -y

    # Maybe?
    # choco install utorrent -y
    # choco install adobereader -y
    # choco install geforce-experience -y
    # choco install audacity -y

    # Extra dev stuff 
    choco install python -y
    choco install nodejs -y
    choco install openjdk -y
    choco install cmdermini -y
}

Function Test-CommandExists {
    Param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = "stop"
    try { if (Get-Command $command) { RETURN $true } }
    Catch { Write-Host "$command does not exist"; RETURN $false }
    Finally { $ErrorActionPreference = $oldPreference }
}

Invoke-Main
