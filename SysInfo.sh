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
    local my_uname=$(uname) # Win10_OK/ Debian_OK
    
    # Convert to lowercase:
    local my_uname=${my_uname,,} 
    
    # Verify type operation system
    if [[ "$my_uname" == *mingw64_nt* ]]; then
      
        echo "windows"
        
    elif [[ "$my_uname" == *debian* ]]; then
      
        echo "debian"

    elif [[ "$my_uname" == *macos* ]]; then
      
        echo "macos"

    else

        echo "notfound"
    
    fi



}

