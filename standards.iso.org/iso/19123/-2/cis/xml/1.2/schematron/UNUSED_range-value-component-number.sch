<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:title>Requirement 18 / partial</sch:title>
    <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
    <sch:ns uri="http://www.opengis.net/gml/3.2" prefix="gml"/>
    <sch:ns uri="http://www.opengis.net/swe/2.0" prefix="swe"/>
    <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
    <sch:pattern>
        <sch:rule context="*[local-name()='GridCoverage']">
            <sch:let name="band" value="count(..//*[local-name()='rangeType']//*[local-name()='field'][child::*[local-name()!='DataArray' and local-name()!='DataRecord']])"/>
            <sch:assert test="count(tokenize(substring-before(normalize-space(//*[local-name()='DataBlock']//*[local-name()='tupleList']), ' '),',')) = $band">
                All range values contained in the range set of a coverage shall have the number of components as indicated in the range type (partial test of Req 19, as far as possible through schematron).
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
