#!/bin/bash
# Author:  Darren (TG @darrenchwu)
# Mod 2018/5/8 for PT 2.0.3

##
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Download newest PT
curl -s https://api.github.com/repos/taniman/profit-trailer/releases/latest|grep -Po '"browser_download_url": *\K"[^"]*"'|sed 's/"\|,//g'|xargs wget -O pt.zip

# Unzip file
unzip -j -o -q -d pt-unzip pt.zip

# Copy unzip jar to replace existing jar
cp pt-unzip/ProfitTrailer.jar .

#remove downloaded file
rm  -rf pt.zip pt-unzip

