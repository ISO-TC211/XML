#
# script for moving schema and associated files out of a dated working directory
# and into the root version directory, i.e. from xxx/1.0/2014-12-25 to xxx/1.0
#
# 2015-04 thabermann@hdfgroup.org 
#
# the working version directory is 2014-12-25 in this case.
#
# run this script from the namespace root/MaintenanceTools
#
# copy all files (*) from the working directory to the version root

# standards with parts (e.g. 19115-2, -3) are at ../standards.iso.org/*/*/*/*/2014-12-25
echo move files for standards with parts
find ../standards.iso.org/*/*/*/*/2014-12-25 -name "*" -print
find ../standards.iso.org/*/*/*/*/2014-12-25 -name "*" -execdir cp {} .. \;

echo move files for standards without parts
# standards without parts (e.g. 19111) are at ../standards.iso.org/*/*/*/2014-12-25
find ../standards.iso.org/*/*/*/2014-12-25 -name "*" -print
find ../standards.iso.org/*/*/*/2014-12-25 -name "*" -execdir cp {} .. \;
#
# edit all schema files to remove the working directory and adjust relative paths
# this will break all of the working directory schemas
find ../standards.iso.org -name "*.xsd" -print
find ../standards.iso.org -name "*.xsd" -exec sed -E -i .bak -f removeVersionDates.sed {} \;
#
# delete the backup files created by editng the schema
#find ../standards.iso.org -name "*.bak" -delete
#
# remove all of the working directories (2013* and 2014*)
rm -R -d ../standards.iso.org/*/*/*/201*
rm -R -d ../standards.iso.org/*/*/*/*/201*

