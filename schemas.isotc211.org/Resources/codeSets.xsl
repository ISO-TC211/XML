<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:cat="https://schemas.isotc211.org/19139/-/cat/1.2"
  xmlns:gco="https://schemas.isotc211.org/19103/-/gco/1.2"
  xmlns:lan="https://schemas.isotc211.org/19115/-1/lan/1.3"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml/3.2"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on: </xd:b>2025-03-21</xd:p>
      <xd:p><xd:b>Author: </xd:b>Evert Bleys</xd:p>
      <xd:p><xd:b>Updated on: </xd:b>2025-03-21</xd:p>
      <xd:p>Added Catalog information and summary fields (counts of codelists and items), updated
        Version date</xd:p>
    </xd:desc>
  </xd:doc>
  <xsl:template match="/" xml:space="preserve">
<!--  <xsl:output method="text" version="1.1" indent="yes" omit-xml-declaration="no"/>
  <xsl:param name="contents"/>
  <xsl:variable name="stylesheetName" select="'codeSets.xsl'"/>
  <xsl:variable name="stylesheetVersion" select="'2025-03-18'"/>
  -->
    <html>
 			<head>
				<title>
					<xsl:value-of select="'ISO TC211 codelist catalogs'"/>
				</title>
					<style type="text/css">
						h1 { font-family: Arial; color: DarkBlue; font-size: 14pt; font-weight:bold; }
						body { font-family: Arial; color: black; font-size: 10pt;}
						td { font-family: Arial; color: black; font-size: 10pt;}
						.metagroup { font-family: Arial; color: #0099FF; font-size: 10pt; font-weight:bold; }
					</style>
				</head>
      <body bgcolor="#FFFFCC">
     <a name="top"/>
      <h1>Codelist Catalog</h1>
      <p>This report describes the ISO TC211 code set catalogs, the code sets they contain, and the values and definitions of those codes.</p>
      <p> 
        Please contact <a href="mailto:EJBleys@gmail.com">Evert Bleys</a> if you have questions or suggestions.</p>
      <h2>Catalog</h2>
      <b>Name: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:name/gco:CharacterString"/><br/>
      <b>Scope: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:scope/gco:CharacterString"/><br/>
      <b>Field of application: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:fieldOfApplication/gco:CharacterString"/><br/>
      <b>Version: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:versionNumber/gco:CharacterString"/><br/>
      <b>Date: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:versionDate/gco:Date"/><br/>
      <b>Number of CodeLists: </b><xsl:value-of select="count(//cat:codelistItem)"/><br/>
      <b>Number of items: </b><xsl:value-of select="count(//cat:codeEntry)"/>
      <hr/>
      <h2>Codelists</h2>
        <xsl:for-each select="cat:CT_CodelistCatalogue/cat:subCatalogue/cat:CT_CodelistCatalogue/cat:subCatalogue/cat:CT_CodelistCatalogue/cat:codelistItem/cat:CT_Codelist"><h3><xsl:value-of select="@xlink:title"/></h3>
                    <xsl:variable name="CodeSetIdlist" select="@id"/>
                  <xsl:variable name="CodeSetIdlistLink" select="concat('#',@id)"/>
                     <xsl:value-of select="'Code set name: '"/><font color="purple" size="2"><b><xsl:value-of select="cat:identifier/gco:ScopedName"/></b></font>
                     <xsl:value-of select="'; Code set id: '"/><a href="{$CodeSetIdlistLink}">
                       <font color="blue" size="2"><xsl:value-of select="$CodeSetIdlist"/></font></a><br/>
        </xsl:for-each>
        
        <xsl:for-each select="cat:CT_CodelistCatalogue/cat:subCatalogue"><h3><xsl:value-of select="@xlink:title"/></h3>
          <xsl:for-each select="cat:CT_CodelistCatalogue/cat:subCatalogue"><h3><xsl:value-of select="@xlink:title"/></h3>
            <b>Name: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:name/gco:CharacterString"/><br/>
            <b>Version: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:versionNumber/gco:CharacterString"/><br/>
            <b>Date: </b><xsl:value-of select="cat:CT_CodelistCatalogue/cat:versionDate/gco:Date"/><br/>
            <xsl:for-each select="cat:CT_CodelistCatalogue/cat:codelistItem"><h3><xsl:value-of select="@xlink:title"/></h3>
              <xsl:for-each select="cat:CT_Codelist">
                <xsl:variable name="CodeSetId" select="@id"/><a name="{$CodeSetId}" id="{$CodeSetId}"><xsl:value-of select="'Code set id: '"/><font color="blue" size="2"><xsl:value-of select="$CodeSetId"/></font></a><br/>
                <xsl:for-each select="cat:codeEntry/cat:CT_CodelistValue">
                  <table border="1" cellpadding="1" cellspacing="1" width="100%">
                       <xsl:variable name="CodeSetEntryId" select="@id"/>
                    <tr><td>
                         <a name="$CodeSetEntryId" id="{$CodeSetEntryId}"><font color="blue" size="2"><b><xsl:value-of select="cat:name/gco:ScopedName"/></b></font></a><br/>
                         <b><xsl:value-of select="'Code set value id: '"/></b><xsl:value-of select="$CodeSetEntryId"/><br/>
                         <b><xsl:value-of select="'Code set value definition: '"/></b><xsl:value-of select="cat:definition/gco:CharacterString"/><br/>
                         <b><xsl:value-of select="'Code set value description: '"/></b><xsl:value-of select="cat:description/gco:CharacterString"/><br/>
                       </td></tr>
                      </table>
                </xsl:for-each>
              </xsl:for-each>
              
            </xsl:for-each>

          </xsl:for-each>
        </xsl:for-each>
 
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
