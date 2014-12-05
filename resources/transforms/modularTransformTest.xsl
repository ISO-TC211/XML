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
