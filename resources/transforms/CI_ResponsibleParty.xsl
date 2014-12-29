<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv1="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:cat="http://www.isotc211.org/namespace/cat/1.0/2014-07-11" xmlns:cit="http://www.isotc211.org/namespace/cit/1.0/2014-07-11"
    xmlns:gcx="http://www.isotc211.org/namespace/gcx/1.0/2014-07-11" xmlns:gex="http://www.isotc211.org/namespace/gex/1.0/2014-07-11" xmlns:lan="http://www.isotc211.org/namespace/lan/1.0/2014-07-11" xmlns:srv="http://www.isotc211.org/namespace/srv/2.0/2014-07-11" xmlns:mac="http://www.isotc211.org/namespace/mac/1.0/2014-07-11" xmlns:mas="http://www.isotc211.org/namespace/mas/1.0/2014-07-11"
    xmlns:mcc="http://www.isotc211.org/namespace/mcc/1.0/2014-07-11" xmlns:mco="http://www.isotc211.org/namespace/mco/1.0/2014-07-11" xmlns:mda="http://www.isotc211.org/namespace/mda/1.0/2014-07-11" xmlns:mdb="http://www.isotc211.org/namespace/mdb/1.0/2014-07-11" xmlns:mdt="http://www.isotc211.org/namespace/mdt/1.0/2014-07-11" xmlns:mex="http://www.isotc211.org/namespace/mex/1.0/2014-07-11"
    xmlns:mrl="http://www.isotc211.org/namespace/mrl/1.0/2014-07-11" xmlns:mds="http://www.isotc211.org/namespace/mds/1.0/2014-07-11" xmlns:mmi="http://www.isotc211.org/namespace/mmi/1.0/2014-07-11" xmlns:mpc="http://www.isotc211.org/namespace/mpc/1.0/2014-07-11" xmlns:mrc="http://www.isotc211.org/namespace/mrc/1.0/2014-07-11" xmlns:mrd="http://www.isotc211.org/namespace/mrd/1.0/2014-07-11"
    xmlns:mri="http://www.isotc211.org/namespace/mri/1.0/2014-07-11" xmlns:mrs="http://www.isotc211.org/namespace/mrs/1.0/2014-07-11" xmlns:msr="http://www.isotc211.org/namespace/msr/1.0/2014-07-11" xmlns:mdq="http://www.isotc211.org/namespace/mdq/1.0/2014-07-11" exclude-result-prefixes="#all">
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
        <xd:desc>
            <xd:p>
                <xd:b>Created on:</xd:b>December 5, 2014 </xd:p>
            <xd:p>These templates transform ISO 19139 CI_Responsibility XML content into ISO 19115-3 CI_Responsibility They are designed to be imported as a template library</xd:p>
            <xd:p>
                <xd:b>Version December 5, 2014</xd:b>
                <xd:ul>
                    <xd:li>Initial Version</xd:li>
                </xd:ul>
            </xd:p>
            <xd:p><xd:b>Author:</xd:b>thabermann@hdfgroup.org</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="gmd:CI_ResponsibleParty">
        <xsl:choose>
            <xsl:when test="count(gmd:individualName/gco:CharacterString) + count(gmd:organisationName/gco:CharacterString) + count(gmd:positionName/gco:CharacterString) > 0">
                <!-- 
                CI_ResponsibleParties that include name elements (individualName, organisationName, or positionName) are translated to CI_Responsibilities.
                CI_ResponsibleParties without name elements are assummed to be placeholders for CI_OnlineResources. They are transformed later in the process
                using the CI_ResponsiblePartyToOnlineResource template
                -->
               <xsl:element name="cit:CI_Responsibility">
                    <xsl:copy-of select="./@*"/>
                    <xsl:choose>
                        <xsl:when test="./gmd:role/gmd:CI_RoleCode">
                            <xsl:call-template name="writeCodelistElement">
                                <xsl:with-param name="elementName" select="'cit:role'"/>
                                <xsl:with-param name="codeListName" select="'cit:CI_RoleCode'"/>
                                <xsl:with-param name="codeListValue" select="gmd:role/gmd:CI_RoleCode/@codeListValue"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="./gmd:role/@*">
                            <cit:role>
                                <xsl:copy-of select="./gmd:role/@*"/>
                            </cit:role>
                        </xsl:when>
                        <xsl:otherwise>
                            <cit:role gco:nilReason="missing"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <cit:party>
                        <xsl:choose>
                            <xsl:when test="gmd:organisationName">
                                <cit:CI_Organisation>
                                    <xsl:call-template name="writeCharacterStringElement">
                                        <xsl:with-param name="elementName" select="'cit:name'"/>
                                        <xsl:with-param name="nodeWithStringToWrite" select="gmd:organisationName"/>
                                    </xsl:call-template>
                                    <!-- contactInformation comes before indivudual/position -->
                                    <xsl:call-template name="writeContactInformation"/>
                                    <xsl:if test="gmd:individualName | gmd:positionName">
                                        <cit:individual>
                                            <cit:CI_Individual>
                                                <xsl:if test="gmd:individualName">
                                                    <xsl:call-template name="writeCharacterStringElement">
                                                        <xsl:with-param name="elementName" select="'cit:name'"/>
                                                        <xsl:with-param name="nodeWithStringToWrite" select="gmd:individualName"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="gmd:positionName">
                                                    <xsl:call-template name="writeCharacterStringElement">
                                                        <xsl:with-param name="elementName" select="'cit:positionName'"/>
                                                        <xsl:with-param name="nodeWithStringToWrite" select="gmd:positionName"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </cit:CI_Individual>
                                        </cit:individual>
                                    </xsl:if>
                                </cit:CI_Organisation>
                            </xsl:when>
                            <xsl:otherwise>
                                <cit:CI_Individual>
                                    <xsl:if test="gmd:individualName">
                                        <xsl:call-template name="writeCharacterStringElement">
                                            <xsl:with-param name="elementName" select="'cit:name'"/>
                                            <xsl:with-param name="nodeWithStringToWrite" select="gmd:individualName"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:call-template name="writeContactInformation"/>
                                    <xsl:if test="gmd:positionName">
                                        <xsl:call-template name="writeCharacterStringElement">
                                            <xsl:with-param name="elementName" select="'cit:positionName'"/>
                                            <xsl:with-param name="nodeWithStringToWrite" select="gmd:positionName"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </cit:CI_Individual>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--<xsl:apply-templates/>-->
                    </cit:party>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="CI_ResponsiblePartyToOnlineResource">
        <!-- 
        CI_ResponsibleParties that have no name elements and only a CI_OnlineResource
        are assumed to be used to add CI_OnlineResources to CI_Citations in 19115 where
        CI_Citations do not include CI_OnlineResources. In this case we, transform
        only the CI_OnlineResource element of the CI_ResponsibleParty 
    -->
        <xsl:apply-templates select=".//gmd:onlineResource"/>
    </xsl:template>
    <!-- Empty high-priority templates are used for elements that move to new locations in the output -->
    <xsl:template match="gmd:CI_ResponsibleParty/gmd:role" priority="5"/>
    <xsl:template match="gmd:CI_ResponsibleParty/gmd:organisationName" priority="5"/>
    <xsl:template match="gmd:CI_ResponsibleParty/gmd:individualName" priority="5"/>
    <xsl:template match="gmd:CI_ResponsibleParty/gmd:positionName" priority="5"/>
    <xsl:template name="writeContactInformation">
        <xsl:for-each select="gmd:contactInfo">
            <cit:contactInfo>
                <xsl:apply-templates/>
            </cit:contactInfo>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
