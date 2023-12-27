# BlackOps3ServerInstaller

Simplifying BO3 server installation for both vanilla versions and unofficial clients. \
**No copyrighted files are distributed using this script.** \
\
This repository merges configurations and scripts from these projects:\
[EZZ BOIII](https://github.com/Ezz-lol/boiii-free) (currently the best custom client) \
[T7 Configuration files](https://github.com/Dss0/t7-server-config)

## How to install
1. Clone this repository wherever you want to install the server
2. Double click on `server_files_downloader.bat`
3. Wait for server files to download through [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD)
4. Wait for the custom client latest executable to download  (currently [EZZ BOIII](https://forum.ezz.lol/category/7/boiii))
5. **(For Custom Clients like BOIII)** You can now edit `BOIII_Server.bat` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
6. **(For Custom Clients like BOIII)** Launch your server using `BOIII_Server.bat`
7. **(For official servers on vanilla BO3)** Launch your server using `Launch_Server.bat`
5. Done!

## Cool, but Zombies?
The default server files only download MP-ready stuff. To serve a Zombies server you need to copy these fast files
from your BO3 game files and put them into `zone`:

```
zone/en_zm_patch.ff
zone/en_zm_common.ff
zone/zm_patch.ff
zone/zm_common.fd
zone/zm_common.ff
zone/zm_levelcommon.ff
```
Let's say you want to create a Shadows of Evil server, you need to copy these fast files too.
```
zone/en_zm_zod.ff
zone/en_zm_zod_patch.ff
zone/zm_zod.ff
zone/zm_zod.fd
zone/zm_zod_patch.ff
```

## Linux Compatibility
Official BO3 servers only aimed for Windows support, but [Wine](https://www.winehq.org/) can help us run it on Linux too. Sadly, steamcmd can't download directly BO3 Server files due to compatibility reasons. The setup process is different, but it works.
### Requirements
- I assume for this guide that you're using an Ubuntu-based platform, I tested it on Ubuntu 22.04
- Git and Wget installed on your machine
- Black Ops 3 server files downloaded on a Windows machine using `server_files_downloader.bat`

### Instructions
1. **[On Linux]** Clone this repo wherever you want to put your server
2. **[On Linux]** Make `ubuntu_dependencies.sh` executable using `chmod +x` and run it
3. **[On Linux]** This will install Wine Staging and place the latest custom client (boiii) inside the `UnrankedServer` folder
4. **[From Windows to Linux]** Move the content of the `UnrankedServer` folder downloaded using `server_files_downloader.bat` to the `UnrankedServer` on your Linux machine.
5. **[On Linux]** Make `BOIII_Server.sh` executable using `chmod +x`
6. **[On Linux]** Edit your `BOIII_Server.sh` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
7. Done! You can launch your server executing `BOIII_Server.sh`

## Notes
1. Unless you're playing LAN with friends, you need to port forward you router and open the ports used by your server in Windows Firewall.
2. If you don't need any custom client, just delete `boiii.exe`.
3. Remember to change the port in `BOIII_XX_Server.bat` if you're launching the server in the same machine where you're playing Black Ops 3.
4. To save space, you can delete any unused fast file in `UnrankedServer/zone`
5. **(For Custom Clients like BOIII)** To customise your server maps rotation and gamemodes just edit the files in `UnrankedServer/zone`, `server_zm.cfg` changes zombies configuration, `server.cfg` changes multiplayer configurations, `server_cp.cfg` changes coop campaign configuration.
These files can be executed even with the vanilla `Launch_Server.bat` but you need to edit it first to execute the desired cfg file.
