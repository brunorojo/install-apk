# Installing the APK on physical Android Devices or Emulators.
This script installs the APK on Android devices, when running it it looks for the file with extension .APK,
which must be in the same folder as the script, and install the APK on the device that must be connected
physically on the computer.

# Important informations:
> - "ADB" command must be configured on the computer.
> - The APK file name cannot contain space. (@FIXME)
> - It cannot contain more than one APK file in the folder, otherwise it installs the first one it finds.

# Pre condition:
- Execution permission for the file _install-apk.sh_:
```bash
chmod 770 install-apk.sh
```

## How to use:
STEP 1 - Paste the .APK file into the install-apk.sh script folder.  
STEP 2 - Using git-bash for Windows or via the MAC terminal, run the command:  
```bash
./install-apk.sh
```


## Bruno Rojo
## brunoasrojo@gmail.com
