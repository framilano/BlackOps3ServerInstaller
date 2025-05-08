set "SteamcmdUrl=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set "T7XUrl=https://master.bo3.eu/t7x/t7x.exe"

::Retrieves SteamCMD
curl -s "%SteamcmdUrl%" -o steamcmd.zip
mkdir steamcmd
move steamcmd.zip steamcmd
cd steamcmd
tar -xf steamcmd.zip

::Downloading server files
steamcmd +force_install_dir "..\" +login anonymous +app_update 545990 validate +quit

::deleting unecessary folders
cd ..
rd /s /q steamapps
rd /s /q steamcmd

::deleting unecessary files
cd UnrankedServer
::del copydedicated.bat
::del Launch_Server.bat

::downloading latest t7/boiii/bo3 client
curl -L "%T7XUrl%" -o t7x.exe