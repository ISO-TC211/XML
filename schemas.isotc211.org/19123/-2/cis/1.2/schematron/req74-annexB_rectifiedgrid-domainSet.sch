<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 44</sch:title>
  <sch:ns uri="http://www.opengis.net/cis/1.0" prefix="cis10"/>
  <sch:ns uri="http://www.opengis.net/gml/3.2" prefix="gml"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//cis10:RectifiedGridCoverage/cis10:domainSet">
      <sch:assert test="gml:RectifiedGrid">
        A RectifiedGridCoverage has a domain that is a gml:RectifiedGrid geometry.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>


