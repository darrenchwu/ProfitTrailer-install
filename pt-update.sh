#!/bin/bash
# Author:  Darren (darrenchwu)
# Origin author: Xlemon

##
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

currentDir=$PWD

# Download newest PT
curl https://api.github.com/repos/taniman/profit-trailer/releases/latest|grep -Po '"browser_download_url": *\K"[^"]*"'|sed 's/"\|,//g'|xargs wget -O pt.zip

unzip -j -o pt.zip ProfitTrailer/ProfitTrailer.jar

rm  pt.zip


printf "Done!\n"