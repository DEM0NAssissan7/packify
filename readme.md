
# Prerequisites
- A UNIX-like operating system (Linux, Mac OS)
- Bash, `tar`, and Java JDK (java-latest-openjdk on Red Hat systems)
- A forge installer jar

# Setup

### Information
- Navigate to the **setup/** folder
- Put the information about your mod in the modinfo.sh
    - The file is already templated. You just need to plug in the information.

### Forge
- Copy your forge installer jar to **setup/forge/** and rename it to "forge.jar"

### Copying
- Copy your mods to the **instance/mods** folder
- Copy any extra files you want in the user instance to the **instance/** folder

### Finishing
- Run `./setup.sh`
    - The installer will automatically set up all the files and create the files for you to share with your friends.
    - Change the forge install directory to the **setup/forge/client/** directory (in the packify folder)
    - You only need to set up forge once (unless you change the version of forge used)
- After the setup finishes, the resulting files will be in the **out/** folder.
- If you ever need to make changes to your modpack, just run `./setup.sh` to regenerate all the files.

# Sharing
To share your modpack with your friends, navigate to the **out/** folder. In there, you will find a file named *modpack*-client.tar.gz.

Share this with your friends for them to be able to install the modpack. All they have to do is extract the archive and run `./install.sh`.

# Server
To install the modpack on your server, go to the **out/** folder and look for *modpack*-server.tar.gz. Copy this to your server, extract, and run the install.sh.

To run the server, do `cd ~/nameofmodpack/` and run `./run.sh`.