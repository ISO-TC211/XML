<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/2005/cit/1.0/2013-06-24"/>
  <sch:ns prefix="mri" uri="http://www.isotc211.org/2005/mri/1.0/2013-06-24"/>
  <sch:ns prefix="mdb" uri="http://www.isotc211.org/2005/mdb/1.0/2013-06-24"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <!--
    ISO 19115-3 base requirements for metadata instance documents     
    Created by steve.richard@azgs.az.gov 20140309
  -->
  <sch:pattern id="conf.metadata-base-instance.root-element">
    <sch:title>Metadata document root element</sch:title>
    <sch:p>A metadata instance document conforming to this specification SHALL have a root MD_Metadata element defined in the http://www.isotc211.org/2005/mdb/1.0 namespace.</sch:p>
    <sch:rule context="/">
      <sch:assert test="(count(/mdb:MD_Metadata) = 1)">The root element must be MD_Metadata</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <sch:title>Scope Name</sch:title>
    <sch:p> If a MD_MetadataScope element is present, the name property MUST have a value if resourceScope is not equal to "dataset"</sch:p>
    <sch:rule context="//mdb:MD_MetadataScope/mdb:resourceScope/mcc:MD_ScopeCode[not(@codeListValue ='dataset')]">
      <sch:assert test="(count(../../mdb:name)=1)">
        Specify a name for the metadata scope (required if the scope code is not 'dataset'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    <sch:title>Metadata create date</sch:title>
    <sch:p>A dateInfo property value with data type = "creation" MUST be present in every MD_Metadata instance.</sch:p>
    <sch:rule context="mdb:MD_Metadata">
      <sch:assert test="count(./mdb:dateInfo/cit:CI_Date/cit:dateType/cit:CI_DateTypeCode[@codeListValue='creation']) &gt; 0">
        Specify a creation date for the metadata record (MD_Metadata/dateInfo... with CI_DateTypeCode/@codeListValue='creation')
      </sch:assert>
      
    </sch:rule>
  </sch:pattern>
</sch:schema>
