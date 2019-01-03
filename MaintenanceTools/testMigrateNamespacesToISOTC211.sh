#
# Script for testing the sed scripts for moving ISOTC211 Namespaces to a new host (schemas.isotc211.org)
# Created by ted.habermann@gmail.com
# 2019-01-03
#
# run this script from the namespace root/MaintenanceTools
# it applies sed commands to two files in this directoy:
#   testMigrationSed.xsd and testMigrationSed.xml 
#   and creates two backup files:
#   testMigrationSed.xsd.bak and testMigrationSed.xml.bak
#
# This script uses the same sed scripts as the migrateNamespacesToISOTC211.sh script
# but the paths in the find commands are different, . vs. ../schemas.isotc211.org.
# 
# All references to standards.iso.org/iso are replaced by http://schemas.isotc211.org
# Note that this assumes that the iso directory is removed from the paths to these files
#
# edit all schema files to change the repository location
find . -name "*.xsd" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
#
# edit all xml files to change the repository location
find . -name "*.xml" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
