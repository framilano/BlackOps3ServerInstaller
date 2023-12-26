SteamcmdUrl="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
BoiiiUrl="https://github.com/Ezz-lol/boiii-free/releases/latest/download/boiii.exe"

#Downloading server files
steamcmd +force_install_dir .. +login anonymous +app_update 545990 validate +quit

#deleting unecessary folders
cd ..
rm -rf steamapps
rm -rf steamcmd

#deleting unecessary files
cd UnrankedServer
#del copydedicated.bat
#del Launch_Server.bat

#downloading latest t7/boiii/bo3 client
curl -L $BoiiiUrl -o boiii.exe