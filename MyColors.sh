#!/bin/bash

# by: brunorojo<--

# @TODO: select background color.
# @TODO: select font type.

## TPUT COLORS CAPABILITIES:
#	Set a background color using ANSI escape: tput setab [1-7]
#	Set a foreground color using ANSI escape: tput setaf [1-7]
#					  Set a background color: tput setb  [1-7]
#	       			  Set a foreground color: tput setf  [1-7]

###	 TPUT TEXT MODE CAPABILITIES:
#		      Set bold mode: tput bold
#  Turn on half-bright mode: tput dim 
#	   Begin underline mode: tput smul
#	    Exit underline mode: tput rmul
#	   Turn on reverse mode: tput rev
#	    Enter standout mode: tput smso
#	     Exit standout mode: tput rmso
#	Turn off all attributes: tput sgr0

## COLOR CODE FOR TPUT:
#	  Black: 0
#	    Red: 1
#	  Green: 2
#	 Yellow: 3
#	   Blue: 4
#	Magenta: 5
#	   Cyan: 6
#	  White: 7

declare -A array_colors
	array_colors['black']=0
	array_colors['red']=1
	array_colors['green']=2
	array_colors['yellow']=3
	array_colors['blue']=4
	array_colors['magenta']=5
	array_colors['cyan']=6
	array_colors['white']=7

declare -A array_types
	array_colors['bold']=0	

function mycolors {
	local color_code=${array_colors[$1]}	
	shift
	if [ $color_code ]; then
		tput setaf $color_code; tput bold; echo "$*"; tput sgr0

	else
		echo "$*"
	fi
}


	