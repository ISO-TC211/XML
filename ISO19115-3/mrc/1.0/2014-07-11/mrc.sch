<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mrc" uri="http://www.isotc211.org/2005/mrc/1.0/2013-06-24"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
  <!--
    ISO 19115-1 mrc namespace schematron rules
    Created by thabermann@hdfgroup.org 20140308
  -->
  <sch:pattern id="conf.resource-content-xml.schematron-rules">
    <sch:title>Content Requirements</sch:title>
    <sch:p>Constraints for elements in the mrc namespace. No check is doe to ensure that MD_Band/units is a unit of length.</sch:p>
    <sch:rule context="//mrc:MD_FeatureCatalogue">
      <sch:assert test="contains(/*/@xsi:schemaLocation,'http://www.isotc211.org/2005/gfc')">The Feature Catalog schema location must be defined for the MD_FeatureCatalog.</sch:assert>
    </sch:rule>
    <sch:rule context="//mrc:MD_FeatureCatalogueDescription">
      <sch:assert test="(./mrc:includedWithDataset[gco:Boolean='true'] | ./mrc:featureCatalogueCitation | ../mrc:MD_FeatureCatalogue)">The Feature Catalog must be included eith the data, cited, or included in the metadata record</sch:assert>
    </sch:rule>
    <sch:rule context="//mrc:attribute/mrc:MD_SampleDimension">
      <sch:report test="(mrc:minValue | mrc:maxValue | mrc:meanValue) and not(mrc:units)">Specify mrc:units if mrc:minValue, mrc:maxValue or mrc:meanValue exists.</sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>
