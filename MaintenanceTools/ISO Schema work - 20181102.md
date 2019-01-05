# ISO Schema work - 20181102

## Validate metadata record with local schema  

__MD\_MetadataPathsValidWith19115-2Revisions\_19115-1Paths.localSchema.xml__  
points to ../../../ISOTC211-XML/XML/standards.iso.org/iso/19115/-3/mdt/2.0/mdt.xsd as the schema location, i.e. the local schema. This file validates.  

The schema file mdt/2.0/mdt.xsd has the following include:

```
<import namespace="http://standards.iso.org/iso/19115/-3/mda/2.0" 
	schemaLocation="../../../../19115/-3/mda/2.0/mda.xsd"/>
```

but the mda namespace is defined in this file as xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/1.0" and there is no schema location for mda 2.0...

1. Update the mda namespace to mda/2.0 and add the local schema path for mda/2.0 to this XML file
	xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/2.0"  
	add http://standards.iso.org/iso/19115/-3/mda/2.0 ../../../ISOTC211-XML/XML/standards.iso.org/iso/19115/-3/mda/2.0/mda.xsd  
	__Document is still valid.__
	
## Validate record with remote schema

__MD\_MetadataPathsValidWith19115-2Revisions\_19115-1Paths.standards.iso.org.xml__  
This file has the remote schema location:

```
xsi:schemaLocation="http://standards.iso.org/iso/19115/-3/mdb/2.0 
	http://standards.iso.org/iso/19115/-3/mdt/2.0/mdt.xsd"
```

and has the wrong mda namespace: xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/1.0"

Validation yields 17 errors, mostly like :  
System ID: https://standards.iso.org/iso/19115/-3/mdt/2.0/metadataTransfer.xsd  
Main validation file: /Users/tedhabermann/GitRepositories/MetadataPaths/19115-1/xml/  MD\_MetadataPathsValidWith19115-2Revisions\_19115-1Paths.standards.iso.org.xml  
Schema: http://standards.iso.org/iso/19115/-3/mdt/2.0/mdt.xsd  
Description: sch-props-correct.2: A schema cannot contain two global components with the same name; this schema contains two occurrences of 'http://standards.iso.org/iso/19115/-3/mdt/2.0,MX_Aggregate'.  
Start location: 13:17
End location: 13:31
URL: http://www.w3.org/TR/xmlschema-1/#sch-props-correct

1. Update the mda namespace: xmlns:mda="http://standards.iso.org/iso/19115/-3/mda/2.0"  
Same validation error occurs.

Try changing mdt.xsd to mda.xsd (one layer down the hierarchy). Now we get the same error, but it is classes in mda.xsd that are repeated.

Try changing mdt.xsd to md2.xsd (one more layer down the hierarchy). Now the document is valid.

## Validate record with schemas.isotc211.org schema
The ISOTC211 schema repository was migrated to schemas.isotc211.org on 2019-01-04 and the file **MD\_MetadataPathsValidWith19115-2Revisions_19115-1Paths.schemas.isotc211.org.xml** was created to test the new schemas. Decided to start at the lower namespaces and work up to see where the problem starts...

**xsi:schemaLocation="http://schemas.isotc211.org/19115/-3/mdb/2.0 http://schemas.isotc211.org/19115/-3/mdb/2.0/mdb.xsd** - 36 errors  
I get the expected errors about mcc not existing, but I also get a bunch of errors like:  
System ID: https://schemas.isotc211.org/19115/-3/mdb/2.0/metadataBase.xsd
Main validation file: /Users/tedhabermann/GitRepositories/MetadataPaths/19115-1/xml/MD_MetadataPathsValidWith19115-2Revisions_19115-1Paths.schemas.isotc211.org.xml
Schema: http://schemas.isotc211.org/19115/-3/mdb/2.0/mdb.xsd
Engine name: Xerces
Severity: error
Description: sch-props-correct.2: A schema cannot contain two global components with the same name; this schema contains two occurrences of 'http://schemas.isotc211.org/19115/-3/mdb/2.0,MD_Metadata'.
Start location: 12:17
End location: 12:30
URL: http://www.w3.org/TR/xmlschema-1/#sch-props-correct

**Problem**  

```
The file https://schemas.isotc211.org/19115/-3/mdb/2.0/mdb.xsd defines the cit namespace as
xmlns:cit="http://schemas.isotc211.org/19115/-3/cit/1.0" 
but then imports 
<import namespace="http://schemas.isotc211.org/19115/-3/cit/2.0" 
schemaLocation="../../../../19115/-3/cit/2.0/cit.xsd"/>```

I searched all of the schemas for xmlns:cit="http://schemas.isotc211.org/19115/-3/cit/1.0" and found that this is the only Version 2.0 schema that imports cit/1.0/cit.xsd.

