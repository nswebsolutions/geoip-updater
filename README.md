Build Nginx & LibreSSL
======================

##License
Script for downloading latest legacy Maxmind GeoIP databases
Copyleft (C) NSWeb Solutions - 2016

This script is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This script is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this script.  If not, see <http://www.gnu.org/licenses/gpl.txt>

##About this script
This script download the latest legacy Maxmind GeoIP databases

- GeoIP Legacy Country Database
- GeoIP Legacy City Database

##Dependencies
Gunzip and manual installation for the first time

##Designed for
Debian 8

##Manual Installation (or first usage)
<code>cd /tmp && wget --no-check-certificate https://raw.githubusercontent.com/nswebsolutions/geoip-updater/master/geoip-update.sh && chmod +x geoip-update.sh && ./geoip-update.sh </code>


##Config for nginx
Open your server configuration file and add the following to the http section:

<code>geoip_country  /path/to/CountryGeoIP.dat

geoip_city     /path/to/GeoIPOrLiteCity.dat;</code>

Now make sure the following parameters are passed to fastcgi:

<code>fastcgi_param GEOIP_ADDR $remote_addr;

fastcgi_param GEOIP_COUNTRY_CODE $geoip_country_code;

fastcgi_param GEOIP_COUNTRY_NAME $geoip_country_name;

fastcgi_param GEOIP_REGION $geoip_region;

fastcgi_param GEOIP_REGION_NAME $geoip_region_name;

fastcgi_param GEOIP_CITY $geoip_city;

fastcgi_param GEOIP_AREA_CODE $geoip_area_code;

fastcgi_param GEOIP_LATITUDE $geoip_latitude;

fastcgi_param GEOIP_LONGITUDE $geoip_longitude;

fastcgi_param GEOIP_POSTAL_CODE $geoip_postal_code;</code>


