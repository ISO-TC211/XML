<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:title>Requirement 03</sch:title>
    <!-- this is a simplified test, on syntax level only, of key elements in the domain set. --!>
    <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
    <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
    <sch:pattern>
        <sch:rule context="//cis:DomainSet@srsLabel">
            <sch:assert test="string-length(.) > 0">
                The DomainSet shall contain a value in the attribute srsName.
            </sch:assert>
        </sch:rule>
        <sch:rule context="//cis:DomainSet@axisLabels">
            <sch:assert test="string-length(.) > 0">
                The DomainSet shall contain a value in the attribute axisLabels.
            </sch:assert>
        </sch:rule>
        <sch:rule context="//cis:DomainSet@uomLabels">
            <sch:assert test="string-length(.) > 0">
                The DomainSet shall contain a value in the attribute uomLabels.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>


