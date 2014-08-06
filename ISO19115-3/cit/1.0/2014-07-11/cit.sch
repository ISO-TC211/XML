<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/2005/cit/1.0/2013-06-24"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 cit namespace schematron rules    
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="conf.citation-xml.schematron-rules">
    <sch:title>Citation Requirements</sch:title>
    <sch:p>Every CI_Individual must include a cit:name or cit:positionName value and Every CI_Organization must include a cit:name or cit:positionName value</sch:p>
    <sch:rule context="//cit:CI_Individual">
      <sch:assert test="(count(./cit:name/gco:CharacterString) + count(./cit:positionName/gco:CharacterString)) &gt; 0">Specify either cit:individualName, cit:positionName for each cit:CI_Individual.</sch:assert>
    </sch:rule>
    <sch:rule context="//cit:CI_Organisation">
      <sch:assert test="(count(./cit:name/gco:CharacterString) + count(./cit:logo/mcc:MD_BrowseGraphic/mcc:fileName/gco:CharacterString)) &gt; 0">Specify either cit:name, cit:logo for each cit:CI_Organization.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
