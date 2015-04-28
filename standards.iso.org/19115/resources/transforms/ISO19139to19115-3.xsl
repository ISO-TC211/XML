<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gcoold="http://www.isotc211.org/2005/gco"
  xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
  xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
  xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srvold="http://www.isotc211.org/2005/srv"
  xmlns:gml30="http://www.opengis.net/gml"
  xmlns:cat="http://standards.iso.org/19115/-3/cat/1.0"
  xmlns:cit="http://standards.iso.org/19115/-3/cit/1.0"
  xmlns:gcx="http://standards.iso.org/19115/-3/gcx/1.0"
  xmlns:gex="http://standards.iso.org/19115/-3/gex/1.0"
  xmlns:lan="http://standards.iso.org/19115/-3/lan/1.0"
  xmlns:srv="http://standards.iso.org/19115/-3/srv/2.0"
  xmlns:mac="http://standards.iso.org/19115/-3/mac/1.0"
  xmlns:mas="http://standards.iso.org/19115/-3/mas/1.0"
  xmlns:mcc="http://standards.iso.org/19115/-3/mcc/1.0"
  xmlns:mco="http://standards.iso.org/19115/-3/mco/1.0"
  xmlns:mda="http://standards.iso.org/19115/-3/mda/1.0"
  xmlns:mdb="http://standards.iso.org/19115/-3/mdb/1.0"
  xmlns:mdt="http://standards.iso.org/19115/-3/mdt/1.0"
  xmlns:mex="http://standards.iso.org/19115/-3/mex/1.0"
  xmlns:mic="http://standards.iso.org/19115/-3/mic/1.0"
  xmlns:mil="http://standards.iso.org/19115/-3/mil/1.0"
  xmlns:mrl="http://standards.iso.org/19115/-3/mrl/1.0"
  xmlns:mds="http://standards.iso.org/19115/-3/mds/1.0"
  xmlns:mmi="http://standards.iso.org/19115/-3/mmi/1.0"
  xmlns:mpc="http://standards.iso.org/19115/-3/mpc/1.0"
  xmlns:mrc="http://standards.iso.org/19115/-3/mrc/1.0"
  xmlns:mrd="http://standards.iso.org/19115/-3/mrd/1.0"
  xmlns:mri="http://standards.iso.org/19115/-3/mri/1.0"
  xmlns:mrs="http://standards.iso.org/19115/-3/mrs/1.0"
  xmlns:msr="http://standards.iso.org/19115/-3/msr/1.0"
  xmlns:mai="http://standards.iso.org/19115/-3/mai/1.0"
  xmlns:mdq="http://standards.iso.org/19157/-2/mdq/1.0"
  xmlns:gco="http://standards.iso.org/19115/-3/gco/1.0"
  xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all">

  <!-- Imnport template that creates the namespaces required for 19115-3 in the output xml -->
  <xsl:import href="create19115-3Namespaces.xsl"/>
  <!-- Import template for DateTime translation -->
  <xsl:import href="DateTime.xsl"/>
  <!-- Import templates for multiLingualCharacterStrings -->
  <xsl:import href="multiLingualCharacterStrings.xsl"/>

  <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
    <xd:desc>
      <xd:p>
        <xd:b>Created on:</xd:b>March 8, 2014 </xd:p>
      <xd:p>Translates from ISO 19139 for ISO 19115 and ISO 19139-2 for 19115-2 to ISO 19139-1 for
        ISO 19115-1</xd:p>
      <xd:p>
        <xd:b>Version June 13, 2014</xd:b>
        <xd:ul>
          <xd:li>Converged the 19115-2 transform into 19115-1 namespaces</xd:li>
        </xd:ul>
      </xd:p>
      <xd:p>
        <xd:b>Version August 7, 2014</xd:b>
        <xd:ul>
          <xd:li>Changed namespace dates to 2014-07-11</xd:li>
          <xd:li>Fixed DistributedComputingPlatform element</xd:li>
        </xd:ul>
      </xd:p>
      <xd:p>
        <xd:b>Version August 15, 2014</xd:b>
        <xd:ul>
          <xd:li>Add multilingual metadata support by converting gmd:locale and copying
            gmd:PT_FreeText and element attributes (eg. gco:nilReason, xsi:type) for
            gmd:CharacterString elements (Author: fx.prunayre@gmail.com).</xd:li>
        </xd:ul>
      </xd:p>
      <xd:p>
        <xd:b>Version September 4, 2014</xd:b>
        <xd:ul>
          <xd:li>Added transform for MD_FeatureCatalogueDescription (problem identified by Tobias
            Spears</xd:li>
        </xd:ul>
      </xd:p>
      <xd:p>
        <xd:b>Version February 5, 2015</xd:b>
        <xd:ul>
          <xd:li>Update to 2014-12-25 version</xd:li>
        </xd:ul>
      </xd:p>
      <xd:p><xd:b>Author:</xd:b>thabermann@hdfgroup.org</xd:p>
    </xd:desc>
  </xd:doc>

  <xsl:output method="xml" indent="yes"/>

  <xsl:strip-space elements="*"/>

  <xsl:variable name="stylesheetVersion" select="'0.1'"/>

  <!-- Define if parent identifier should be defined using a uuidref
    attribute or a CI_Citation with a title. -->
  <xsl:param name="isParentIdentifierDefinedWithUUIDAttribute" select="false()" as="xs:boolean"/>

  <xsl:template match="/">
    <!-- 
    root element (MD_Metadata or MI_Metadata)
    -->
    <xsl:for-each select="/*">
      <xsl:variable name="nameSpacePrefix">
        <xsl:call-template name="getNamespacePrefix"/>
      </xsl:variable>
      <!-- in the 2014-07-11 version the MI_Metadata element became MD_Metadata -->
      <!--<xsl:element name="{concat($nameSpacePrefix,':',local-name(.))}">-->
      <xsl:element name="mdb:MD_Metadata">
        <!-- new namespaces -->
        <xsl:call-template name="add-iso19115-3-namespaces"/>

        <!-- ********************************************* -->
        <!-- apply root element templates                         -->
        <!-- ********************************************* -->
        <xsl:apply-templates select="gmd:fileIdentifier"/>
        <xsl:apply-templates select="gmd:language"/>
        <xsl:apply-templates select="gmd:characterSet"/>
        <xsl:apply-templates select="gmd:parentIdentifier"/>
        <xsl:apply-templates select="gmd:hierarchyLevel"/>
        <xsl:apply-templates select="gmd:contact"/>
        <xsl:apply-templates select="gmd:dateStamp"/>
        <xsl:apply-templates select="gmd:metadataStandardName"/>
        <xsl:apply-templates select="gmd:locale"/>
        <xsl:apply-templates select="gmd:spatialRepresentationInfo"/>
        <xsl:apply-templates select="gmd:referenceSystemInfo"/>
        <xsl:apply-templates select="gmd:metadataExtensionInfo"/>
        <xsl:apply-templates select="gmd:identificationInfo"/>
        <xsl:apply-templates select="gmd:contentInfo"/>
        <xsl:apply-templates select="gmd:distributionInfo"/>
        <xsl:apply-templates select="gmd:dataQualityInfo"/>
        <xsl:apply-templates select="gmd:portrayalCatalogueInfo"/>
        <xsl:apply-templates select="gmd:metadataConstraints"/>
        <xsl:apply-templates select="gmd:applicationSchemaInfo"/>
        <xsl:apply-templates select="gmd:metadataMaintenance"/>
        <xsl:apply-templates select="gmi:acquisitionInformation"/>
      </xsl:element>
    </xsl:for-each>
    <!-- end of main root element processing -->
  </xsl:template>


  <!-- 
    root element templates
  -->
  <xsl:template match="gmd:fileIdentifier" priority="5">
    <!--
    gmd:fileIdentifier is changed from a gco:CharacterString to a MD_Identifer
		which now includes a codespace. This transform assumes a form of 
		namespace:code for the fileIdentifier
    -->
    <xsl:element name="mdb:metadataIdentifier">
      <mcc:MD_Identifier>
        <mcc:code>
          <gco:CharacterString>
            <xsl:choose>
              <xsl:when test="contains(gcoold:CharacterString,':')">
                <xsl:value-of select="substring-after(gcoold:CharacterString,':')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="gcoold:CharacterString"/>
              </xsl:otherwise>
            </xsl:choose>
          </gco:CharacterString>
        </mcc:code>
        <xsl:if test="contains(gcoold:CharacterString,':')">
          <mcc:codeSpace>
            <gco:CharacterString>
              <xsl:value-of select="substring-before(gcoold:CharacterString,':')"/>
            </gco:CharacterString>
          </mcc:codeSpace>
        </xsl:if>
      </mcc:MD_Identifier>
    </xsl:element>
  </xsl:template>


  <xsl:template match="gmd:language|gmd:locale" priority="5">
    <xsl:variable name="nameSpacePrefix">
      <xsl:call-template name="getNamespacePrefix"/>
    </xsl:variable>
    <xsl:variable name="elementName"
      select="if (local-name() = 'language') then 'defaultLocale' else 'otherLocale'"/>
    <xsl:element name="{concat($nameSpacePrefix, ':', $elementName)}">
      <!--<xsl:element name="{'mdb:defaultLocale'}">-->
      <xsl:apply-templates select="@*"/>
      <lan:PT_Locale>
        <xsl:copy-of select="gmd:PT_Locale/@*"/>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'lan:language'"/>
          <xsl:with-param name="codeListName" select="'lan:LanguageCode'"/>
          <xsl:with-param name="codeListValue"
            select="
            gcoold:CharacterString |
            gmd:LanguageCode/@codeListValue |
            gmd:PT_Locale/gmd:languageCode/gmd:LanguageCode/@codeListValue"
          />
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="../gmd:characterSet">
            <xsl:call-template name="writeCodelistElement">
              <xsl:with-param name="elementName" select="'lan:characterEncoding'"/>
              <xsl:with-param name="codeListName" select="'lan:MD_CharacterSetCode'"/>
              <xsl:with-param name="codeListValue"
                select="../gmd:characterSet/gmd:MD_CharacterSetCode/@codeListValue"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <lan:characterEncoding gco:nilReason="unknown"/>
          </xsl:otherwise>
        </xsl:choose>
      </lan:PT_Locale>
    </xsl:element>
  </xsl:template>


  <xsl:template match="gmd:characterSet" priority="5">
    <xsl:choose>
      <!-- if ../gmd/language exists, characterSet has already been translated to defaultLocale -->
      <xsl:when test="../gmd:language"/>
      <xsl:otherwise>
        <xsl:variable name="nameSpacePrefix">
          <xsl:call-template name="getNamespacePrefix"/>
        </xsl:variable>
        <xsl:element name="{concat($nameSpacePrefix,':','defaultLocale')}">
          <!--<xsl:element name="{'mdb:defaultLocale'}">-->
          <xsl:apply-templates select="@*"/>
          <lan:PT_Locale>
            <xsl:call-template name="writeCodelistElement">
              <xsl:with-param name="elementName" select="'lan:characterEncoding'"/>
              <xsl:with-param name="codeListName" select="'lan:MD_CharacterSetCode'"/>
              <xsl:with-param name="codeListValue" select="gmd:MD_CharacterSetCode/@codeListValue"/>
            </xsl:call-template>
          </lan:PT_Locale>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gmd:parentIdentifier" priority="5">
    <!--
         gmd:parentIdentifier is changed from a gco:CharacterString to a
         mdb:parentMetadata element. This transform support two types 
         of conversion depending on the
         isParentIdentifierDefinedWithUUIDAttribute parameter.
         
         a) if $isParentIdentifierDefinedWithUUIDAttribute is true, then 
         populate an uuidref attribute based on the gco:CharacterString value
         
         b) if false, assumes a form of namespace:code for the 
         parentIdentifier and populate the title and identifier of the
         citation.
    -->
    <xsl:element name="mdb:parentMetadata">
      <xsl:choose>
        <xsl:when test="$isParentIdentifierDefinedWithUUIDAttribute">
          <xsl:attribute name="uuidref" select="gcoold:CharacterString"/>
        </xsl:when>
        <xsl:otherwise>
          <cit:CI_Citation>
            <cit:title>
              <gco:CharacterString>
                <xsl:value-of select="gcoold:CharacterString"/>
              </gco:CharacterString>
            </cit:title>
            <cit:identifier>
              <mcc:MD_Identifier>
                <mcc:code>
                  <gco:CharacterString>
                    <xsl:choose>
                      <xsl:when test="contains(gcoold:CharacterString,':')">
                        <xsl:value-of select="substring-after(gcoold:CharacterString,':')"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="gcoold:CharacterString"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </gco:CharacterString>
                </mcc:code>
                <xsl:if test="contains(gcoold:CharacterString,':')">
                  <mcc:codeSpace>
                    <gco:CharacterString>
                      <xsl:value-of select="substring-before(gcoold:CharacterString,':')"/>
                    </gco:CharacterString>
                  </mcc:codeSpace>
                </xsl:if>
              </mcc:MD_Identifier>
            </cit:identifier>
          </cit:CI_Citation>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmd:hierarchyLevel" priority="5">
    <!-- ************************************************************************ -->
    <!-- gmd:hierarchyLevel and gmd:hierarchyLevelName are combined into a
			   new class: MD_MetadataScope to avoid ambiguity when there are multiple elements. -->
    <!-- ************************************************************************ -->
    <mdb:metadataScope>
      <mdb:MD_MetadataScope>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'mdb:resourceScope'"/>
          <xsl:with-param name="codeListName" select="'mcc:MD_ScopeCode'"/>
          <xsl:with-param name="codeListValue"
            select="gmd:MD_ScopeCode/@codeListValue|
                                  gmx:MX_ScopeCode/@codeListValue"
          />
        </xsl:call-template>
        <xsl:if test="../gmd:hierarchyLevelName">
          <mdb:name>
            <gco:CharacterString>
              <xsl:value-of select="../gmd:hierarchyLevelName/gcoold:CharacterString"/>
            </gco:CharacterString>
          </mdb:name>
        </xsl:if>
      </mdb:MD_MetadataScope>
    </mdb:metadataScope>
  </xsl:template>

  <xsl:template match="gmd:dateStamp" priority="5">
    <!--
      dateStamp is changed into a CI_Date that includes a dateType 
    -->
    <mdb:dateInfo>
      <cit:CI_Date>
        <cit:date>
          <xsl:call-template name="writeDateTime"/>
        </cit:date>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'cit:dateType'"/>
          <xsl:with-param name="codeListName" select="'cit:CI_DateTypeCode'"/>
          <xsl:with-param name="codeListValue" select="'creation'"/>
        </xsl:call-template>
      </cit:CI_Date>
    </mdb:dateInfo>
  </xsl:template>

  <xsl:template match="gmd:metadataStandardName" priority="5">
    <!-- 
      metadataStandardName and gmd:metadataStandardVersion are combined into a CI_Citation 
    -->
    <mdb:metadataStandard>
      <cit:CI_Citation>
        <xsl:call-template name="writeCharacterStringElement">
          <xsl:with-param name="elementName" select="'cit:title'"/>
          <xsl:with-param name="nodeWithStringToWrite" select="."/>
        </xsl:call-template>
        <xsl:call-template name="writeCharacterStringElement">
          <xsl:with-param name="elementName" select="'cit:edition'"/>
          <xsl:with-param name="nodeWithStringToWrite" select="../gmd:metadataStandardVersion"/>
        </xsl:call-template>
      </cit:CI_Citation>
    </mdb:metadataStandard>
  </xsl:template>


  <!-- gmd:spatialRepresentationInfo uses default templates -->
  <xsl:template match="gmi:geographicCoordinates">
    <xsl:choose>
      <xsl:when test="normalize-space(.)=''">
        <msr:geographicCoordinates/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="msr:geographicCoordinates">
          <xsl:element name="gml:Point">
            <xsl:attribute name="gml:id">
              <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            <xsl:apply-templates select="./*"/>
          </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gmd:MD_PixelOrientationCode">
    <xsl:element name="msr:MD_PixelOrientationCode">
      <xsl:choose>
        <xsl:when test=".='center'">
          <xsl:value-of select="'centre'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <!-- gmd:referenceSystemInfo uses default templates -->
  <!-- gmd:metadataExtensionInfo uses default templates -->
  <xsl:template match="gmd:identificationInfo">
    <mdb:identificationInfo>
      <xsl:apply-templates select="@*"/>
      <xsl:for-each select="./*">
        <xsl:variable name="nameSpacePrefix">
          <xsl:call-template name="getNamespacePrefix"/>
        </xsl:variable>
        <xsl:element name="{concat($nameSpacePrefix,':',local-name(.))}">
          <xsl:apply-templates select="@*"/>
          <xsl:apply-templates select="gmd:citation"/>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mri:abstract'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:abstract"/>
          </xsl:call-template>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mri:purpose'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:purpose"/>
          </xsl:call-template>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mri:credit'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:credit"/>
          </xsl:call-template>
          <xsl:call-template name="writeCodelistElement">
            <xsl:with-param name="elementName" select="'mri:status'"/>
            <xsl:with-param name="codeListValue"
              select="gmd:status/gmd:MD_ProgressCode/@codeListValue"/>
            <xsl:with-param name="codeListName" select="'mcc:MD_ProgressCode'"/>
          </xsl:call-template>
          <xsl:apply-templates select="gmd:pointOfContact"/>
          <xsl:call-template name="writeCodelistElement">
            <xsl:with-param name="elementName" select="'mri:spatialRepresentationType'"/>
            <xsl:with-param name="codeListName" select="'mcc:MD_SpatialRepresentationTypeCode'"/>
            <xsl:with-param name="codeListValue"
              select="gmd:spatialRepresentationType/gmd:MD_SpatialRepresentationTypeCode/@codeListValue"
            />
          </xsl:call-template>
          <xsl:apply-templates select="gmd:spatialResolution"/>
          <!-- This is here to handle early adopters of temporalResolution -->
          <xsl:apply-templates select="gmd:temporalResolution"/>
          <xsl:apply-templates select="gmd:topicCategory"/>
          <xsl:apply-templates select="gmd:extent | srvold:extent"/>
          <xsl:apply-templates select="gmd:resourceMaintenance"/>
          <xsl:apply-templates select="gmd:graphicOverview"/>
          <xsl:apply-templates select="gmd:resourceFormat"/>
          <xsl:apply-templates select="gmd:descriptiveKeywords"/>
          <xsl:apply-templates select="gmd:resourceSpecificUsage"/>
          <xsl:apply-templates select="gmd:resourceConstraints"/>
          <xsl:apply-templates select="gmd:aggregationInfo"/>
          <xsl:call-template name="collectiveTitle"/>
          <xsl:apply-templates select="gmd:language"/>
          <xsl:apply-templates select="gmd:characterSet"/>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mri:environmentDescription'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:environmentDescription"/>
          </xsl:call-template>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mri:supplementalInformation'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:supplementalInformation"/>
          </xsl:call-template>
          <!-- Service Identification Information -->
          <xsl:if test="srvold:serviceType">
            <srv:serviceType>
              <gco:ScopedName>
                <xsl:value-of select="srvold:serviceType/gcoold:LocalName"/>
              </gco:ScopedName>
            </srv:serviceType>
          </xsl:if>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'srv:serviceTypeVersion'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="srvold:serviceTypeVersion"/>
          </xsl:call-template>
          <xsl:call-template name="writeCodelistElement">
            <xsl:with-param name="elementName" select="'srv:couplingType'"/>
            <xsl:with-param name="codeListName" select="'srv:SV_CouplingType'"/>
            <xsl:with-param name="codeListValue"
              select="srvold:couplingType/srvold:SV_CouplingType/@codeListValue"/>
          </xsl:call-template>
          <xsl:apply-templates select="srvold:containsOperations"/>
          <xsl:apply-templates select="srvold:operatesOn"/>
        </xsl:element>
      </xsl:for-each>
    </mdb:identificationInfo>
  </xsl:template>


  <xsl:template match="srvold:optionality">
    <srv:optionality>
      <gco:Boolean>
        <xsl:value-of select="gcoold:CharacterString"/>
      </gco:Boolean>
    </srv:optionality>
  </xsl:template>


  <xsl:template
    match="gmd:contentInfo[not(gmd:MD_FeatureCatalogueDescription)
    and not(gmd:MD_ImageDescription)]">
    <xsl:if test="not(preceding-sibling::gmd:contentInfo)">
      <!-- ********************************************************************** -->
      <!-- First contentInfo section.                                             -->
      <!-- All contentInfo sections are transformed here to allow formation       -->
      <!-- of attributeGroups                                                     -->
      <!-- ********************************************************************** -->
      <xsl:element name="mdb:contentInfo">
        <xsl:for-each select="*">
          <!-- Process the first MD_CoverageDescription section. Get the mrc:attributeDescription from here. -->
          <xsl:element name="mrc:MD_CoverageDescription">
            <xsl:element name="mrc:attributeDescription">
              <xsl:element name="gco:RecordType">
                <xsl:for-each select=".//gcoold:RecordType">
                  <xsl:for-each select="@*">
                    <xsl:attribute name="{name(.)}" select="."/>
                  </xsl:for-each>
                  <xsl:value-of select="."/>
                </xsl:for-each>
              </xsl:element>
            </xsl:element>
            <!-- This loop goes back out to convert each gmd:contentInfo section into a separate mrc:AttributeGroup -->
            <xsl:for-each
              select="/*/gmd:contentInfo/gmd:MD_CoverageDescription | /*/gmd:contentInfo/gmi:MI_CoverageDescription">
              <xsl:element name="mrc:attributeGroup">
                <xsl:element name="mrc:MD_AttributeGroup">
                  <xsl:apply-templates/>
                </xsl:element>
              </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="//gmi:rangeElementDescription">
              <xsl:element name="mrc:rangeElementDescription">
                <xsl:apply-templates/>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:if>
  </xsl:template>


  <!-- transform contentInfo sections with Feature Catalogues -->
  <xsl:template
    match="gmd:contentInfo[gmd:MD_FeatureCatalogueDescription] | gmd:contentInfo[gmd:MD_ImageDescription]">
    <xsl:element name="mdb:contentInfo">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//gmd:MD_FeatureCatalogueDescription/gmd:featureTypes">
    <mrc:featureTypes>
      <mrc:MD_FeatureTypeInfo>
        <mrc:featureTypeName>
          <xsl:apply-templates/>
        </mrc:featureTypeName>
      </mrc:MD_FeatureTypeInfo>
    </mrc:featureTypes>
  </xsl:template>


  <!-- gmd:distributionInfo uses default templates -->
  <xsl:template match="gmd:dataQualityInfo">
    <xsl:if test="gmd:DQ_DataQuality/gmd:report">
      <!-- ISO 19157 -->
      <mdb:dataQualityInfo>
        <mdq:DQ_DataQuality>
          <xsl:if test="gmd:DQ_DataQuality/gmd:scope">
            <mdq:scope>
              <xsl:choose>
                <xsl:when test="gmd:DQ_DataQuality/gmd:scope/@*">
                  <xsl:copy-of select="gmd:DQ_DataQuality/gmd:scope/@*"/>
                </xsl:when>
                <xsl:otherwise>
                  <mcc:MD_Scope>
                    <xsl:apply-templates select="gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope/*"/>
                  </mcc:MD_Scope>
                </xsl:otherwise>
              </xsl:choose>
            </mdq:scope>
          </xsl:if>
          <xsl:for-each select="gmd:DQ_DataQuality/gmd:report">
            <xsl:for-each select="*">
              <xsl:element name="mdq:report">
                <xsl:element name="{concat('mdq:',local-name())}">
                  <!-- gmd:result uses default templates -->
                  <mdq:measure>
                    <mdq:DQ_MeasureReference>
                      <xsl:apply-templates select="gmd:measureIdentification"/>
                      <xsl:call-template name="writeCharacterStringElement">
                        <xsl:with-param name="elementName" select="'mdq:nameOfMeasure'"/>
                        <xsl:with-param name="nodeWithStringToWrite" select="gmd:nameOfMeasure"/>
                      </xsl:call-template>
                      <xsl:call-template name="writeCharacterStringElement">
                        <xsl:with-param name="elementName" select="'mdq:measureDescription'"/>
                        <xsl:with-param name="nodeWithStringToWrite" select="gmd:measureDescription"
                        />
                      </xsl:call-template>
                    </mdq:DQ_MeasureReference>
                  </mdq:measure>
                  <mdq:evaluationMethod>
                    <mdq:DQ_FullInspection>
                      <xsl:if test="gmd:dateTime/gcoold:DateTime">
                        <mdq:dateTime>
                          <gco:DateTime>
                            <xsl:value-of select="gmd:dateTime/gcoold:DateTime"/>
                          </gco:DateTime>
                        </mdq:dateTime>
                      </xsl:if>
                      <xsl:call-template name="writeCharacterStringElement">
                        <xsl:with-param name="elementName"
                          select="'mdq:evaluationMethodDescription'"/>
                        <xsl:with-param name="nodeWithStringToWrite"
                          select="gmd:evaluationMethodDescription"/>
                      </xsl:call-template>
                      <mdq:evaluationProcedure>
                        <xsl:apply-templates select="gmd:evaluationProcedure/gmd:CI_Citation"/>
                      </mdq:evaluationProcedure>
                      <xsl:call-template name="writeCodelistElement">
                        <xsl:with-param name="elementName" select="'mdq:evaluationMethodType'"/>
                        <xsl:with-param name="codeListName"
                          select="'mdq:DQ_EvaluationMethodTypeCode'"/>
                        <xsl:with-param name="codeListValue"
                          select="gmd:evaluationMethodType/gmd:DQ_EvaluationMethodTypeCode/@codeListValue"
                        />
                      </xsl:call-template>
                    </mdq:DQ_FullInspection>
                  </mdq:evaluationMethod>
                  <xsl:apply-templates select="gmd:result"/>
                </xsl:element>
              </xsl:element>
            </xsl:for-each>
          </xsl:for-each>
        </mdq:DQ_DataQuality>
      </mdb:dataQualityInfo>
    </xsl:if>

    <!-- 
    gmd:lineage moves directly under MD_Metadata
    -->
    <xsl:for-each select="gmd:DQ_DataQuality/gmd:lineage/gmd:LI_Lineage">
      <!-- 
      gmd:DataQuality objects without lineage go to ISO 19157
      -->
      <xsl:element name="mdb:resourceLineage">
        <mrl:LI_Lineage>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mrl:statement'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="gmd:statement"/>
          </xsl:call-template>
          <xsl:if test="../../../gmd:DQ_DataQuality/gmd:scope">
            <xsl:variable name="dataQualityScopeObject"
              select="../../../gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope"/>
            <mrl:scope>
              <mcc:MD_Scope>
                <xsl:call-template name="writeCodelistElement">
                  <xsl:with-param name="elementName" select="'mcc:level'"/>
                  <xsl:with-param name="codeListName" select="'mcc:MD_ScopeCode'"/>
                  <xsl:with-param name="codeListValue"
                    select="$dataQualityScopeObject//gmd:MD_ScopeCode/@codeListValue|
                                          $dataQualityScopeObject//gmx:MX_ScopeCode/@codeListValue"
                  />
                </xsl:call-template>
                <xsl:for-each select="$dataQualityScopeObject//gmd:EX_Extent">
                  <mcc:extent>
                    <xsl:apply-templates select="."/>
                  </mcc:extent>
                </xsl:for-each>
                <xsl:if test="$dataQualityScopeObject//gmd:MD_ScopeDescription">
                  <mcc:levelDescription>
                    <mcc:MD_ScopeDescription>
                      <xsl:apply-templates
                        select="$dataQualityScopeObject//gmd:MD_ScopeDescription/*"/>
                      <!--<xsl:call-template name="writeCharacterStringElement">
                      <xsl:with-param name="elementName" select="'cit:other'"/>
                      <xsl:with-param name="stringToWrite" select="gmd:statement"/>
                    </xsl:call-template>-->
                    </mcc:MD_ScopeDescription>
                  </mcc:levelDescription>
                </xsl:if>
              </mcc:MD_Scope>
            </mrl:scope>
          </xsl:if>
          <xsl:apply-templates select="gmd:source"/>
          <xsl:apply-templates select="gmd:processStep"/>
        </mrl:LI_Lineage>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!-- gmd:portrayalCatalogueInfo uses default templates -->
  <!-- gmd:metadataConstraints uses default templates -->
  <!-- gmd:applicationSchemaInfo uses default templates -->
  <!-- gmd:metadataMaintenance uses default templates -->
  <xsl:template match="gmi:acquisitionInformation">
    <xsl:element name="mdb:acquisitionInformation">
      <xsl:element name="mac:MI_AcquisitionInformation">
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:instrument"/>
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:operation"/>
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:platform"/>
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:acquisitionPlan"/>
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:objective"/>
        <xsl:apply-templates select="gmi:MI_AcquisitionInformation/gmi:acquisitionRequirement"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <xsl:template match="gmi:objectiveOccurance">
    <!-- This element is mis-spelled in the 19115-2 schema -->
    <xsl:element name="mac:objectiveOccurence">
      <xsl:apply-templates select="@*"/>
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <!--
  gmd:spatialRepresentation templates
  -->
  <xsl:template match="gmi:geolocationInformation/gmi:MI_GCPCollection">
    <xsl:element name="msr:MI_GCPCollection">
      <xsl:apply-templates select="gmi:gcp"/>
      <xsl:apply-templates select="gmi:collectionIdentification"/>
      <xsl:apply-templates select="gmi:collectionName"/>
      <xsl:apply-templates select="gmi:coordinateReferenceSystem"/>
    </xsl:element>
  </xsl:template>

  <!--
  gmd:identificationInformation templates
  -->
  <xsl:template
    match="/*/gmd:identificationInfo/*/gmd:citation/gmd:CI_Citation/gmd:citedResponsibleParty">
    <xsl:if test="not(preceding-sibling::gmd:citedResponsibleParty) and /*/gmd:dataSetURI">
      <!-- ********************************************************************** 
      The first citedResponsibleParty is special because the identifier
      created from the gmd:dataSetURI goes before it.
      WARNING: A record with a dataSetIdentifier and no
      citedResponsibleParties will fail.
      ********************************************************************** -->
      <cit:identifier>
        <mcc:MD_Identifier>
          <mcc:code>
            <gco:CharacterString>
              <xsl:value-of select="/*/gmd:dataSetURI/gcoold:CharacterString"/>
            </gco:CharacterString>
          </mcc:code>
        </mcc:MD_Identifier>
      </cit:identifier>
    </xsl:if>
    <!-- Avoid putting out empty citedResponsibleParties for just onlineResources (responsible parties without names) -->
    <xsl:if
      test="count(gmd:CI_ResponsibleParty/gmd:individualName/gcoold:CharacterString) + count(gmd:CI_ResponsibleParty/gmd:organisationName/gcoold:CharacterString) + count(gmd:CI_ResponsibleParty/gmd:positionName/gcoold:CharacterString) != 0">
      <cit:citedResponsibleParty>
        <xsl:apply-templates/>
      </cit:citedResponsibleParty>
    </xsl:if>
  </xsl:template>

  <xsl:template
    match="/*/gmd:identificationInfo/*/gmd:resourceSpecificUsage/gmd:MD_Usage/gmd:usageDateTime">
    <mri:usageDateTime>
      <gml:TimeInstant>
        <xsl:attribute name="gml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <gml:timePosition>
          <xsl:value-of select="."/>
        </gml:timePosition>
      </gml:TimeInstant>
    </mri:usageDateTime>
  </xsl:template>

  <xsl:template match="gmd:aggregationInfo" priority="5">
    <!-- 
   gmd:MD_AggregateInformation was renamed gmd:associatedResource in order
	 to clarify the intent of the class. It is used to provide information about
	 resources that are associated with the resource being described.
    -->
    <mri:associatedResource>
      <xsl:element name="mri:MD_AssociatedResource">
        <xsl:copy-of select="gmd:MD_AggregateInformation/@*"/>
        <!-- The name element is mapped from the existing gmd:aggregateDataSetName class.
					 The metadataReference replaces the gmd:aggregateDataSetIdentifier in order to
					 clarify the fact that it identifies and gives the location of the metadata 
					 for the associated resources. -->
        <xsl:choose>
          <xsl:when
            test="exists(gmd:MD_AggregateInformation/gmd:aggregateDataSetName)
            and exists(gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier)">
            <!-- both name an identifier exist - use standard template -->
            <mri:name>
              <xsl:apply-templates
                select="gmd:MD_AggregateInformation/gmd:aggregateDataSetName/gmd:CI_Citation"/>
            </mri:name>
          </xsl:when>
          <xsl:when test="exists(gmd:MD_AggregateInformation/gmd:aggregateDataSetName)">
            <!-- only an name exists - write it into a CI_Citation -->
            <mri:name>
              <xsl:apply-templates
                select="gmd:MD_AggregateInformation/gmd:aggregateDataSetName/gmd:CI_Citation"/>
            </mri:name>
          </xsl:when>
          <xsl:when test="exists(gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier)">
            <!-- only an identifier exists - write it into a CI_Citation -->
            <mri:name>
              <cit:CI_Citation>
                <xsl:call-template name="writeCharacterStringElement">
                  <xsl:with-param name="elementName" select="'cit:title'"/>
                  <xsl:with-param name="nodeWithStringToWrite"
                    select="gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier/gmd:MD_Identifier/gmd:authority/gmd:CI_Citation/gmd:title"
                  />
                </xsl:call-template>
                <cit:date gco:nilReason="unknown"/>

                <cit:identifier>
                  <xsl:apply-templates
                    select="gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier/gmd:MD_Identifier"
                  />
                </cit:identifier>
              </cit:CI_Citation>
            </mri:name>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'mri:associationType'"/>
          <xsl:with-param name="codeListName" select="'mri:DS_AssociationTypeCode'"/>
          <xsl:with-param name="codeListValue"
            select="./gmd:MD_AggregateInformation/gmd:associationType/gmd:DS_AssociationTypeCode"/>
        </xsl:call-template>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'mri:initiativeType'"/>
          <xsl:with-param name="codeListName" select="'mri:DS_InitiativeTypeCode'"/>
          <xsl:with-param name="codeListValue"
            select="./gmd:MD_AggregateInformation/gmd:initiativeType/gmd:DS_InitiativeTypeCode"/>
        </xsl:call-template>
      </xsl:element>
    </mri:associatedResource>
  </xsl:template>

  <xsl:template
    match="gmd:aggregationInfo/gmd:MD_AggregateInformation/gmd:aggregateDataSetName/gmd:CI_Citation/gmd:citedResponsibleParty">
    <xsl:if
      test="not(preceding-sibling::gmd:citedResponsibleParty) and ancestor::gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier">
      <!-- ********************************************************************** 
      The first citedResponsibleParty is special because the identifier
      from the gmd:aggregateDataSetIdentifier goes before it.
      ********************************************************************** -->
      <cit:identifier>
        <xsl:apply-templates
          select="ancestor::gmd:MD_AggregateInformation/gmd:aggregateDataSetIdentifier/gmd:MD_Identifier"
        />
      </cit:identifier>
    </xsl:if>
    <cit:citedResponsibleParty>
      <xsl:apply-templates/>
    </cit:citedResponsibleParty>
  </xsl:template>

  <!-- collectiveTitle was dropped in 19115-1. 
    If it exists in /gmd:MD_Metadata/gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:collectiveTitle,
    an MD_AssociatedResource section needs to be added.-->
  <xsl:template name="collectiveTitle">
    <xsl:for-each select=".//gmd:citation/gmd:CI_Citation/gmd:collectiveTitle">

      <mri:associatedResource>
        <xsl:element name="mri:MD_AssociatedResource">
          <!-- The name element is mapped from the existing collectiveTitle -->
          <mri:name>
            <cit:CI_Citation>
              <xsl:call-template name="writeCharacterStringElement">
                <xsl:with-param name="elementName" select="'cit:title'"/>
                <xsl:with-param name="nodeWithStringToWrite" select="."/>
              </xsl:call-template>
            </cit:CI_Citation>
          </mri:name>
          <xsl:call-template name="writeCodelistElement">
            <xsl:with-param name="elementName" select="'mri:associationType'"/>
            <xsl:with-param name="codeListName" select="'mri:DS_AssociationTypeCode'"/>
            <xsl:with-param name="codeListValue" select="'largerWorkCitation'"/>
          </xsl:call-template>

        </xsl:element>
      </mri:associatedResource>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="srvold:containsOperations">
    <srv:containsOperations>
      <srv:SV_OperationMetadata>
        <xsl:call-template name="writeCharacterStringElement">
          <xsl:with-param name="elementName" select="'srv:operationName'"/>
          <xsl:with-param name="nodeWithStringToWrite"
            select="srvold:SV_OperationMetadata/srvold:operationName"/>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="srvold:SV_OperationMetadata/srvold:DCP/srvold:DCPList">
            <xsl:call-template name="writeCodelistElement">
              <xsl:with-param name="elementName" select="'srv:distributedComputingPlatform'"/>
              <xsl:with-param name="codeListName" select="'srv:DCPList'"/>
              <xsl:with-param name="codeListValue"
                select="srvold:SV_OperationMetadata/srvold:DCP/
                                        srvold:DCPList/@codeListValue"
              />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <srv:distributedComputingPlatform gco:nilReason="missing"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="writeCharacterStringElement">
          <xsl:with-param name="elementName" select="'srv:invocationName'"/>
          <xsl:with-param name="nodeWithStringToWrite"
            select="srvold:SV_OperationMetadata/srvold:invocationName"/>
        </xsl:call-template>
        <xsl:apply-templates select="srvold:SV_OperationMetadata/srvold:connectPoint"/>
        <xsl:apply-templates select="srvold:SV_OperationMetadata/srvold:parameters"/>
      </srv:SV_OperationMetadata>
    </srv:containsOperations>
  </xsl:template>

  <xsl:template match="srvold:parameters">
    <srv:parameter>
      <xsl:apply-templates select="srvold:SV_Parameter"/>
    </srv:parameter>
  </xsl:template>

  <xsl:template match="srvold:SV_Parameter/srvold:name">
    <xsl:element name="srv:name">
      <gco:MemberName>
        <xsl:apply-templates/>
      </gco:MemberName>
    </xsl:element>
  </xsl:template>

  <!--
    gmd:referenceSystemInformation templates
  -->
  <xsl:template match="gmd:RS_Identifier">
    <mcc:MD_Identifier>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </mcc:MD_Identifier>
  </xsl:template>
  <!-- 
    gmd:contentInfo
  -->
  <xsl:template match="gmd:dimension">
    <xsl:element name="mrc:attribute">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmd:MD_Band">
    <xsl:element name="mrc:MD_SampleDimension">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmi:MI_Band">
    <xsl:element name="mrc:MI_Band">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmd:MD_Band/gmd:descriptor | gmi:MI_Band/gmd:descriptor">
    <xsl:element name="mrc:description">
      <xsl:element name="gco:CharacterString">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <!-- 
  gmd:distributionInfo
  -->
  <xsl:template match="gmd:MD_DigitalTransferOptions/gmd:offLine/gmd:MD_Medium/gmd:name">
    <mrd:name>
      <cit:CI_Citation>
        <cit:title>
          <gco:CharacterString>
            <xsl:value-of select="gmd:MD_MediumNameCode"/>
          </gco:CharacterString>
        </cit:title>
      </cit:CI_Citation>
    </mrd:name>
  </xsl:template>
  <!-- 
  gmd:dataQuality
  -->
  <xsl:template match="gmd:report/*/gmd:result/gmd:DQ_QuantitativeResult">
    <mdq:DQ_QuantitativeResult>
      <xsl:apply-templates select="gmd:value"/>
      <xsl:apply-templates select="gmd:valueUnit"/>
      <xsl:apply-templates select="gmd:valueType"/>
    </mdq:DQ_QuantitativeResult>
  </xsl:template>

  <!-- added to account for element name change from valueType to valueRecordType - 2014-07-29 -->
  <xsl:template match="gmd:result/gmd:DQ_QuantitativeResult/gmd:valueType">
    <xsl:element name="mdq:valueRecordType">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmd:report/*/gmd:result/gmd:DQ_ConformanceResult/gmd:specification">
    <mdq:specification>
      <!--<dqm:DQM_SourceReference>
        <dqm:citation>-->
      <xsl:apply-templates/>
      <!--</dqm:citation>
      </dqm:DQM_SourceReference>-->
    </mdq:specification>
  </xsl:template>

  <xsl:template
    match="gmd:report/*/gmd:result/gmi:QE_CoverageResult/gmi:resultContentDescription/gmi:MI_CoverageDescription">
    <xsl:element name="mrc:MI_CoverageDescription">
      <xsl:element name="mrc:attributeDescription">
        <xsl:copy-of select="./gmd:attributeDescription/gcoold:RecordType"/>
      </xsl:element>
      <xsl:element name="mrc:attributeGroup">
        <xsl:element name="mrc:MD_AttributeGroup">
          <xsl:apply-templates/>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gmd:LI_ProcessStep/gmd:source">
    <mrl:source>
      <xsl:apply-templates select="@*"/>
      <xsl:if test="*[1]">
        <xsl:variable name="lineageElement" select="concat('mrl:',local-name(*[1]))"/>
        <xsl:element name="{$lineageElement}">
          <xsl:copy-of select="*[1]/@*"/>
          <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'mrl:description'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="./*/gmd:description"/>
          </xsl:call-template>
          <xsl:apply-templates select="./*/gmd:scaleDenominator"/>
          <xsl:apply-templates select="./*/gmd:sourceReferenceSystem"/>
          <xsl:apply-templates select="./*/gmd:sourceCitation"/>
          <xsl:apply-templates select="./*/gmd:sourceExtent"/>
          <xsl:apply-templates select="./*/gmd:sourceStep"/>
          <xsl:apply-templates select="./*/gmi:processedLevel"/>
          <xsl:apply-templates select="./*/gmi:resolution"/>
        </xsl:element>
      </xsl:if>
    </mrl:source>
  </xsl:template>
  <xsl:template match="gmd:LI_Source/gmd:scaleDenominator | gmi:LE_Source/gmd:scaleDenominator">
    <mrl:sourceSpatialResolution>
      <mri:MD_Resolution>
        <mri:equivalentScale>
          <xsl:apply-templates/>
        </mri:equivalentScale>
      </mri:MD_Resolution>
    </mrl:sourceSpatialResolution>
  </xsl:template>
  <xsl:template match="gmd:LI_Source/gmd:sourceExtent | gmi:LE_Source/gmd:sourceExtent">
    <mrl:scope>
      <mcc:MD_Scope>
        <mcc:level/>
        <mcc:extent>
          <xsl:apply-templates/>
        </mcc:extent>
        <mcc:levelDescription/>
      </mcc:MD_Scope>
    </mrl:scope>
  </xsl:template>
  <xsl:template match="gmi:LE_ProcessStep">
    <xsl:element name="mrl:LE_ProcessStep">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="gmd:description"/>
      <xsl:apply-templates select="gmd:dateTime"/>
      <xsl:apply-templates select="gmd:processor"/>
      <xsl:apply-templates select="gmd:source"/>
      <xsl:apply-templates select="gmi:processingInformation"/>
      <xsl:apply-templates select="gmi:report"/>
      <xsl:apply-templates select="gmi:output"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="gmd:LI_ProcessStep/gmd:dateTime | gmi:LE_ProcessStep/gmd:dateTime"
    priority="5">
    <mrl:stepDateTime>
      <gml:TimeInstant>
        <xsl:attribute name="gml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <gml:timePosition>
          <xsl:value-of select="./gcoold:DateTime"/>
        </gml:timePosition>
      </gml:TimeInstant>
    </mrl:stepDateTime>
  </xsl:template>
  <xsl:template match="gmi:LE_Processing">
    <xsl:element name="mrl:LE_Processing">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="gmi:algorithm"/>
      <xsl:apply-templates select="gmi:identifier"/>
      <xsl:apply-templates select="gmi:softwareReference"/>
      <xsl:apply-templates select="gmi:procedureDescription"/>
      <xsl:apply-templates select="gmi:documentation"/>
      <xsl:apply-templates select="gmi:runTimeParameters"/>
    </xsl:element>
  </xsl:template>
  <!-- 
  gmd:metadataMaintenance
  -->
  <xsl:template match="gmd:MD_MaintenanceInformation/gmd:dateOfNextUpdate">
    <mmi:maintenanceDate>
      <cit:CI_Date>
        <cit:date>
          <xsl:call-template name="writeDateTime"/>
        </cit:date>
        <xsl:call-template name="writeCodelistElement">
          <xsl:with-param name="elementName" select="'cit:dateType'"/>
          <xsl:with-param name="codeListName" select="'cit:CI_DateTypeCode'"/>
          <xsl:with-param name="codeListValue" select="'update'"/>
        </xsl:call-template>
      </cit:CI_Date>
    </mmi:maintenanceDate>
  </xsl:template>
  <!-- 
  gmi:gmi:acquisitionInformation templates
  -->
  <xsl:template match="gmi:MI_Operation/gmi:status/gmd:MD_ProgressCode">
    <xsl:element name="mcc:MD_ProgressCode">
      <xsl:apply-templates select="@*"/>
    </xsl:element>
  </xsl:template>
  <!--
    Utility Templates
  -->
  <xsl:template match="gmd:contactInfo/gmd:CI_Contact/gmd:phone">
    <xsl:for-each select="gmd:CI_Telephone/*">
      <cit:phone>
        <cit:CI_Telephone>
          <cit:number>
            <gco:CharacterString>
              <xsl:value-of select="./gcoold:CharacterString"/>
            </gco:CharacterString>
          </cit:number>
          <xsl:call-template name="writeCodelistElement">
            <xsl:with-param name="elementName" select="'cit:numberType'"/>
            <xsl:with-param name="codeListName" select="'cit:CI_TelephoneTypeCode'"/>
            <xsl:with-param name="codeListValue">
              <xsl:choose>
                <xsl:when test="local-name()='voice'">
                  <xsl:value-of select="'voice'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'facsimile'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>
        </cit:CI_Telephone>
      </cit:phone>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="gmd:CI_OnlineResource/gmd:linkage/gmd:URL">
    <gco:CharacterString>
      <xsl:value-of select="."/>
    </gco:CharacterString>
  </xsl:template>

  <xsl:template match="gmd:MD_Format">
    <xsl:element name="mrd:MD_Format">
      <xsl:apply-templates select="@*"/>
      <xsl:element name="mrd:formatSpecificationCitation">
        <xsl:element name="cit:CI_Citation">
          <cit:title>
            <xsl:call-template name="characterStringSubstitutions">
              <xsl:with-param name="parentElement" select="gmd:name"/>
            </xsl:call-template>
          </cit:title>
          <cit:alternateTitle>
            <xsl:call-template name="characterStringSubstitutions">
              <xsl:with-param name="parentElement" select="gmd:specification"/>
            </xsl:call-template>
          </cit:alternateTitle>
          <!-- 19115(2006) does not have concept of a format specification date -->
          <cit:date gco:nilReason="unknown"/>
          <cit:edition>
            <xsl:call-template name="characterStringSubstitutions">
              <xsl:with-param name="parentElement" select="gmd:version"/>
            </xsl:call-template>
          </cit:edition>
          <cit:identifier>
            <mcc:MD_Identifier>
              <mcc:code>
                <xsl:call-template name="characterStringSubstitutions">
                  <xsl:with-param name="parentElement" select="gmd:name"/>
                </xsl:call-template>
              </mcc:code>
            </mcc:MD_Identifier>
          </cit:identifier>
        </xsl:element>
      </xsl:element>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="writeCodelistElement">
    <xsl:param name="elementName"/>
    <xsl:param name="codeListName"/>
    <xsl:param name="codeListValue"/>
    <!-- The correct codeList Location goes here -->
    <xsl:variable name="codeListLocation" select="'codeListLocation'"/>
    <xsl:if test="$codeListValue">
      <xsl:element name="{$elementName}">
        <xsl:element name="{$codeListName}">
          <xsl:attribute name="codeList">
            <xsl:value-of select="$codeListLocation"/>
            <xsl:value-of select="'#'"/>
            <xsl:value-of select="substring-after($codeListName,':')"/>
          </xsl:attribute>
          <xsl:attribute name="codeListValue">
            <!-- the anyValidURI value is used for testing with paths -->
            <!--<xsl:value-of select="'anyValidURI'"/>-->
            <!-- commented out for testing -->
            <xsl:value-of select="$codeListValue"/>
          </xsl:attribute>
          <xsl:value-of select="$codeListValue"/>
        </xsl:element>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template name="characterStringSubstitutions">
    <xsl:param name="parentElement"/>
    <!-- This template takes a parent of a gcoold:CharacterString element and writes out the child for several possible substitutions  -->
    <xsl:for-each select="$parentElement/*">
      <xsl:choose>
        <xsl:when test="local-name(.)='CharacterString'">
          <gco:CharacterString>
            <xsl:value-of select="."/>
          </gco:CharacterString>
        </xsl:when>
        <xsl:otherwise>
          <xsl:element name="{concat('gcx:',local-name(.))}">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="."/>
          </xsl:element>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="gml30:*">
    <xsl:element name="{local-name(.)}" namespace="http://www.opengis.net/gml/3.2">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@gml30:*">
    <xsl:attribute name="gml:{local-name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@gcoold:*">
    <xsl:attribute name="gco:{local-name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>


  <!-- Default template writes correct namespace prefix -->
  <xsl:template match="*">
    <xsl:variable name="nameSpacePrefix">
      <xsl:call-template name="getNamespacePrefix"/>
    </xsl:variable>
    <xsl:element name="{concat($nameSpacePrefix,':',local-name(.))}">
      <!-- copy all attributes -->
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <!-- find the correct namespace prefix -->
  <xsl:template name="getNamespacePrefix">
    <!-- this template determines the correct namespace prefix depending on the position of the element in the new XML -->
    <xsl:variable name="prefix">
      <xsl:choose>
        <xsl:when test="name()='gmi:MI_Metadata'">
          <xsl:text>mdb</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(name(),'gmx:')">
          <xsl:text>gcx</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(name(),'gco:')">
          <xsl:text>gco</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(name(),'gml:')">
          <xsl:text>gml</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(name(),'gts:')">
          <xsl:text>gts</xsl:text>
        </xsl:when>
        <xsl:when test="starts-with(name(),'srv:') and not(name()='srv:extent')">
          <xsl:text>srv</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:PT_FreeText">
          <xsl:text>lan</xsl:text>
        </xsl:when>
        <xsl:when
          test="starts-with(name(),'gmi:') and not(ancestor-or-self::gmi:MI_AcquisitionInformation)
          and not(ancestor-or-self::gmi:QE_CoverageResult) and not(ancestor-or-self::gmi:LE_ProcessStep)
          and not(ancestor-or-self::gmi:LE_Source) and not(ancestor-or-self::gmi:MI_CoverageDescription)">
          <xsl:text>msr</xsl:text>
        </xsl:when>
        <xsl:when
          test="starts-with(name(),'gmi:') and 
          (ancestor-or-self::gmi:LE_ProcessStep or ancestor-or-self::gmi:LE_Source)">
          <xsl:text>mrl</xsl:text>
        </xsl:when>
        <xsl:when
          test="starts-with(name(),'gmi:') and (ancestor-or-self::gmi:MI_CoverageDescription)">
          <xsl:text>mrc</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_Constraints
          or ancestor-or-self::gmd:MD_SecurityConstraints 
          or ancestor-or-self::gmd:MD_LegalConstraints
          ">
          <xsl:text>mco</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:MD_BrowseGraphic">
          <xsl:text>mcc</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:CI_ResponsibleParty or ancestor-or-self::gmd:CI_OnlineResource">
          <xsl:text>cit</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_ScopeCode or ancestor-or-self::gmx:MX_ScopeCode 
          or ancestor-or-self::gmd:MD_ScopeDescription">
          <xsl:text>mcc</xsl:text>
        </xsl:when>
        <xsl:when
          test="parent::gmd:MD_Identifier or self::gmd:MD_Identifier or parent::gmd:RS_Identifier or self::gmd:RS_Identifier">
          <xsl:text>mcc</xsl:text>
        </xsl:when>
        <!--
          Changed 2013-03-06 to fix PresentationFormCode <xsl:when test="parent::gmd:CI_Citation or self::gmd:CI_Citation">-->
        <xsl:when test="ancestor-or-self::gmd:CI_Citation">
          <xsl:text>cit</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmi:MI_AcquisitionInformation">
          <xsl:text>mac</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:MD_PortrayalCatalogueReference">
          <xsl:text>mpc</xsl:text>
        </xsl:when>
        <!--<xsl:when test="ancestor-or-self::gmd:MD_SpatialRepresentationTypeCode">
          <xsl:text>msr</xsl:text>
        </xsl:when>-->
        <xsl:when test="ancestor-or-self::gmd:MD_ReferenceSystem">
          <xsl:text>mrs</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:MD_MetadataExtensionInformation">
          <xsl:text>mex</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:EX_Extent">
          <xsl:text>gex</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_Georectified or ancestor-or-self::gmi:MI_Georectified
          or ancestor-or-self::gmd:MD_Georeferenceable or ancestor-or-self::gmi:MI_Georeferenceable
          or ancestor-or-self::gmd:MD_GridSpatialRepresentation or ancestor-or-self::gmd:MD_ReferenceSystem
          or name()=gmi:MI_Metadata">
          <xsl:text>msr</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:DQ_Scope">
          <xsl:text>mcc</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:MD_Distribution or ancestor-or-self::gmd:MD_Format">
          <xsl:text>mrd</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_Resolution or ancestor-or-self::gmd:MD_RepresentativeFraction or ancestor-or-self::gmd:MD_VectorSpatialRepresentation">
          <xsl:text>mri</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:MD_MaintenanceInformation">
          <xsl:text>mmi</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_DataIdentification or ancestor-or-self::srvold:SV_ServiceIdentification">
          <!-- or ancestor-or-self::gmd:MD_SpatialRepresentationTypeCode"> this test is not necessary -->
          <xsl:text>mri</xsl:text>
        </xsl:when>
        <xsl:when
          test="ancestor-or-self::gmd:MD_CoverageDescription or ancestor-or-self::gmi:MI_CoverageDescription
          or ancestor-or-self::gmd:MD_FeatureCatalogueDescription or ancestor-or-self::gmd:MD_ImageDescription">
          <xsl:text>mrc</xsl:text>
        </xsl:when>
        <!-- Moved here to get CoverageResult right -->
        <!--<xsl:when test="ancestor-or-self::gmd:MD_SpatialRepresentationTypeCode">
          <xsl:text>mri</xsl:text>
        </xsl:when>-->
        <xsl:when test="ancestor-or-self::gmi:QE_CoverageResult">
          <xsl:text>mdq</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:LI_Lineage">
          <xsl:text>mrl</xsl:text>
        </xsl:when>
        <xsl:when test="ancestor-or-self::gmd:DQ_DataQuality">
          <xsl:text>mdq</xsl:text>
        </xsl:when>
        <xsl:when test="parent::gmi:MI_Metadata">
          <xsl:text>mdb</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>mdb</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$prefix"/>
  </xsl:template>
  <!-- 
    Empty High-Priority Templates to prevent
    independent actions on these elements
  -->
  <xsl:template match="gmd:hierarchyLevelName" priority="5"/>
  <xsl:template match="gmd:metadataStandardVersion" priority="5"/>
  <xsl:template match="gmd:dataSetURI" priority="5"/>
  <xsl:template match="gmd:contentInfo/gmd:MD_CoverageDescription/gmd:attributeDescription"
    priority="5"/>
  <xsl:template match="gmd:contentInfo/gmi:MI_CoverageDescription/gmi:rangeElementDescription"
    priority="5"/>
  <xsl:template match="gmd:contentInfo/gmd:MD_ImageDescription/gmd:contentType" priority="5"/>
  <xsl:template
    match="gmd:report/gmd:DQ_QuantitativeAttributeAccuracy/gmd:result/gmi:QE_CoverageResult//gmd:attributeDescription"
    priority="5"/>
  <xsl:template match="gmd:MD_ExtendedElementInformation/gmd:shortName" priority="5"/>
  <xsl:template match="gmd:MD_ExtendedElementInformation/gmd:domainCode" priority="5"/>
  <xsl:template match="gmd:MD_Format/gmd:name" priority="5"/>
  <xsl:template match="gmd:MD_Format/gmd:specification" priority="5"/>
  <xsl:template match="gmd:MD_Format/gmd:version" priority="5"/>
  <xsl:template
    match="srvold:containsOperations/srvold:SV_OperationMetadata/srvold:parameters/srvold:SV_Parameter/srvold:valueType"
    priority="5"/>
  <!-- Include templates for CI_ResponsibleParty. These are included here to prevent them being overridden by the default template.
       I am not sure why this is necessary.
  -->
  <xsl:include href="CI_ResponsibleParty.xsl"/>
  <!-- Include templates for CI_Citation. These are included here to prevent them being overridden by the default template.
       I am not sure why this is necessary.
  -->
  <xsl:include href="CI_Citation.xsl"/>
</xsl:stylesheet>
