#
# script for replacing namespace repository
#
# 2015-01 thabermann@hdfgroup.org 
#
# run this script from the namespace root/MaintenanceTools
#
# test find 
#find ../standards.iso.org/*/*/*/* -name "*.xsd" -print
# edit all schema files to change the repository location
find ../standards.iso.org/*/*/*/* -name "*.xsd" -exec sed -E -i .bak -f fixNamespace.sed {} \;
# delete the backup files created by editng the schema
find ../ -name "*.bak" -delete
