source info/modinfo.sh
mod_count=`ls -l instance/mods/ | wc -l`

echo Preparing installation
echo Detecting Minecraft installation type...
isflatpak=0
if [[ -d ~/.var/app/com.mojang.Minecraft ]]; then
	isflatpak=1
fi

root_directory=~
pack_directory=.$pack_name
if [ $isflatpak == 1 ]; then
	echo Install type: Flatpak
	root_directory=~/.var/app/com.mojang.Minecraft
fi
if [ $isflatpak == 0 ]; then
	echo Install type: Local
fi

echo The installer is now going to start writing files to the disk.
echo "> $mod_count mod files"
echo "Target directory: $root_directory/$pack_directory"
read -p "Press [ENTER] to accept these changes [or press Ctrl+C to cancel]> "
echo

echo Installing $fancy_pack_name client...

if [[ -d "$root_directory/$pack_directory" ]]; then
    echo Removing old instance mods...
    rm -rf "$root_directory/$pack_directory/mods"
fi

cp -r forge/* "$root_directory/.minecraft/"
cp -r instance/* "$root_directory/$pack_directory/"

echo Installation finished!