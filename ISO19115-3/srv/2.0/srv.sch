<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/2005/cit/1.0/2013-06-24"/>
  <sch:ns prefix="mri" uri="http://www.isotc211.org/2005/mri/1.0/2013-06-24"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"/>
  <sch:ns prefix="srv" uri="http://www.isotc211.org/2005/srv/2.0/2013-06-24"/>
  <sch:ns prefix="mrd" uri="http://www.isotc211.org/2005/mrd/1.0/2013-06-24"/>

  <!--
    ISO 19115-1 srv (service identification) namespace schematron rules    
    Created by steve.richard@azgs.az.gov 20140308
  -->
  <sch:pattern id="conf.service-metadata-xml.schematron-rules">
    <sch:title>Service metadata Requirements</sch:title>
    <sch:p>1. A SV_ServiceIdentification instance MUST have a value for either the containsChain or
      the containsOperation property.</sch:p>
    <sch:p>3. A SV_ServiceIdentification instance MUST NOT contain values for both the operatesOn
      and operatedDataset properties.</sch:p>
    <sch:rule context="//srv:SV_ServiceIdentification">
      <sch:report test="(count(./srv:containsChain)  + count(./srv:containsOperations)) = 0">Specify
        either a containsChain or containsOperation property for the service identified. </sch:report>
      <sch:report test="((count(./srv:containsChain) &gt; 0) and (count(./srv:containsOperations) &gt; 0))">Specify only one of
        containsChain OR containsOperation for the service identified. </sch:report>
      <sch:report test="((count(./srv:operatesOn) &gt; 0)  and (count(./srv:operatedDataset) &gt; 0))">Specify only one of
        operatesOn OR operatedDataset for the service identified. </sch:report>
    </sch:rule>

    <sch:p>2. If the coupledResource property has a value, then the couplingType property MUST have
      a value</sch:p>
    <sch:rule context="//srv:coupledResource">
      <!-- couplingType is 0..1, so only one value may be present -->
      <sch:assert test="(count(../srv:couplingType)) = 1">Specify a couplingType for the coupledResource.
      </sch:assert>
    </sch:rule>

    <sch:p>If a SV_CoupledResource element is instantiated, then either the resourceReference or the
      resource property MUST have a value. A SV_CoupledResource instance MUST NOT contain values for
      both the resource and resourceReference properties.</sch:p>
    <sch:rule context="//srv:SV_CoupledResource">
      <sch:assert test="(count(./srv:resource) + count(./srv:resourceReference) &gt; 0)">Specify a resource or resourceReference for the coupledResource instance</sch:assert>
      <sch:report test="(count(./srv:resource) &gt; 0) and (count(./srv:resourceReference) &gt; 0)">Specify only one of resoure OR
        resourceReference for the coupledResource. </sch:report>
    </sch:rule>
  </sch:pattern>
</sch:schema>
