<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:title>Requirement 23</sch:title>
    <sch:ns uri="https://schemas.isotc211.org/19123/-2/cis/2.0.0/" prefix="cis"/>
    <sch:ns uri="http://www.w3.org/1999/xlink" prefix="xlink"/>
    <sch:pattern>
        <sch:rule context="//cis:domainSet">
            <sch:assert test="self instance of cis:generalGrid">
                DomainSet shall be of type cis:generalGrid.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
