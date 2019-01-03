#
# Script for finding backup files created by sed command
# Created by ted.habermann@gmail.com
# 2019-01-03
#
# run this script from the namespace root/MaintenanceTools
# 
# test find for schema files - show files
find ../schemas.isotc211.org -name "*.xsd.bak" -print
# 
# test find for schema files - count files
NUMBEROFSCHEMAFILES=$(find ../schemas.isotc211.org -name "*.xsd.bak" -print | wc -l)
# 
# test find for xml files - show files
find ../schemas.isotc211.org -name "*.xml.bak" -print
# 
# test find for xml files - count files
NUMBEROFXMLFILES=$(find ../schemas.isotc211.org -name "*.xml.bak" -print | wc -l)
#
# output counts
echo There are $NUMBEROFSCHEMAFILES schema backup files
echo There are $NUMBEROFXMLFILES XML backup files
