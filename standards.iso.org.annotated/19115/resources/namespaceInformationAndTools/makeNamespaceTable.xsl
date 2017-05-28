<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
  <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
    <xd:desc>
      <xd:p>
        <xd:b>Title: Write Standard ISO Namespace Table</xd:b>
      </xd:p>
      <xd:p><xd:b>Version:</xd:b>0.0</xd:p>
      <xd:p><xd:b>Created on:</xd:b>February 27, 2013</xd:p>
      <xd:p><xd:b>Revised on:</xd:b>August 4, 2014</xd:p>
      <xd:p><xd:b>Author:</xd:b>rehabermann@me.com</xd:p>
      <xd:p>This stylesheets reads ISOSchema.xml and uses writes standard namespace description
        files.</xd:p>
      <xd:p>It assumes a schema directory hierarchy like
        schemaRootDirectory/namespace/version/workingVersionDate/namespace.xsd</xd:p>
      <xd:p>and writes index.html files into the namespace directories
        (schemaRootDirectory/namespace/version/workingVersionDate/index.html)</xd:p>
    </xd:desc>
  </xd:doc>
  <!-- Parameter schemaRootDirectory:
    This is the root of the schema directories. 
    Example: /Users/tedhabermann/GitRepositories/ISOTC211-XML/XML/standards.iso.org 
  -->
  <xsl:param name="schemaRootDirectory"/>
  <!-- Parameter standard:
    This is a space delimited list of the schemaStandardNumbers to be included in the output. 
    Namespaces whose schemaStandardNumber is in this list will be included in the output.
    Example: 19115-3 19157-2 19110 19111 19135
  -->
  <xsl:param name="standard"/>
  <!-- Parameter workingVersionDate
    This is the date associated with a working version of the schema. It is in the format /YYYY-MM-DD
    NOTE THE SLASH INCLUDED BEFORE THE DATE
    Example: /2014-12-25
  -->
  <xsl:param name="workingVersionDate"/>
  <xsl:output method="html"/>
  <xsl:strip-space elements="*"/>
  <xsl:key name="namespaceTitleLookup" match="namespace" use="prefix"/>
  <xsl:variable name="TransformName" select="'makeNamespaceTable'"/>
  <xsl:variable name="TransformVersion" select="'2015-06-06'"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>ISO Namespaces</title>
      </head>
      <body>
        <table border="1" cellpadding="3">
          <tr>
            <th>Standard Prefix</th>
            <th>Title</th>
            <th>Version</th>
            <th>Scope</th>
            <th>Standard, Paragraph</th>
            <th>Requirements Name</th>
            <th>Namespace URI</th>
            <th>Thumbnail</th>
            <th>UML Package</th>
            <th>XML Schema</th>
            <th>XML Schema Included</th>
            <th>Imported Namespaces</th>
          </tr>
          <xsl:for-each select="//namespace[contains($standard,schemaStandardNumber)]">
            <xsl:sort select="prefix"/>
            <xsl:variable name="currentNamespace" select="."/>
            <xsl:variable name="schemaFile"
              select="concat($schemaRootDirectory,'/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/',prefix,'.xsd')"/>
            <xsl:variable name="schemaDirectory"
              select="concat($schemaRootDirectory,'/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/')"/>
            <xsl:variable name="namespaceVersion" select="concat(prefix,' ',version)"/>
            <xsl:variable name="namespaceURL" select="concat(location,'/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version)"/>
            <xsl:variable name="upperCasePrefix" select="upper-case(prefix)"/>
            <xsl:variable name="namespaceVersionTitle" select="concat($upperCasePrefix,' ',version)"/>
            <tr>
              <td>
                <!-- Standard Prefix -->
                <xsl:element name="a">
                  <!--<xsl:attribute name="href" select="concat('..','/standards.iso.org/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/','index.html')"/>-->
                  <!-- This makes links relative to this file (use locally) -->
                  <xsl:attribute name="href" select="concat('../../',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/','index.html')"/>
                  <!-- This makes links to standards.iso.org -->
                  <!--<xsl:attribute name="href" select="concat(location,'/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/','index.html')"/>-->
                  <xsl:value-of select="prefix"/>
                </xsl:element>
              </td>
              <td>
                <!-- Title -->
                <xsl:value-of select="title"/>
              </td>
              <td>
                <!-- Version -->
                <xsl:value-of select="version"/>
              </td>
              <td>
                <!-- Scope -->
                <xsl:value-of select="scope"/>
              </td>
              <td>
                <!-- Standard - Paragraph -->
                <xsl:value-of
                  select="concat('ISO ',conceptualStandardNumber,', ',conceptualStandardTitle)"
                />
                <xsl:if test="string-length(paragraphNumber)">
                  <xsl:value-of
                    select="concat(', ',paragraphNumber)"
                  />
                </xsl:if>
              </td>
              <td>
                <!-- Requirements Name -->
                <xsl:value-of select="requirementRoot"/>
              </td>
              <td>
                <!-- Namespace URI -->
                <xsl:element name="a">
                  <xsl:attribute name="href" select="$namespaceURL"/>
                  <xsl:value-of select="$namespaceURL"/>
                </xsl:element>               
              </td>
              <td>
                <!-- Thumbnail -->
                <!-- relative links to images -->
                <xsl:variable name="imageFile"
                  select="concat('../../',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/',prefix,'.png')"/>
                <!-- links to images on standards.iso.org -->
        <!--        <xsl:variable name="imageFile"
                  select="concat(location,'/',replace(schemaStandardNumber,'-','/-'),'/',prefix,'/',version,$workingVersionDate,'/',prefix,'.png')"/> -->
                <a>
                  <xsl:attribute name="href" select="$imageFile"/>
                  <img>
                    <xsl:attribute name="src" select="$imageFile"/>
                    <xsl:attribute name="width" select="200"/>
                  </img>
                </a>
              </td>
              <td align="center">
                <!-- UML Package -->
                <xsl:value-of select="UMLPackage"/>
              </td>
              <td>
                <xsl:element name="a">
                  <xsl:attribute name="href" select="concat($namespaceURL,'/',prefix,'.xsd')"/>
                  <xsl:value-of select="concat(prefix,'.xsd')"/>
                </xsl:element>
              </td>
              <td>
                <!-- XML Schema Included -->
                <xsl:variable name="otherSchemaList" as="xs:string*">
                  <xsl:choose>
                    <xsl:when test="count(document($schemaFile)/*/xs:include)">
                      <xsl:for-each select="document($schemaFile)/*/xs:include">
                        <xsl:sequence select="@schemaLocation"/>
                      </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:sequence select="'No Other Schema'"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <!--<xsl:if test="count($otherSchemaList)">
                  <xsl:value-of select="$otherSchemaList" separator=", "/>
                </xsl:if>-->
                <xsl:for-each select="$otherSchemaList">
                  <xsl:element name="a">
                    <xsl:attribute name="href" select="concat($namespaceURL,'/',.)"/>
                    <xsl:value-of select="."/>
                  </xsl:element>
                  <xsl:text> </xsl:text>
                </xsl:for-each>
              </td>
              <xsl:variable name="xsdFilesSelect" select="concat($schemaDirectory, '?select=*.xsd')"/>
              <xsl:variable name="namespacePrefixList" as="xs:string*">
                <xsl:for-each select="collection(iri-to-uri($xsdFilesSelect))">
                  <xsl:for-each select="/*/xs:import">
                    <xsl:choose>
                      <xsl:when test="contains(@schemaLocation,'gml')">
                        <xsl:sequence select="'gml'"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:variable name="pathTokens" as="xs:string+" select="tokenize(@schemaLocation,'/')"/>
                        <xsl:variable name="numberOfTokens" select="count($pathTokens)"/>
                        <xsl:sequence select="substring-before(tokenize(@schemaLocation,'/')[$numberOfTokens],'.')"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:variable>
              <td>
                <!-- Imported Namespaces -->
                <xsl:if test="count($namespacePrefixList)">
                  <xsl:value-of select="distinct-values($namespacePrefixList)" separator=", "/>
                </xsl:if>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <hr/>
        <p>
          <font size="small" face="italic">
            <xsl:value-of
              select="concat('Written by ',$TransformName,' Version: ',$TransformVersion, ' at ',current-dateTime())"
            />
          </font>
        </p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
