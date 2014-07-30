<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  <!--
    ISO 19115-1 core schematron rules
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="elementContent">
    <sch:title>Element Content</sch:title>
    <sch:rule context="*">
      <sch:assert test="./gco:CharacterString | ./@gco:nilReason | ./@indeterminatePosition | ./@xlink:href | @uuidref | ./@codeListValue | ./child::node()">Element must have content or one of the following attributes: nilReason, xlink:href or uuidref. </sch:assert>
      <sch:assert test="contains('missing inapplicable template unknown withheld', ./@gco:nilReason)">'<sch:value-of select="./@gco:nilReason"/>' is not an accepted value. gco:nilReason attribute may only contain: missing, inapplicable, template, unknown, or withheld for element: <sch:name path="."/>
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
