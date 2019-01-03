#
# Script for testing find command for moving ISOTC211 Namespaces to a new host (schemas.isotc211.org)
# Created by ted.habermann@gmail.com
# 2019-01-03
#
# run this script from the namespace root/MaintenanceTools
# 
# test find for schema files - show files
find ../schemas.isotc211.org -name "*.xsd" -print
# 
# test find for schema files - count files
NUMBEROFSCHEMAFILES=$(find ../schemas.isotc211.org -name "*.xsd" -print | wc -l)
# 
# test find for xml files - show files
find ../schemas.isotc211.org -name "*.xml" -print
# 
# test find for xml files - count files
NUMBEROFXMLFILES=$(find ../schemas.isotc211.org -name "*.xml" -print | wc -l)
#
# output counts
echo There are $NUMBEROFSCHEMAFILES schema files
echo There are $NUMBEROFXMLFILES XML files
