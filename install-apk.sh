#!/bin/bash

# WELCOME TO APK SCRIPT INSTALATION!
# For Windows run with the GIT-BASH.
# by brunorojo<--

source SysInfo.sh
source MyColors.sh
clear


# User args.
USERFILE=$1 #first arg
ENV=$2 #second arg
TRYAGAINSLEEP=10
COUNT=1


# Scans the current folder for files with the .APK extension and plays it in an array.
# @TODO: List files and ask the user to choose which one to install.
function folderScan(){
    declare -a ARRAYFILES
    for FILESTEMP in *.apk
    do
        ARRAYFILES=(${ARRAYFILES[@]} "$FILESTEMP")
	done
    APKTOINSTALL=${ARRAYFILES[0]}
    mycolors 'green' "[FOLDERSCAN] - APK File: [$APKTOINSTALL]"
}



# Function - Log Information
function funcCheckCommand(){     

    if [[ "$1" == *Success*  ]] ; then
        
		mycolors 'green' "[APK INSTALL] - [$APKTOINSTALL] successfully installed!"

        else
            echo -e "\n"
            mycolors 'red' " [APK INSTALL] - *** ERROR *** APK: [$APKTOINSTALL] "    
            mycolors 'red' " [APK INSTALL] - *** ERROR *** MSG: [$INFOINSTALL]" 
            echo -e "\n"
            mycolors 'white' "[APK INSTALL] - I will try again in $TRYAGAINSLEEP seconds..."    
            mycolors 'white' "[APK INSTALL] - Press the [CTRL+C] keys at any time to cancel the installation."   
            sleep $TRYAGAINSLEEP
            clear
            ((COUNT=COUNT+1))
            mycolors 'green' "[APK INSTALL] - Counter: $COUNT"
            funcInstall            
    fi   

}




# Run adb get-state commands until device. Check Device type.
# Outputs:(print offline | bootloader | device | error: no devices/emulators found)
function funcCheckDeviceState(){

    #echo "[DEBUG] ==> $1"

    mycolors 'green' "[DEVICE] - Waiting for device to be online. Press the [CTRL+C] keys at any time to cancel the installation..."
    $1 wait-for-any-device
    
    if  [[ "$? == 127 ]]; then
        echo "[DEBUG] - CONTROL + C"
        exit 0
    fi     

    mycolors 'green' "[DEVICE] - Device is on-line!"
    $1 get-state

}

# Check if the file exists
function funcCheckFileExists(){
if [[ -z "$USERFILE" ]]; then
    
    mycolors 'green' "[CHECK ARGS] - No user args found."

    if [ -e "$APKTOINSTALL" ] ; then
        mycolors 'green' "[CHECK FILE] - File [$APKTOINSTALL] was found!"
    
    elif [ -z "$APKTOINSTALL" ]; then
        mycolors 'red' "[CHECK FILE] - File not found."
        exit 0
    fi

    else
        mycolors 'green' "[CHECK ARGS] - User args [$USERFILE] was found."
        APKTOINSTALL=$USERFILE
    
    fi
}

# Executa a instalacao.
function funcInstall(){
    #mycolors 'green' "[APK INSTALL] - Please wait... installing: [$APKTOINSTALL]"

    # get name operation system info
    case $(get_who_i_am) in
	    windows)
            
            # (Windows) Run adb get-state commands until device. Check Device type.
            funcCheckDeviceState 'platform-tools_r30.0.4/Windows-platform-tools/adb.exe'

            # Install
            mycolors 'green' "[APK INSTALL] - [DEBUG] WINDOWS - Installing: [$APKTOINSTALL]"
            INFOINSTALL=$(platform-tools_r30.0.4/Windows-platform-tools/adb.exe install -i com.android.vending -r $APKTOINSTALL) #for Win [OK!]
            funcCheckCommand $INFOINSTALL
            ;;
	    macos)
            # (macOS) Run adb get-state commands until device. Check Device type.
            funcCheckDeviceState 'platform-tools_r30.0.4\macOS-platform-tools\adb'

            mycolors 'green' "[APK INSTALL] - [DEBUG] MACOS - Installing: [$APKTOINSTALL]"
            INFOINSTALL=$(platform-tools_r30.0.4\macOS-platform-tools\adb install -i com.android.vending -r $APKTOINSTALL) #for macOS
		    funcCheckCommand $INFOINSTALL
            ;;
	    debian)
            #mycolors 'green' "[APK INSTALL] - [DEBUG] DEBIAN - Installing: [$APKTOINSTALL]"
            mycolors 'green' "@TODO - Debian..."
            ;;
        *)
		    mycolors 'red' "[APK INSTALL] - System not found..."
		    exit 0
            ;;
    esac

}


                   ##################
                      ### GO!!! ###
                   ##################

# Calls the function that displays information about the operating system.
sysinfo

# Search apks
folderScan

# Chama a funcao para verificar se o apk existe na pasta corrente.
funcCheckFileExists

# Matar e subir o servidor adb novamente, implementado devido a uma repeticao de instalacao e desinstacao onde o servidor parou de responder.
#echo -e "$tagBlue [ADB]$tagEnd - Kill adb server."
#adb kill-server 2>/dev/null
#echo -e "$tagBlue [ADB]$tagEnd - Start adb server."
#adb start-server 2>/dev/null
#echo -e "$tagBlue [ADB]$tagEnd - Restart device usb."
#adb usb device -d 2>/dev/null



# Install APK!
funcInstall


echo -e "\n"
mycolors 'blue' "[THE END] - [$(date +%d-%m-%Y)] - [$(date +%T)]  "
exit 0
