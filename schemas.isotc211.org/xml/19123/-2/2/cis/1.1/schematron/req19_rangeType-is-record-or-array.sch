<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 19</sch:title>
  <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
  <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//RangeType">
      <sch:assert test="count(//DataRecord|//DataArray)!=0 and count(//DataChoice|//Vector|//Matrix)=0">
        Wherever SWE Common allows an AbstractDataComponent in a coverage range structure the concrete instance shall be one of the subtypes DataRecord and DataArray.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
