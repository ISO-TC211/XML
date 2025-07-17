<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 44</sch:title>
  <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
  <sch:ns uri="http://www.opengis.net/gml/3.2" prefix="gml"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//cis:MultiCurveCoverage/cis:DomainSet">
      <sch:assert test="count(*) = 1 and string-length(.) = 0">
        In a MultiCurveCoverage, DomainSet shall contain exactly one node and no content.
      </sch:assert>
      <sch:assert test="count(gml:MultiCurve) = 1">
        In a MultiCurveCoverage, The single DomainSet child shall be of type gml:MultiCurve.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>


