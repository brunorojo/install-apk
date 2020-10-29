#!/bin/bash
source MyColors.sh

function sysinfo() {

    # SO and shell type:
    mycolors 'blue' "[SYSINFO] - OSTYPE: $OSTYPE" #Win10_OK
    mycolors 'blue' "[SYSINFO] - SHELL: $SHELL" #Win10_OK

    # Get hostname
    local hostname=$(hostname); # Win10_OK/ Debian_OK
    mycolors 'blue' "[SYSINFO] - HOSTNAME: [$hostname]"
    
    # Get computer name.
    local my_uname=$(uname); # Win10_OK/ Debian_OK
    mycolors 'blue' "[SYSINFO] - UNAME: $my_uname"

}

# Verify type operation system
function get_who_i_am(){

    # Get computer name. #MINGW64_NT-10.0-19042
    local my_uname=$(uname) # Win10_OK/ Debian_OK/ masOS_OK
    
    # Convert to lowercase: [@FIXME-Doesnt work in macOS. (Work in Windows.)]
    #local my_uname=${my_uname,,} 
    
    # Verify type operation system
    if [[ "$my_uname" == *MINGW64_NT* ]]; then
      
        echo "windows"

    elif [[ "$my_uname" == *Darwin* ]]; then
      
        echo "macos"

    elif [[ "$my_uname" == *debian* ]]; then
      
        echo "debian"    

    else

        echo "notfound"
    
    fi



}

