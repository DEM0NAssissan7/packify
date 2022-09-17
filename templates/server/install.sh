source info/modinfo.sh
mod_count=`ls -l instance/mods/ | wc -l`

root_directory=~
pack_directory=$pack_name

echo The installer is now going to start writing files to the disk.
echo "> $mod_count mod files"
echo "Target directory: $root_directory/$pack_directory"
read -p "Press [ENTER] to accept these changes [or press Ctrl+C to cancel]> "
echo

echo Installing $fancy_pack_name server...

if [[ -d "$root_directory/$pack_directory" ]]; then
    echo Removing old instance mods...
    rm -rf "$root_directory/$pack_directory/mods"
fi

mkdir -p "$root_directory/$pack_directory"
cp -r instance/* "$root_directory/$pack_directory/"

echo Installation finished!