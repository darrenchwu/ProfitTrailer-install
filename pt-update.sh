#!/bin/bash
# Author:  Darren (darrenchwu)

##
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Download newest PT
curl -s https://api.github.com/repos/taniman/profit-trailer/releases|grep -Po '"browser_download_url": *\K"[^"]*"'|sed 's/"\|,//g'|xargs wget -O pt.zip

# Unzip jar file
unzip -j -o pt.zip ProfitTrailer/ProfitTrailer.jar

#remove downloaded file
rm  pt.zip

