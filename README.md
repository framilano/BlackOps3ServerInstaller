# BlackOps3ServerInstaller

Simplifying Black Ops 3 server installation for both Steam Black Ops 3 and Custom Clients (like T7X or BOIII). \
**No copyrighted files are distributed using these scripts.** \
\
This repository merges configurations and scripts from these projects:\
[T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2)\
[EZZBOIII](https://forum.ezz.lol/topic/5/bo3-guide)\
[T7 Configuration files](https://github.com/Dss0/t7-server-config)\
[BOIIIEasyServer](https://github.com/rcv11x/BOIIIEasyServer)

**You can create servers on both Linux-based platforms and Windows.**

**There doesn't seem to be a way to run zombies server using the official BO3 Server Launcher. Currently zombies servers are only available using custom clients**

## Table of Contents  
- [How to install on Windows](#how-to-install-windows)
- [How to install on Linux (Ubuntu, Debian, Arch)](#how-to-install-linux)
- [EZZBOIII additional step](#ezzboiii-additional-step)
- [Cool, but Zombies?](#cool-but-zombies)
- [Mods?](#mods)
- [Custom Maps?](#custom-maps)
- [Notes](#notes)

## How to install on Windows
1. Clone this repository wherever you want to install the server
2. Double click on `server_files_downloader.bat`
3. Wait for server files to download through [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD)
4. Wait for the custom clients executable to download  (currently [T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2) or [EZZBOIII](https://forum.ezz.lol/topic/5/bo3-guide))
5. **(For Custom Clients)** You can now edit `CustomClient_Server.bat` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
6. **(For Custom Clients)** Launch your server using `CustomClient_Server.bat boiii` if you want to use EZBOIII or `CustomClient_Server.bat t7x` if you want to use T7X
7. **(For official servers on vanilla BO3)** Launch your server using `Launch_Server.bat`
5. Done!

## How to install on Linux (Ubuntu, Debian, Arch)
Official BO3 servers only aimed for Windows support, but [Wine](https://www.winehq.org/) can help us run it on Linux too.
1. Clone this repository wherever you want to install the server
2. Make `server_files_downloader.sh` executable using `chmod +x` and execute it with `./server_files_downloader.sh ubuntu` (note, I currently support `ubuntu`, `debian` and `arch`). Example, if you're on arch just type `./server_files_downloader.sh arch`
3. Follow the setup "wizard" and confirm a bunch of wine required steps. Wait for server files to download through [steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD)
4. Wait for the custom clients executable to download  (currently [T7X](https://forum.alterware.dev/t/how-to-install-the-t7x-client/1418/2) or [EZZBOIII](https://forum.ezz.lol/topic/5/bo3-guide))
5. **(For Custom Clients)** Make `CustomClient_Server.sh` executable using `chmod +x`. Edit your `CustomClient_Server.sh` and `zone/server.cfg` (or `zone/server_cp.cfg` or `zone/server_zm.cfg`) with your desired settings
6. **(For Custom Clients)** Launch your server using `CustomClient_Server.sh boiii` if you want to use EZBOIII or `CustomClient_Server.sh t7x` if you want to use T7X
7. **(For official servers on vanilla BO3)** Launch your server using `Launch_Server.sh`
5. Done!

## EZZBOIII additiona step
BOIII requires some additional files in your `%APPDATA%/Local` folder to create a new server. Extract `boiii-server-files.zip` and move the boiii folder:
- Windows: in your %APPDATA%/Local folder
- Linux: open your wine prefix and copy the `boiii` folder in `AppData/Local` folder present in it

## Cool, but Zombies?
The default server files only download MP-ready stuff. To serve a Zombies server you need to copy these fast files
from your BO3 game files and put them into `zone`:

```
zone/en_zm_patch.ff
zone/en_zm_common.ff
zone/en_zm_levelcommon.ff
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

Now modify the `set ModFolderName=` in `CustomClient_Server.bat` into `set ModFolderName=1638465081`, that's it, you're done!

## Custom Maps?
This section will explain how to load custom maps downloaded from the Steam Workshop.
Let's say you downloaded the [Mob of the Dead](https://steamcommunity.com/sharedfiles/filedetails/?id=3373649394) custom map and want to host a server with it, create the `usermaps` folder on the root of your server folder (in UnrankedServer) and create a folder within it called `zm_prison` (the map codename, easily guess the name from the map gamefiles), put all map files inside this folder.

![Screenshot_2025-05-10_22-47-36](https://github.com/user-attachments/assets/002f790f-9843-4288-8fb4-67c929bb4f61)

Edit `server_zm.cfg` and add in map rotation `zm_prison`

![Screenshot_2025-05-10_22-48-31](https://github.com/user-attachments/assets/6267c713-6a9e-4c53-a493-d256aba5a85c)

That's it


## Notes
1. Unless you're playing LAN with friends, you need to port forward you router and open the ports used by your server in Windows Firewall.
2. If you don't need any custom client, just delete `t7x.exe` or `boiii.exe`.
3. Remember to change the port in `CustomClient_Server.bat` if you're launching the server in the same machine where you're playing Black Ops 3.
4. To save space, you can delete any unused fast files in `UnrankedServer/zone`
5. **(For Custom Clients)** To customise your server maps rotation and gamemodes just edit the files in `UnrankedServer/zone`, `server_zm.cfg` changes zombies configuration, `server.cfg` changes multiplayer configurations, `server_cp.cfg` changes coop campaign configuration.
These files can be executed even with the vanilla `Launch_Server.bat` or `Launch_Server.sh` but you need to edit these first to execute the desired .cfg file.
