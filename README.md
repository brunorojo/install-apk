# Script that performs the installation of the APK on android devices and emulators.

This script installs the APK on Android devices, when running it it looks for the file with extension .APK, which must be in the same folder as the script, and install the APK on the device that must be connected physically on the computer.

- It is possible to run the script, without first connecting the >device to the computer or starting the emulator, when the >script identifies that a device or an emulator is online, the > installation of the apk starts.

## Important informations:

 - For Windows 10 and macOS Catalina (Darwin)
 - "ADB" command must be configured on the computer.
 - The APK file name cannot contain space. (@FIXME)
 - It cannot contain more than one APK file in the folder, otherwise it installs the first one it finds.

## Pre condition:

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

```bash
./install-apk.sh my-app.apk
```
___
## by Bruno Rojo   
