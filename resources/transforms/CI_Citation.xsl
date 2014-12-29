<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv1="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cat="http://www.isotc211.org/namespace/cat/1.0/2014-07-11" xmlns:cit="http://www.isotc211.org/namespace/cit/1.0/2014-07-11"
    xmlns:gcx="http://www.isotc211.org/namespace/gcx/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:lan="http://www.isotc211.org/namespace/lan/1.0/2014-07-11" xmlns:srv="http://www.isotc211.org/namespace/srv/2.0/2014-07-11" xmlns:mac="http://www.isotc211.org/namespace/mac/1.0/2014-07-11" xmlns:mas="http://www.isotc211.org/namespace/mas/1.0/2014-07-11"
    xmlns:mcc="http://www.isotc211.org/namespace/mcc/1.0/2014-07-11" xmlns:mco="http://www.isotc211.org/namespace/mco/1.0/2014-07-11" xmlns:mda="http://www.isotc211.org/namespace/mda/1.0/2014-07-11" xmlns:mdb="http://www.isotc211.org/namespace/mdb/1.0/2014-07-11" xmlns:mdt="http://www.isotc211.org/namespace/mdt/1.0/2014-07-11" xmlns:mex="http://www.isotc211.org/namespace/mex/1.0/2014-07-11"
    xmlns:mrl="http://www.isotc211.org/namespace/mrl/1.0/2014-07-11" xmlns:mds="http://www.isotc211.org/namespace/mds/1.0/2014-07-11" xmlns:mmi="http://www.isotc211.org/namespace/mmi/1.0/2014-07-11" xmlns:mpc="http://www.isotc211.org/namespace/mpc/1.0/2014-07-11" xmlns:mrc="http://www.isotc211.org/namespace/mrc/1.0/2014-07-11" xmlns:mrd="http://www.isotc211.org/namespace/mrd/1.0/2014-07-11"
    xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:mrs="http://www.isotc211.org/namespace/mrs/1.0/2014-07-11" xmlns:msr="http://www.isotc211.org/namespace/msr/1.0/2014-07-11" xmlns:mdq="http://www.isotc211.org/namespace/mdq/1.0/2014-07-11" exclude-result-prefixes="#all">
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b>December 5, 2014 </xd:p>
            <xd:p>These templates transform ISO 19139 CI_Citation XML content into ISO 19115-3 CI_Citation. They are designed to be imported as a template library</xd:p>
            <xd:p>Version December 5, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b>thabermann@hdfgroup.org</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="gmd:CI_Citation">
        <xsl:element name="cit:CI_Citation">
            <xsl:apply-templates/>
            <!-- Special attention is required for CI_ResponsibleParties that are included in the CI_Citation only for a URL. These are currently identified as those 
        with no name elements (individualName, organisationName, or positionName)
      -->
            <xsl:for-each select=".//gmd:CI_ResponsibleParty[count(gmd:individualName/gco:CharacterString) + count(gmd:organisationName/gco:CharacterString) + count(gmd:positionName/gco:CharacterString) = 0]">
                <xsl:call-template name="CI_ResponsiblePartyToOnlineResource"/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template match="gmd:CI_Citation/gmd:date">
        <cit:date>
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="normalize-space()=''">
                    <xsl:attribute name="gco:nilReason" select="'missing'"/>
                </xsl:when>
                <xsl:otherwise>
                    <cit:CI_Date>
                        <cit:date>
                            <xsl:choose>
                                <xsl:when test="descendant::gmd:date/@gco:nilReason">
                                    <xsl:copy-of select="descendant::gmd:date/@gco:nilReason"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="writeDateTime"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </cit:date>
                        <xsl:for-each select="descendant::gmd:dateType">
                            <xsl:call-template name="writeCodelistElement">
                                <xsl:with-param name="elementName" select="'cit:dateType'"/>
                                <xsl:with-param name="codeListName" select="'cit:CI_DateTypeCode'"/>
                                <xsl:with-param name="codeListValue" select="gmd:CI_DateTypeCode"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </cit:CI_Date>
                </xsl:otherwise>
            </xsl:choose>
        </cit:date>
    </xsl:template>
    <xsl:template match="gmd:CI_Citation/gmd:title">
        <xsl:call-template name="writeCharacterStringElement">
            <xsl:with-param name="elementName" select="'cit:title'"/>
            <xsl:with-param name="nodeWithStringToWrite" select="."/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="gmd:CI_Citation/gmd:editionDate">
        <cit:editionDate>
            <xsl:call-template name="writeDateTime"/>
        </cit:editionDate>
    </xsl:template>
</xsl:stylesheet>
