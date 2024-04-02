set "SteamcmdUrl=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set "BoiiiUrl=https://github.com/Ezz-lol/boiii-free/releases/latest/download/boiii.exe"

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
curl -L "%BoiiiUrl%" -o boiii.exe