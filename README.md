# BlackOps3ServerInstaller

Simplifying BO3 server installation for both vanilla BO3 and unofficial clients (like T7X). \
**No copyrighted files are distributed using these scripts.** \
\
This repository merges configurations and scripts from these projects:\
[T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2) (currently the best custom client) \
[T7 Configuration files](https://github.com/Dss0/t7-server-config)\
[BOIIIEasyServer](https://github.com/rcv11x/BOIIIEasyServer)

**You can create servers on both Linux-based platforms and Windows.**

## Table of Contents  
- [How to install (Windows)](#how-to-install-windows)
- [How to install (Linux)](#how-to-install-linux)
- [Cool, but Zombies?](#cool-but-zombies)
- [Mods?](#mods)
- [Notes](#notes)

## How to install on Windows
1. Clone this repository wherever you want to install the server
2. Double click on `server_files_downloader.bat`
3. Wait for server files to download through [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD)
4. Wait for the custom client latest executable to download  (currently [T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2))
5. **(For Custom Clients)** You can now edit `T7X_Server.bat` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
6. **(For Custom Clients)** Launch your server using `T7X_Server.bat`
7. **(For official servers on vanilla BO3)** Launch your server using `Launch_Server.bat`
5. Done!

## How to install on Linux (Ubuntu, Debian, Arch)
Official BO3 servers only aimed for Windows support, but [Wine](https://www.winehq.org/) can help us run it on Linux too.
1. Clone this repository wherever you want to install the server
2. Make `server_files_downloader.sh` executable using `chmod +x` and execute it with `./server_files_downloader.sh ubuntu` (note, I currently support `ubuntu`, `debian` and `arch`). Example, if you're on arch just type `./server_files_downloader.sh arch`
3. Follow the setup "wizard" and confirm a bunch of wine required steps. Wait for server files to download through [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD)
4. Wait for the custom client latest executable to download  (currently [T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2))
5. **(For Custom Clients)** Make `T7X_Server.sh` executable using `chmod +x`. Edit your `T7X_Server.sh` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
6. **(For Custom Clients)** Launch your server using `T7X_Server.sh` (note, inside this script on the `wine` line there's the `-headless` argument that must be used if you don't any graphical interface, do not use it if you have a DE)
7. **(For official servers on vanilla BO3)** Launch your server using `Launch_Server.sh`
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

## Mods?
There's a difference between Custom Maps and Mods, this section will explain how to load a mod downloaded from the Steam Workshop.
Let's say you subscribed to the [The Kermit Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=1638465081), this will create a folder in your Steam folder in `steamapps/workshop/content/311210/1638465081`, create a new `mods` folder inside your BO3 Server installation folder and simply copy the folder named `1638465081` (this number changes depending on the mod) inside it. The resulting folders structure should look like this:

![immagine](https://github.com/user-attachments/assets/23843aca-0bd8-4dbc-8cfe-8dba4eba12c0)

Now modify the `set ModFolderName=` in `T7X_Server.bat` into `set ModFolderName=1638465081`, that's it, you're done!

## Notes
1. Unless you're playing LAN with friends, you need to port forward you router and open the ports used by your server in Windows Firewall.
2. If you don't need any custom client, just delete `t7x.exe`.
3. Remember to change the port in `T7X_Server.bat` if you're launching the server in the same machine where you're playing Black Ops 3.
4. To save space, you can delete any unused fast files in `UnrankedServer/zone`
5. **(For Custom Clients)** To customise your server maps rotation and gamemodes just edit the files in `UnrankedServer/zone`, `server_zm.cfg` changes zombies configuration, `server.cfg` changes multiplayer configurations, `server_cp.cfg` changes coop campaign configuration.
These files can be executed even with the vanilla `Launch_Server.bat` but you need to edit it first to execute the desired cfg file.
