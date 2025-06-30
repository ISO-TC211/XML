<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 31</sch:title>
  <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//cis:GeneralGridCoverage/cis:DomainSet">
      <sch:assert test="count(*) = 1 and string-length(.) = 0">
        In a GeneralGridCoverage, the DomainSet shall contain exactly one node and no content.
      </sch:assert>
      <sch:assert test="self instance of cis:GeneralGrid">
        In a GeneralGridCoverage, the single DomainSet child shall be of type GeneralGrid.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
