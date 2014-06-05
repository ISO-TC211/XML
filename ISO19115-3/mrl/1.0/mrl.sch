<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/2005/cit/1.0/2013-06-24"/>
  <sch:ns prefix="mrl" uri="http://www.isotc211.org/2005/mrl/1.0/2013-06-24"/>
  
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 mrl namespace schematron rules    
    Created by steve.richard@azgs.az.gov 20140308
  -->
  <sch:pattern id="conf.lineage-xml.schematron-rules">
    <sch:title>Lineage Metadata Requirements</sch:title>
    <sch:p>If a LI_Lineage element is instantiated and no value is provided for the LI_Lineage.statement property, then at least one of processStep or source MUST have a value. 
    and  
    If a LI_Source element is instantiated, then either the description or scope property MUST have a value.</sch:p>
    <sch:rule context="//mrl:LI_Lineage">
      <sch:assert test="(count(./mrl:statement)  + count(./mrl:source | ./mrl:processStep)) &gt; 0">Specify either a lineage statement (mrl:statement), or one of (mrl:processStep or mrl:source)
        </sch:assert>
    </sch:rule>
    <sch:rule context="//mrl:LI_Source">
      <sch:assert test="(count(./mrl:description)  + count(./mrl:scope)) &gt; 0">Specify a mrl:description or mrl:scope property in each LI_Source element.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
