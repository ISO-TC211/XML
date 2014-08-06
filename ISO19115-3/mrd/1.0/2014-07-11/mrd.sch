<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mrd" uri="http://www.isotc211.org/2005/mrd/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 mrd namespace schematron rules
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="conf.resource-distribution-xml.schematron-rules">
    <sch:title>Distribution Requirements</sch:title>
    <sch:p>Constraints for elements in the mrd namespace</sch:p>
    <sch:rule context="//mrd:MD_Medium">
      <sch:report test="(mrd:density and not(mrd:densityUnits))">Specify units for the density.</sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>
