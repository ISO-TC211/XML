<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/2005/cit/1.0/2013-06-24"/>
  <sch:ns prefix="mri" uri="http://www.isotc211.org/2005/mri/1.0/2013-06-24"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 mri (resource identification) namespace schematron rules    
    Created by steve.richard@azgs.az.gov 20140308
  -->
  <sch:pattern id="conf.resource-identification-xml.schematron-rules">
    <sch:title>Resource Identification metadata Requirements</sch:title>
    <sch:p>If a MD_AssociatedResource element is instantiated, then a value for either the name or metadataReference property MUST be provided.</sch:p>
    <sch:rule context="//mri:MD_AssociatedResource">
      <sch:assert test="(count(./mri:name)  + count(./mri:metadataReference)) &gt; 0">Specify either a name for the associated resource, or provide a metadataReference to a
         metadata record that describes the resource</sch:assert>
    </sch:rule>
  
  </sch:pattern>
</sch:schema>
