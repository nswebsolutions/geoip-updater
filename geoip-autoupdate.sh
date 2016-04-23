#!/bin/bash

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
