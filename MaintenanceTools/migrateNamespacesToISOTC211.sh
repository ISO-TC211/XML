#
# Script for moving ISOTC211 Namespaces to a new host (schemas.isotc211.org)
# Created by ted.habermann@gmail.com
# 2018-12-02
#
# run this script from the namespace root/MaintenanceTools
# 
# All references to standards.iso.org/iso are replaced by http://schemas.isotc211.org
# Note that this assumes that the iso directory is removed from the paths to these files
# The find commands used here can be tested using the findSchemaAdnXMLDFiles.sh
#
# edit all schema files to change the repository location
find ../schemas.isotc211.org -name "*.xsd" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
#
# edit all xml files to change the repository location
find ../schemas.isotc211.org -name "*.xml" -exec sed -E -i .bak -f migrateNamespacesToISOTC211.sed {} \;
