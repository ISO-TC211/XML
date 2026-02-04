<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:title>Requirement 17</sch:title>
    <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
    <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
    <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
    <sch:pattern>
        <sch:rule context="//rangeType//swe:Quantity | //rangeType//swe:QuantityRange | //rangeType//swe:Count|//rangeType//swe:CountRange | //rangeType//swe:Time | //rangeType//swe:TimeRange | //rangeType//swe:Boolean | //rangeType//swe:Category | //rangeType//swe:CategoryRange | //rangeType//swe:Text">
            <sch:assert test="count(//swe:value)=0">
                In a coverage instantiating class coverage, for all SWE Common :: AbstractSimpleComponent items
                in a range type structure, instance multiplicity of the value component shall be zero.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>

