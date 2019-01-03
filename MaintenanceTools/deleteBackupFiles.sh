#
# Script for deleting backup files (*.bak) created during schema location update
# Created by ted.habermann@gmail.com
# 2019-01/03
#
# run this script from the namespace root/MaintenanceTools
# 
# delete the backup files created by editng the schema
find ../schemas.isotc211.org -name "*.bak" -delete
