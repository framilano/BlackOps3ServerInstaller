T7xUrl="https://master.bo3.eu/t7x/t7x.exe"

#Updating stuff
sudo apt update
sudo apt upgrade -y

#Install curl and wget
sudo apt install curl wget -y

#WINE
if [ $1 == "ubuntu" ]; then
    sudo dpkg --add-architecture i386
    sudo mkdir -pm755 /etc/apt/keyrings
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
    sudo apt update
    sudo apt install --install-recommends winehq-staging -y
    #Retrieves SteamCMD
    sudo add-apt-repository multiverse -y; sudo apt update
    sudo apt install steamcmd -y
fi

if [ $1 == "debian" ]; then
    sudo dpkg --add-architecture i386
    sudo mkdir -pm755 /etc/apt/keyrings
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
    sudo apt update
    sudo apt install --install-recommends winehq-staging -y
    #Retrieves SteamCMD
    sudo apt install software-properties-common
    sudo apt-add-repository non-free
    sudo apt install steamcmd
fi


#Downloading server files
current_dir=$(pwd)
steamcmd +force_install_dir "$current_dir" +login anonymous +@sSteamCmdForcePlatformType windows +app_update 545990 validate +quit

#deleting unecessary folders
rm -rf steamapps

#deleting unecessary files
cd UnrankedServer
#rm -rf copydedicated.bat
#rm -rf  Launch_Server.bat

#downloading latest t7x client
curl -L $T7xUrl -o t7x.exe