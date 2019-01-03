#
# Script for fixing LAN codelist locations in codelist.xml files
# These errors were discovered in the process of migrating schemas to schemas.isotc211.org
#  <lan:LanguageCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#LanguageCode" codeListValue="eng">eng</lan:LanguageCode>
# Created by ted.habermann@gmail.com
# 2018-12-02
#
# run this script from the namespace root/MaintenanceTools
# 
# All references to codeList="standards.iso.org/19115 are replaced by codelist="http://schemas.isotc211.org/19115
#
# edit all xml files to change the repository location
find ../schemas.isotc211.org -name "*codelists.xml" -exec sed -E -i .bak -f fixLANCodelistLocations.sed {} \;
