<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="gex" uri="http://www.isotc211.org/2005/gex/1.0/2013-06-24"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 gex namespace schematron rules
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="conf.geospatial-extent-xml.schematron-rules">
    <sch:title>Extent Requirements</sch:title>
    <sch:p>Constraints for elements in the gex namespace</sch:p>
    <sch:rule context="//gex:EX_Extent">
      <sch:assert test="(count(./gex:description) + 
        count(./gex:geographicElement) +
        count(./gex:temporalElement) +
        count(./gex:verticalElement)) &gt; 0">Specify either gex:description, gex:geographicElement, gex:temporalElement or gex:verticalElement for each gex:EX_Extent.</sch:assert>
    </sch:rule>
    <sch:rule context="//gex:EX_VerticalExtent">
      <sch:assert test="(count(./gex:verticalCRS) + 
        count(./gex:verticalCRSId)) &gt; 0">Specify either gex:verticalCRS or gex:verticalCRSId for each gex:EX_Extent.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
