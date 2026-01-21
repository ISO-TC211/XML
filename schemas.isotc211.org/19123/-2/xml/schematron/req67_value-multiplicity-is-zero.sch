<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:title>Requirement 67</sch:title>
  <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
  <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
  <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
  <sch:pattern>
    <sch:rule context="//RangeType//swe:Quantity | //RangeType//swe:QuantityRange | //RangeType//swe:Count|//RangeType//swe:CountRange | //RangeType//swe:Time | //RangeType//swe:TimeRange | //RangeType//swe:Boolean | //RangeType//swe:Category | //RangeType//swe:CategoryRange | //RangeType//swe:Text">
      <sch:assert test="count(//swe:value)=0">
        In a coverage instantiating class coverage, for all SWE Common :: AbstractSimpleComponent items
        in a range type structure, instance multiplicity of the value component shall be zero.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

