#!/bin/bash
source modinfo.sh

echo Setting up $fancy_pack_name
echo ---------------------------
echo

echo Creating startup variables
cd ..
root_directory=`pwd`
build_directory="$root_directory"/build

if [[ -d "$root_directory/setup/forge/client/libraries" ]]; then
	echo Forge has already been configured. Skipping setup.
else
	echo Configuring forge
	cd "$root_directory"
	forge_jar="$root_directory/setup/forge/forge.jar"
	echo
	java -jar "$forge_jar"
	rm installer.log
	java -jar "$forge_jar" --installServer "$root_directory"/setup/forge/server/
	echo
fi

echo Creating build environment
cd "$root_directory"
rm -rf build/
mkdir -p build/

echo Copying files
cd "$root_directory"
# Copy templates
cp -r templates/client build/
cp -r templates/server build/
# Copy instance
cp -r setup/instance/* build/client/instance/
cp -r setup/instance/* build/server/instance/
# Copy forge
cp -r setup/forge/client/versions/ build/client/forge/
cp -r setup/forge/client/libraries/ build/client/forge/
cp -r setup/forge/server/* build/server/instance/
# Copy mod info
cp setup/modinfo.sh build/client/info/
cp setup/modinfo.sh build/server/info/

echo Removing old archives
rm -rf "$root_directory/out/*"

echo Creating client archive
cd "$root_directory/build/client"
tar -zcf "$pack_name-client.tar.gz" info install.sh instance instructions.md forge
cp "$pack_name-client.tar.gz" "$root_directory/out/"

echo Creating server archive
cd "$root_directory/build/server"
tar -zcf "$pack_name-server.tar.gz" info install.sh instance instructions.md
cp "$pack_name-server.tar.gz" "$root_directory/out/"

echo Cleaning up build environment
cd "$root_directory"
rm -rf build

echo Setup finished. Output files are in [out/].