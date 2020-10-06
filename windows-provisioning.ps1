# Install Chocolatey
# Must run as admin before running this script: 
# Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
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
choco install utorrent -y
choco install adobereader -y
choco install geforce-experience -y
choco install audacity -y

# Extra dev stuff 
choco install python -y
choco install nodejs -y
choco install openjdk -y
choco install cmdermini -y
