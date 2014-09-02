#
# script for moving schema and associated files out of a dated working directory
# and into the root version directory, i.e. from xxx/1.0/2014-07-11 to xxx/1.0
#
# 2014-08 thabermann@hdfgroup.org 
#
# the working version directory is 2014-07-11 in this case.
#
# run this script from the namespace root/MaintenanceTools
#
# copy all files (*) from the working directory to the version root 
find ../*/*/*/2014-07-11 -name "*" -execdir cp {} .. \;
#
# edit all schema files to remove the working directory and adjust relative paths
# this will break all of the working directory schemas
find ../*/*/*/* -name "*.xsd" -exec sed -E -i .bak -f removeVersionDates.sed {} \;
#
# delete the backup files created by editng the schema
find ../ -name "*.bak" -delete
#
# remove all of the working directories (2013* and 2014*)
rm -R -d ../*/*/*/201*
