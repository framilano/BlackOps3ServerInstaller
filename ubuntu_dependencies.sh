BoiiiUrl="https://github.com/Ezz-lol/boiii-free/releases/latest/download/boiii.exe"

#Updating stuff
sudo apt update
sudo apt upgrade -y

#WINE
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo apt update
sudo apt install --install-recommends winehq-staging

#Downloading latest t7/boiii/bo3 client
cd UnrankedServer
curl -L $BoiiiUrl -o boiii.exe