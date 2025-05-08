#!/usr/bin/env bash
set -euo pipefail

BoiiiUrl="https://github.com/Ezz-lol/boiii-free/releases/latest/download/boiii.exe"

# ─── Update system ───────────────────────────────────────────────────────────
sudo apt update
sudo apt upgrade -y

# ─── Prerequisites ───────────────────────────────────────────────────────────
sudo apt install -y curl wget software-properties-common

# ─── WINE (Debian 12 Bookworm) ────────────────────────────────────────────────
# enable 32-bit support
sudo dpkg --add-architecture i386

# add WineHQ key
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key \
     https://dl.winehq.org/wine-builds/winehq.key

# add the Bookworm WineHQ repository
cat <<EOF | sudo tee /etc/apt/sources.list.d/winehq-bookworm.list
deb [signed-by=/etc/apt/keyrings/winehq-archive.key] \
    https://dl.winehq.org/wine-builds/debian/ bookworm main
EOF

sudo apt update
sudo apt install --install-recommends -y winehq-staging

# ─── STEAMCMD (Debian non-free) ───────────────────────────────────────────────
# enable non-free + 32-bit
sudo add-apt-repository non-free
sudo dpkg --add-architecture i386

sudo apt update
sudo apt install -y steamcmd

# ─── BLACK OPS 3 SERVER DOWNLOAD ──────────────────────────────────────────────
current_dir=$(pwd)
steamcmd +force_install_dir "$current_dir" \
        +login anonymous \
        +@sSteamCmdForcePlatformType windows \
        +app_update 545990 validate \
        +quit

# clean up
rm -rf steamapps

# switch into the unpacked server dir
cd UnrankedServer

# (optional) remove leftover .bat files
# rm -f copydedicated.bat Launch_Server.bat

# ─── Download latest t7/boiii/bo3 client ────────────────────────────────────
curl -L "$BoiiiUrl" -o boiii.exe

echo "Done! Your Black Ops 3 server and BOIII client are ready."
