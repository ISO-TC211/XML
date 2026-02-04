<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 71, Annex B</sch:title>
  <sch:ns uri="http://www.opengis.net/cis/1.0" prefix="cis"/>
  <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="*[local-name()='RangeType']">
      <sch:assert test="count(//*[local-name()='DataRecord']|//*[local-name()='DataArray'])!=0 and count(//*[local-name()='DataChoice']|//*[local-name()='Vector']|//*[local-name()='Matrix'])=0">
        Wherever the SWE Common XML schema allows an AbstractDataComponent in a coverage range type the concrete instance shall be one of the AbstractDataComponent subtypes DataRecord, DataArray; options DataChoice and Vector and Matrix are disallowed.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
