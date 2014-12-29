<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="cit" uri="http://www.isotc211.org/namespace/cit/1.0/2014-07-11"/>
  <sch:ns prefix="mri" uri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11"/>
  <sch:ns prefix="mdb" uri="http://www.isotc211.org/namespace/mdb/1.0/2014-07-11"/>
  <sch:ns prefix="mcc" uri="http://www.isotc211.org/namespace/mcc/1.0/2014-07-11"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <!--
    ISO 19115-3 base requirements for metadata instance documents     
    Created by steve.richard@azgs.az.gov 20140309
  -->
  
  <sch:diagnostics>
    <sch:diagnostic 
      id="conf.metadata-base-instance.root-element-failure-en"
      xml:lang="en">The root element must be MD_Metadata.</sch:diagnostic>
    <sch:diagnostic 
      id="conf.metadata-base-instance.root-element-failure-fr"
      xml:lang="fr">Modifier l'élément racine du document pour que ce soit un élément MD_Metadata.</sch:diagnostic>
  </sch:diagnostics>
  
  <sch:pattern id="conf.metadata-base-instance.root-element">
    <sch:title xml:lang="en">Metadata document root element</sch:title>
    <sch:title xml:lang="fr">Élément racine du document</sch:title>
    <sch:p xml:lang="en">A metadata instance document conforming to 
      this specification SHALL have a root MD_Metadata element 
      defined in the http://www.isotc211.org/2005/mdb/1.0 namespace.</sch:p>
    <sch:p xml:lang="fr">Une fiche de métadonnées conforme au standard
      ISO19115-1 DOIT avoir un élément racine MD_Metadata (défini dans l'espace
      de nommage http://www.isotc211.org/2005/mdb/1.0).</sch:p>
    <sch:rule context="/">
      <sch:assert test="(count(/mdb:MD_Metadata) = 1)"
      diagnostics="conf.metadata-base-instance.root-element-failure-en 
                   conf.metadata-base-instance.root-element-failure-fr"/>
    </sch:rule>
  </sch:pattern>
  
  
  
  
  <sch:diagnostics>
    <sch:diagnostic 
      id="conf.metadata-base-instance.scope-name-failure-en" 
      xml:lang="en">Specify a name for the metadata scope 
      (required if the scope code is not "dataset").</sch:diagnostic>
    <sch:diagnostic 
      id="conf.metadata-base-instance.scope-name-failure-fr" 
      xml:lang="fr">Préciser la description du domaine d'application 
      (car le document décrit une ressource qui n'est pas un "jeu de données").</sch:diagnostic>
  </sch:diagnostics>
  
  <sch:pattern id="conf.metadata-base-instance.scope-name">
    <sch:title xml:lang="en">Scope Name</sch:title>
    <sch:title xml:lang="fr">Description du domaine d'application</sch:title>
    <sch:p xml:lang="en">If a MD_MetadataScope element is present, 
      the name property MUST have a value if resourceScope is not equal to "dataset"</sch:p>
    <sch:p xml:lang="fr">Si un élément domaine d'application (MD_MetadataScope)
      est défini, sa description (name) DOIT avoir une valeur
      si se domaine n'est pas "jeu de données" (ie. "dataset").</sch:p>
    <sch:rule context="//mdb:MD_MetadataScope/mdb:resourceScope/
                          mcc:MD_ScopeCode[not(@codeListValue ='dataset')]">
      <sch:assert test="(count(../../mdb:name)=1)"
        diagnostics="conf.metadata-base-instance.scope-name-failure-en
                     conf.metadata-base-instance.scope-name-failure-fr"/>
    </sch:rule>
  </sch:pattern>
  
  
  
  
  <sch:diagnostics>
    <sch:diagnostic 
      id="conf.metadata-base-instance.create-date-failure-en"
      xml:lang="en">Specify a creation date for the metadata record 
      (MD_Metadata/dateInfo... with CI_DateTypeCode/@codeListValue='creation').</sch:diagnostic>
    <sch:diagnostic 
      id="conf.metadata-base-instance.create-date-failure-fr"
      xml:lang="fr">Specify a creation date for the metadata record 
      (MD_Metadata/dateInfo... with CI_DateTypeCode/@codeListValue='creation').</sch:diagnostic>
  </sch:diagnostics>
  
  <sch:pattern id="conf.metadata-base-instance.create-date">
    <sch:title xml:lang="en">Metadata create date</sch:title>
    <sch:title xml:lang="fr">Date de création du document</sch:title>
    <sch:p xml:lang="en">A dateInfo property value with data type = "creation" 
      MUST be present in every MD_Metadata instance.</sch:p>
    <sch:p xml:lang="fr">Tout document DOIT avoir une date de création 
      définie (en utilisant un élément dateInfo avec un type "creation").</sch:p>
    <sch:rule context="mdb:MD_Metadata">
      <sch:assert test="count(./mdb:dateInfo/cit:CI_Date/
        cit:dateType/cit:CI_DateTypeCode[@codeListValue='creation']) &gt; 0"
        diagnostics="conf.metadata-base-instance.create-date-failure-en
                     conf.metadata-base-instance.create-date-failure-fr"/>
    </sch:rule>
  </sch:pattern>
</sch:schema>
