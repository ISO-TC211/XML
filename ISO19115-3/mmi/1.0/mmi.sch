<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <sch:ns prefix="mmi" uri="http://www.isotc211.org/2005/mmi/1.0/2013-06-24"/>
  <!--
    ISO 19115-1 mmi namespace schematron rules
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="conf.geospatial-extent-xml.schematron-rules">
    <sch:title>Maintenance Information Requirements</sch:title>
    <sch:p>Constraints for elements in the mmi namespace</sch:p>
    <sch:rule context="//mmi:MD_MaintenanceInformation">
      <sch:assert test="(count(./mmi:maintenanceAndUpdateFrequency) + 
        count(./mmi:userDefinedMaintenanceFrequency)) &gt; 0">Specify either mmi:MD_MaintenanceInformation or mmi:userDefinedMaintenanceFrequency for each mmi:MD_MaintenanceInformation.</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
