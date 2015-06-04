<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:cat="http://standards.iso.org/iso/19115/-3/cat/1.0"
  xmlns:lan="http://standards.iso.org/iso/19115/-3/lan/1.0"
  xmlns:gco="http://standards.iso.org/iso/19115/-3/gco/1.0" xmlns:gml="http://www.opengis.net/gml/3.2"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  version="1.0">
  <xsl:variable name="stylesheetName" select="'CT_CodelistHTML.xsl'"/>
  <xsl:variable name="stylesheetVersion" select="'2015-04-17'"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="/cat:CT_CodelistCatalogue/cat:name"/>
        </title>
      </head>
      <h1>ISO 19115-3 Codelist Report</h1>
      <h2>
        <xsl:value-of select="/cat:CT_CodelistCatalogue/cat:name"/>
      </h2>
      <table>
        <tr>
          <b><td>Scope</td></b>
          <td>
            <xsl:value-of select="/cat:CT_CodelistCatalogue/cat:scope"/>
          </td>
        </tr>
        <tr>
          <b><td>Field of Application</td></b>
          <td>
            <xsl:value-of select="/cat:CT_CodelistCatalogue/cat:fieldOfApplication"/>
          </td>
        </tr>
        <tr>
          <b><td>Version (Date)</td></b>
          <td><xsl:value-of select="/cat:CT_CodelistCatalogue/cat:versionNumber"/> (<xsl:value-of
              select="cat:versionDate"/>)</td>
        </tr>
      </table>
      <xsl:for-each select="//cat:CT_Codelist">
        <h2><xsl:value-of select="cat:name"/> (<xsl:value-of select="cat:identifier"/>):</h2>
        <b>Description: </b>
        <xsl:value-of select="cat:description"/>
        <table width="95%" border="1" cellpadding="2" cellspacing="2">
          <tr>
            <th valign="top">Entry</th>
            <th valign="top">Definition</th>
          </tr>
          <xsl:for-each select="cat:codeEntry">
            <xsl:variable name="entry" select="(cat:CT_CodelistValue/cat:identifier)"/>
            <xsl:variable name="definition" select="cat:CT_CodelistValue/cat:definition"/>
            <tr>
              <td valign="top">
                <xsl:value-of select="$entry"/>
              </td>
              <td valign="top">
                <xsl:value-of select="$definition"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <a href="#top">top</a>
      </xsl:for-each>
      <hr/>
      <i>
        <xsl:value-of
          select="concat('Stylesheet: ',$stylesheetName,' Version: ',$stylesheetVersion)"/>
      </i>
    </html>
  </xsl:template>
</xsl:stylesheet>
