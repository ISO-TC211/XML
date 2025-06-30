<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 70, Annex B</sch:title>
  <sch:ns uri="http://www.opengis.net/cis/1.0" prefix="cis"/>
  <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//*[local-name()='DataRecord']//*[local-name()='Quantity'] | //*[local-name()='DataRecord']//*[local-name()='QuantityRange'] | //*[local-name()='DataRecord']//*[local-name()='Count'] | //*[local-name()='DataRecord']//*[local-name()='CountRange'] | //*[local-name()='DataRecord']//*[local-name()='Time'] | //*[local-name()='DataRecord']//*[local-name()='TimeRange'] | //*[local-name()='DataRecord']//*[local-name()='Boolean'] | //*[local-name()='DataRecord']//*[local-name()='Category'] | //*[local-name()='DataRecord']//*[local-name()='CategoryRange'] | //*[local-name()='DataRecord']//*[local-name()='Text']">
      <sch:assert test="count(//*[local-name()='value'])=0">
        For all SWE Common AbstractSimpleComponent subtypes in a range type, instance multiplicity of the value component shall be zero.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
