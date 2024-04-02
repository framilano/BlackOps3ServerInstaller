BoiiiUrl="https://github.com/Ezz-lol/boiii-free/releases/latest/download/boiii.exe"

#Updating stuff
sudo apt update
sudo apt upgrade -y

#Install curl and wget
sudo apt install curl wget -y

#WINE
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install --install-recommends winehq-staging -y

#Retrieves SteamCMD
sudo add-apt-repository multiverse -y; sudo apt update
sudo apt install steamcmd -y

#Downloading server files
current_dir=$(pwd)
steamcmd +force_install_dir "$current_dir" +login anonymous +@sSteamCmdForcePlatformType windows +app_update 545990 validate +quit

#deleting unecessary folders
rm -rf steamapps

#deleting unecessary files
cd UnrankedServer
#rm -rf copydedicated.bat
#rm -rf  Launch_Server.bat

#downloading latest t7/boiii/bo3 client
curl -L $BoiiiUrl -o boiii.exe