<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:hdf5="http://hdfgroup.org/HDF5/XML/schema/HDF5-File" xmlns:h4="http://www.hdfgroup.org/HDF4/XML/schema/HDF4map/1.0.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Title:</xd:b>Find 19115</xd:p>
      <xd:p>This tranform is used to schema dependencies on ISO 19115</xd:p>
      <xd:p><xd:b>Created on:</xd:b>November 29, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b>thabermann@hdfgroup.org</xd:p>
      <xd:p/>
    </xd:desc>
  </xd:doc>
  <xsl:output method="html"/>
  <xsl:variable name="transformName" select="'find_19115.xsl'"/>
  <xsl:variable name="transformVersion" select="'2014-11-29'"/>
  <xsl:key name="gmdTypes" match="*[starts-with(@type,'gmd:') or starts-with(@type,'gmi:')]" use="@type"/>
  <xsl:variable name="replacements" as="element(replacement)+">
    <replacement old="gmd:CI_Citation_PropertyType" new="mcc:Abstract_Citation_PropertyType"/>
    <replacement old="gmd:CI_OnlineResource_PropertyType" new="mcc:Abstract_OnlineResource_PropertyType"/>
    <replacement old="gmd:CI_ResponsibleParty_PropertyType" new="mcc:Abstract_Responsibility_PropertyType"/>
    <replacement old="gmd:LanguageCode_PropertyType" new="lan:LanguageCode_PropertyType"/>
    <replacement old="gmd:MD_CharacterSetCode_PropertyType" new="lan:MD_CharacterSetCode_PropertyType"/>
    <replacement old="gmd:EX_Extent_PropertyType" new="mcc:Abstract_Extent_PropertyType"/>
    <replacement old="gmd:MD_Identifier_PropertyType" new="mcc:MD_Identifier_PropertyType"/>
    <replacement old="gmd:MD_ProgressCode_PropertyType" new="mcc:MD_ProgressCode_PropertyType"/>
    <replacement old="gmi:MI_BandDefinition_PropertyType" new="mrc:MI_BandDefinition_PropertyType"/>
    <replacement old="gmi:MI_Band_Type" new="mrc:MI_Band_Type"/>
    <replacement old="gmi:MI_CoverageDescription_Type" new="mrc:MI_CoverageDescription_Type"/>
    <replacement old="gmi:MI_ImageDescription_Type" new="mrc:MI_ImageDescription_Type"/>
    <replacement old="gmi:MI_PolarisationOrientationCode_PropertyType" new="mrc:MI_PolarisationOrientationCode_PropertyType"/>
    <replacement old="gmi:MI_RangeElementDescription_PropertyType" new="mrc:MI_RangeElementDescription_PropertyType"/>
    <replacement old="gmi:MI_RangeElementDescription_Type" new="mrc:MI_RangeElementDescription_Type"/>
    <replacement old="gmi:MI_TransferFunctionTypeCode_PropertyType" new="mrc:MI_TransferFunctionTypeCode_PropertyType"/>
    <replacement old="gmi:MI_AcquisitionInformation_PropertyType" new="mcc:Abstract_AcquisitionInformation_PropertyType"/>
    <replacement old="gmi:MI_Metadata_Type" new="mdb:MD_Metadata_Type"/>
    <replacement old="gmi:MI_Instrument_PropertyType" new="mac:MI_Instrument_PropertyType"/>
    <replacement old="gmi:MI_Platform_PropertyType" new="mac:MI_Platform_PropertyType"/>
    <replacement old="gmi:MI_Operation_PropertyType" new="mac:MI_Operation_PropertyType"/>
    <replacement old="gmi:MI_Plan_PropertyType" new="mac:MI_Plan_PropertyType"/>
    <replacement old="gmi:MI_Objective_PropertyType" new="mac:MI_Objective_PropertyType"/>
    <replacement old="gmi:MI_Requirement_PropertyType" new="mac:MI_Requiremente_PropertyType"/>
    <replacement old="gmi:MI_EnvironmentalRecord_PropertyType" new="mac:MI_EnvironmentalRecord_PropertyType"/>
    <replacement old="gmi:MI_Instrument_Type" new="mac:MI_Instrument_Type"/>
    <replacement old="gmi:MI_Platform_Type" new="mac:MI_Platform_Type"/>
    <replacement old="gmi:MI_Operation_Type" new="mac:MI_Operation_Type"/>
    <replacement old="gmi:MI_Plan_Type" new="mac:MI_Plan_Type"/>
    <replacement old="gmi:MI_Objective_Type" new="mac:MI_Objective_Type"/>
    <replacement old="gmi:MI_Requirement_Type" new="mac:MI_Requiremente_Type"/>
    <replacement old="gmi:MI_EnvironmentalRecord_Type" new="mac:MI_EnvironmentalRecord_Type"/>
    <replacement old="gmi:MI_ObjectiveTypeCode_PropertyType" new="mac:MI_ObjectiveTypeCode_PropertyType"/>
    <replacement old="gmi:MI_PlatformPass_PropertyType" new="mac:MI_PlatformPass_PropertyType"/>
    <replacement old="gmi:MI_PlatformPass_Type" new="mac:MI_PlatformPass_Type"/>
    <replacement old="gmi:MI_PriorityCode_PropertyType" new="mac:MI_PriorityCode_PropertyType"/>
    <replacement old="gmi:MI_RequestedDate_PropertyType" new="mac:MI_RequestedDate_PropertyType"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
    <replacement old="old" new="new"/>
  </xsl:variable>
  <xsl:variable name="fileName">
    <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
  </xsl:variable>
  <xsl:template match="/">
    <html>
      <body>
        <h1>
          <xsl:value-of select="concat('ISO 19115 Elements in ',$fileName)"/>
        </h1>
        <xsl:for-each select="//*[generate-id() = generate-id(key('gmdTypes',@type)[1])]">
          <xsl:sort select="@type"/>
          <xsl:variable name="gmdType" select="@type"/>
          <h2>
            <xsl:value-of select="$gmdType"/>
          </h2>
          <ul>
            <xsl:for-each select="//xs:element[@type=$gmdType]">
              <li>
                <xsl:value-of select="concat(ancestor::xs:complexType/@name,'/',@name,'/',@type)"/>
              </li>
            </xsl:for-each>
          </ul>
          <b>
            <xsl:value-of select="concat('Replace these types with ',$replacements[@old=$gmdType]/@new)"/>
          </b>
        </xsl:for-each>
        <hr/>
        <i>
          <xsl:value-of select="concat('Created using ',$transformName,' Version: ',$transformVersion)"/>
        </i>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
