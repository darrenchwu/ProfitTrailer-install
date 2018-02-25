#!/bin/bash
# Author:  Darren (darrenchwu)
# Origin author: Xlemon

##
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
clear
printf "
#############################################################################################
#                     Update ProfitTrailer to new version for RunPT                         #
#############################################################################################
"

currentDir=$PWD

# Check if user is root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

apt-get install wget curl unzip zip -y


# Download newest PT
curl https://api.github.com/repos/taniman/profit-trailer/releases/latest|grep -Po '"browser_download_url": *\K"[^"]*"'|sed 's/"\|,//g'|xargs wget -O pt.zip

rm -rf /tmp/ProfitTrailer
unzip pt.zip -d /tmp/

cp /tmp/ProfitTrailer/ProfitTrailer.jar $currentDir

# Start to mod PT
unzip /tmp/ProfitTrailer/ProfitTrailer.jar -d /tmp/ProfitTrailer/unzip


# add js load script
sed '644i    \<script src=\"js/ProfitTrailer_GUI_extensions_v1.1.user.js\"></script>' -i /tmp/ProfitTrailer/unzip/BOOT-INF/classes/templates/index.ftl

pt_plugin_file="/tmp/ProfitTrailer/unzip/BOOT-INF/classes/static/js/ProfitTrailer_GUI_extensions_v1.1.user.js"

curl -o $pt_plugin_file https://github.com/darrenchwu/ProfitTrailer/raw/master/ProfitTrailer_GUI_extensions_v1.1.user.js

# Change Folder
cd /tmp/ProfitTrailer/unzip
# pack jar
zip -r -0 ../ProfitTrailer.jar ./*

cd $currentDir
mv /tmp/ProfitTrailer/ProfitTrailer.jar ProfitTrailer.jar-mod

rm -rf /tmp/ProfitTrailer updatept.sh pt.zip


printf "Done!\n"