#!/bin/bash
# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use the root user to install the software."
    exit 1
fi

clear && clear

echo "Did you run this script before? (y/n)"
read ft

if [ $ft = "n" ]
then
        cd /tmp
        #Create folder to host databases
        mkdir /usr/local/share/GeoIP/
        
        #Download databases, extract them and put them in the right folder
        wget -N http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
        wget -N http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
        gunzip GeoIP.dat.gz && gunzip GeoLiteCity.dat.gz
        mv GeoIP.dat /usr/local/share/GeoIP/
        mv GeoLiteCity.dat /usr/local/share/GeoIP/
fi


if [ $ft = "y" ]
then
        cd /tmp
        #Delete old databases
        rm /usr/local/share/GeoIP/GeoIP.dat
        rm /usr/local/share/GeoIP/GeoLiteCity.dat
        
        #Download databases, extract them and put them in the right folder
        wget -N http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
        wget -N http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
        gunzip GeoIP.dat.gz && gunzip GeoLiteCity.dat.gz
        mv GeoIP.dat /usr/local/share/GeoIP/
        mv GeoLiteCity.dat /usr/local/share/GeoIP/
fi
