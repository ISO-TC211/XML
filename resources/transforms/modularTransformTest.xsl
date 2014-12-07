<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv1="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cat="http://www.isotc211.org/namespace/cat/1.0/2014-07-11" xmlns:cit="http://www.isotc211.org/namespace/cit/1.0/2014-07-11"
    xmlns:gcx="http://www.isotc211.org/namespace/gcx/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:lan="http://www.isotc211.org/namespace/lan/1.0/2014-07-11" xmlns:srv="http://www.isotc211.org/namespace/srv/2.0/2014-07-11" xmlns:mac="http://www.isotc211.org/namespace/mac/1.0/2014-07-11" xmlns:mas="http://www.isotc211.org/namespace/mas/1.0/2014-07-11"
    xmlns:mcc="http://www.isotc211.org/namespace/mcc/1.0/2014-07-11" xmlns:mco="http://www.isotc211.org/namespace/mco/1.0/2014-07-11" xmlns:mda="http://www.isotc211.org/namespace/mda/1.0/2014-07-11" xmlns:mdb="http://www.isotc211.org/namespace/mdb/1.0/2014-07-11" xmlns:mdt="http://www.isotc211.org/namespace/mdt/1.0/2014-07-11" xmlns:mex="http://www.isotc211.org/namespace/mex/1.0/2014-07-11"
    xmlns:mrl="http://www.isotc211.org/namespace/mrl/1.0/2014-07-11" xmlns:mds="http://www.isotc211.org/namespace/mds/1.0/2014-07-11" xmlns:mmi="http://www.isotc211.org/namespace/mmi/1.0/2014-07-11" xmlns:mpc="http://www.isotc211.org/namespace/mpc/1.0/2014-07-11" xmlns:mrc="http://www.isotc211.org/namespace/mrc/1.0/2014-07-11" xmlns:mrd="http://www.isotc211.org/namespace/mrd/1.0/2014-07-11"
    xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:mrs="http://www.isotc211.org/namespace/mrs/1.0/2014-07-11" xmlns:msr="http://www.isotc211.org/namespace/msr/1.0/2014-07-11" xmlns:mdq="http://www.isotc211.org/namespace/mdq/1.0/2014-07-11" exclude-result-prefixes="#all">
    <!-- Import Template Libraries -->
    <xsl:import href="schema-utility.xsl"/>
    <xsl:import href="CI_ResponsibleParty.xsl"/>
    <xsl:import href="CI_Citation.xsl"/>
    <xsl:import href="DateTime.xsl"/>
    <xsl:import href="transformTools.xsl"/>
    <xsl:variable name="codeListLocation" select="'masterCodeListLocation'"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:variable name="stylesheetVersion" select="'0.1'"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Default template writes correct namespace prefix -->
    <xsl:template match="*">
        <xsl:variable name="nameSpacePrefix">
            <xsl:call-template name="getNamespacePrefix"/>
        </xsl:variable>
        <xsl:element name="{concat($nameSpacePrefix,':',local-name(.))}">
            <!-- copy all attributes -->
            <xsl:copy-of select="@*"/>
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
                <xsl:when test="starts-with(name(),'gmi:') and not(ancestor-or-self::gmi:MI_AcquisitionInformation)
                    and not(ancestor-or-self::gmi:QE_CoverageResult) and not(ancestor-or-self::gmi:LE_ProcessStep)
                    and not(ancestor-or-self::gmi:LE_Source) and not(ancestor-or-self::gmi:MI_CoverageDescription)">
                    <xsl:text>msr</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(name(),'gmi:') and 
                    (ancestor-or-self::gmi:LE_ProcessStep or ancestor-or-self::gmi:LE_Source)">
                    <xsl:text>mrl</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(name(),'gmi:') and (ancestor-or-self::gmi:MI_CoverageDescription)">
                    <xsl:text>mrc</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_Constraints
                    or ancestor-or-self::gmd:MD_SecurityConstraints 
                    or ancestor-or-self::gmd:MD_LegalConstraints
                    ">
                    <xsl:text>mco</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_BrowseGraphic">
                    <xsl:text>mcc</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:CI_ResponsibleParty or ancestor-or-self::gmd:CI_OnlineResource">
                    <xsl:text>cit</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_ScopeCode or ancestor-or-self::gmx:MX_ScopeCode 
                    or ancestor-or-self::gmd:MD_ScopeDescription">
                    <xsl:text>mcc</xsl:text>
                </xsl:when>
                <xsl:when test="parent::gmd:MD_Identifier or self::gmd:MD_Identifier or parent::gmd:RS_Identifier or self::gmd:RS_Identifier">
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
                <xsl:when test="ancestor-or-self::gmd:MD_Georectified or ancestor-or-self::gmi:MI_Georectified
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
                <xsl:when test="ancestor-or-self::gmd:MD_Resolution or ancestor-or-self::gmd:MD_RepresentativeFraction or ancestor-or-self::gmd:MD_VectorSpatialRepresentation">
                    <xsl:text>mri</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_MaintenanceInformation">
                    <xsl:text>mmi</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_DataIdentification or ancestor-or-self::srv1:SV_ServiceIdentification">
                    <!-- or ancestor-or-self::gmd:MD_SpatialRepresentationTypeCode"> this test is not necessary -->
                    <xsl:text>mri</xsl:text>
                </xsl:when>
                <xsl:when test="ancestor-or-self::gmd:MD_CoverageDescription or ancestor-or-self::gmi:MI_CoverageDescription
                    or ancestor-or-self::gmd:MD_FeatureCatalogueDescription">
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
    <xsl:template name="writeCodelistElement">
        <!-- 
        Parameters:
        elementName = the name of the element (with namespace prefix) that contains the codelist, i.e. cit:role 
        codeListName = the name of the CodeList (with namespace prefix), i.e. cit:CI_RoleCode
        codeListValue = the value of the CodeList item, i.e. pointOfContact
        Note: the writeCodeListElement template is included in the main transform file in order to allow the
        definition of the codeListLocation for the transform.
        -->
        <xsl:param name="elementName"/>
        <xsl:param name="codeListName"/>
        <xsl:param name="codeListValue"/>
        <!-- 
        codeListLocation = the location of the codelists used in this translation,
        typically a URL of a codeList Dictionary,
        i.e. http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml
        This value must be set in this file for all codeLists in a translation.
        -->
        <xsl:variable name="codeListLocation" select="'setTheDefaultCodeListLocationInTheMasterTransform'"/>
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
</xsl:stylesheet>
