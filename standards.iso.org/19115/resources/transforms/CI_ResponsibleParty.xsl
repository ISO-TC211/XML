<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gmi="http://www.isotc211.org/2005/gmi"
                xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:gsr="http://www.isotc211.org/2005/gsr"
                xmlns:gss="http://www.isotc211.org/2005/gss"
                xmlns:gts="http://www.isotc211.org/2005/gts"
                xmlns:srv1="http://www.isotc211.org/2005/srv"
                xmlns:gml="http://www.opengis.net/gml/3.2"
                xmlns:xlink="http://www.w3.org/1999/xlink"
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
                xmlns:gco2="http://standards.iso.org/19115/-3/gco/1.0"
                exclude-result-prefixes="#all">
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
                   <xsl:apply-templates select="./@*"/>
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
                                <xsl:apply-templates select="./gmd:role/@*"/>
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
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates/>
            </cit:contactInfo>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
