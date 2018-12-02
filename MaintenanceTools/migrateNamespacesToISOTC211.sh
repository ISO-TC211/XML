#
# Script for moving ISOTC211 Namespaces to a new host (schemas.isotc211.org)
# Created by ted.habermann@gmail.com
# 2018-12-02
#
# run this script from the namespace root/MaintenanceTools
# 
# All references to standards.iso.org/iso are replaced by http://schemas.isotc211.org
#
# test find 
# edit all schema files to change the repository location
find . -name "*.xsd" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
#
# edit all xml files to change the repository location
find . -name "*.xml" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
#
# delete the backup files created by editng the schema
#find ../ -name "*.bak" -delete
