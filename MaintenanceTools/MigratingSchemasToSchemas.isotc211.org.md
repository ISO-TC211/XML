#Migrating the ISO schema to schemas.isotc211.org

##Finding the files to update
Schema files (\*.xsd) and XML examples (\*.xml) must be updated. These can be found from the MaintenanceTools directory using the script **findSchemaAndXMLFiles.sh**. The file counts identified on 2019-01-03 are:  
There are 120 schema files  
There are 126 XML files  

Note that these files are no longer in an iso directory under schemas.isotc211.org. That directory was removed 2019-01-03.

##Testing the sed scripts
The script **testMigrateNamespacesToISOTC211.sh** can be used to test the sed scripts on files in the MaintenanceTools.sh directory. This script uses the same sed scripts as the migrateNamespacesToISOTC211.sh script but the paths in the find commands are different, . vs. ../schemas.isotc211.org.  
All references to standards.iso.org/iso are replaced by http://schemas.isotc211.org  
Note that this assumes that the iso directory is removed from the paths to these files

#Run Migration Scripts
got error:  
sed: RE error: illegal byte sequence  
sed: RE error: illegal byte sequence  

files:  
seems to be related ed to LANG in my locale for two files:  
../schemas.isotc211.org/19165/gpm/1.0/examples/localSchema.xml
../schemas.isotc211.org/19165/gpm/1.0/examples/of5mv60sd0f279110s1r100ca
5-gpm.xml  
This error appears to be related to the LANG environment variable.  
See https://stackoverflow.com/questions/19242275/re-error-illegal-byte-sequence-on-mac-os-x  
These files are related to the preservation standard and were created in Spain by Joan Maso.

I edited them by hand...

Used Oxygen to search *.xml for occurrences of standards.iso.org. Found 58 occurrences.  
Seem to be two types:  
codeList="standards.iso.org/19115 which were errors in the codelist locations in the original sample files and  
http://standards.iso.org/ittf which need to remain...  

The first errors all occur in definitions of the location of the lan codelists:  
System ID: /Users/tedhabermann/GitRepositories/ISOTC211-XML/XML/schemas.isotc211.org/19115/-3/mmi/1.0/codelists.xml
Description: <lan:LanguageCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#LanguageCode" codeListValue="eng">eng</lan:LanguageCode>
Match: standards.iso.org
Start location: 26:41
Length: 17

System ID: /Users/tedhabermann/GitRepositories/ISOTC211-XML/XML/schemas.isotc211.org/19115/-3/mmi/1.0/codelists.xml
Description: <lan:MD_CharacterSetCode codeList="standards.iso.org/19115/-3/lan/1.0/codelists.xml#MD_CharacterSetCode" codeListValue="...
Match: standards.iso.org
Start location: 29:48
Length: 17

Wrote and executed **fixLANCodelistLocations.sh** to fix this problem. Searched for standards.iso.org and found some references to local files as schemaLocations in 19157 sample files:  
xsi:schemaLocation="http://schemas.isotc211.org/19157/-2/dqm/1.0 file:/Users/tedhabermann/GitRepositories/ISOTC211-XML/XML/standards.iso.org/19157/-2/dqm/1.0/dqm.xsd">  
_Fixed these by hand_

Made several small fixes by hand then searched all \*.xsd and \*.xml file for standards.iso.org/iso without finding anything. Searching for standards.iso.org finds only references to http://standards.iso.org/ittf/PubliclyAvailableStandards.

#Sample File Validation
Created sample file pointing to local schemas. It validated.

# Namespace description files
See the file schemas.isotc211.org/19115/resources/namespaceInformationAndTools/NamespaceUpdates.md

Created new schemas.isotc211.org/19115/resources/namespaceSummary.html... Checking columns:  
Standard Prefix: pointing to local files  
Namespace URI: pointing to schemas.isotc211.org
Thumbnail: pointing to local files  
XML Schema: pointing to schemas.isotc211.org  
XML Schema Included: pointing to schemas.isotc211.org  

#Namespace HTML files
These files have local links to the schemas



