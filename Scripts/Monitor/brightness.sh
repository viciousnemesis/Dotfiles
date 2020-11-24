#!/bin/bash

#####################
### BRIGHTNESS.sh ###  angelic: ahhhhhhh
#####################
### Brightness control script, with logrithmic stepping, controlled via the list below.
### Can be called with a specific value, keywords 'up' or 'down', or as a percentage using '%' or 'p'
### e.g. 
###    ./brightness.sh 6060  
###    ./brightness.sh up  
###    ./brightness.sh down  
###    ./brightness.sh 35%
###    ./brightness.sh 35p


##############################
### INTEL BACKLIGHT VALUES ###
##############################
### There is some difference between 'actual_brightness' and 'brightness' files, 
### so let's use the file we manipulate as reference, 'brightness'
maxBrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
actualBrightness=$(cat /sys/class/backlight/intel_backlight/brightness)


#####################
### CALC FUNCTION ###
#####################
### Does math, as bash doesn't handle 'advanced' math, let perl do its magic.
### Everything below uses this, for consistency. Originally written as I approached
### this with doing exponential math, but the list was a better approach in the end.
calc() {
  set -f;
  input=$*;
  result=$(perl -e "print $input";echo);
  set +f;
  echo $result;
}


#########################
### STEPPING CONTROLS ###
#########################
### Modify if you want different stepping control
list=(  1
	$(calc "int($maxBrightness/512)")
	$(calc "int($maxBrightness/256)")
	$(calc "int($maxBrightness/128)")
	$(calc "int($maxBrightness/64)")
	$(calc "int($maxBrightness/32)")
	$(calc "int($maxBrightness/16)")
	$(calc "int($maxBrightness/8)")
	$(calc "int($maxBrightness/4)")
	$(calc "int($maxBrightness/2)")
	$maxBrightness)
stepUp() {
  for n in ${list[@]}; do
    if [[ $(calc "$n > $actualBrightness || $n == $maxBrightness") ]] ; then
      echo $n;
      break
    fi
  done
}
stepDown() {
  prevN=0
  for n in ${list[@]}; do
    if [[ $(calc "$n >= $actualBrightness") ]] ; then
      break
    fi
    prevN=$n;
  done
  echo $prevN;
}
getStep() {
  step=0
  for n in ${list[@]}; do
    step=$(calc "$step + 1");
    if [[ $(calc "$n >= $1") ]] ; then
      echo $step;
      break
    fi
  done
}

##########################
### BRIGHTNESS CONTROL ###
##########################
### Update the intel backlight brightness file
setBrightness() {  
  brightness=$actualBrightness;
  if [ $(calc $1 "< 1") ]; then
    brightness=1;
  elif [ $(calc $1 "> " $maxBrightness ) ]; then 	
    brightness=$maxBrightness;
  else
    brightness=$1;
  fi
  echo $brightness >> /sys/class/backlight/intel_backlight/brightness;       
  echo "Value:   $brightness";
  #Percent displays a bit weird, since a few of the low settings round to 0%
  #percent=$(calc "int($brightness/$maxBrightness*100)");
  yad --scale \
      --text 'Brightness' \
      --text-align=center \
      --timeout=1 \
      --width=300 \
      --max-value=$maxBrightness \
      --no-buttons \
      --undecorated \
      --borders=10 \
      --skip-taskbar \
      --value=$brightness \
      --posx=1600 \
      --posy=1 \
      --image=/usr/share/icons/Flat-Remix-Blue-Dark/actions/scalable/xfpm-brightness-lcd.svg \
      /      
}


###########################
### ACTUAL SCRIPT LOGIC ###
###########################
reNum='^-?[0-9]{1,}$'
reUp='^\b(up)\b$'
reDown='^\b(down)\b$'
rePercent='^(-?[0-9]+)(%|p)$'
rePercent2='^(-?[0-9]*\.[0-9]+)(%|p)$'


if [[ $1 =~ $reNum ]] ; then
 
  ########################
  ### BRIGHTNESS VALUE ###
  ########################
  setBrightness $1;


elif [[ $1 =~ $rePercent || $1 =~ $rePercent2 ]] ; then
  
  ##################
  ### PERCENTAGE ###
  ################## 
  percent=$(calc "${BASH_REMATCH[1]} / 100" );
  if [[ $(calc "$percent > 1") ]] ; then 
    percent=1;
  elif [[ $(calc "$percent < 0") ]] ; then
    percent=0;
  fi
  brightness=$(calc "int($percent*$maxBrightness)"); 
  setBrightness $brightness; 
  echo "Percent:  $(calc "$percent * 100")%";


elif [[ $1 =~ $reUp || $1 =~ $reDown ]] ; then
 
  ################	
  ### COMMANDS ###
  ################
  if [[ $1 =~ $reUp ]] ; then
    val=$(stepUp);
  elif [[ $1 =~ $reDown ]] ; then
    val=$(stepDown);
  fi
  setBrightness $val;
  echo "Step: $(getStep $val) of ${#list[@]}";


else

  ######################################
  ### Whatchu talkin' 'bout, Willis? ###
  ######################################
  echo "Command not recognized: $1";

fi



###########
### FIN ###
###########
