#!/bin/bash
# cravend.theme is created by @cravend (https://github.com/cravend) and licensed 
# under the MIT license (https://github.com/cravend/theme/blob/main/LICENSE.md).

battery=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
output=""

for (( i=5; i<=$battery; i+=10 ))
do
  output+="●"
done

for (( i=($battery + 1); i <= 95; i+=10 ))
do
  output+="○"
done

color_green='%{\033[0;32m%}'
color_yellow='%{\033[0;33m%}'
color_red='%{\033[0;31m%}'
color_reset='%{\033[0m%}'

if [ $battery -ge 50 ]
then
  color=$color_green
elif [ $battery -ge 20 ]
then
  color=$color_yellow
else
  color=$color_red
fi

echo -e "${color}${output}${color_reset}"

