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
