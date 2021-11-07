<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:oxy="http://www.oxygenxml.com/schematron/validation"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:cal="https://schemas.isotc211.org/19159/-4/cal/1.0"
                xmlns:gco="https://schemas.isotc211.org/19103/-/gco/1.2"
                xmlns:smi="https://schemas.isotc211.org/19130/-3/smi/1.1"
                xmlns:gml="http://www.opengis.net/gml/3.2"
                version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
   <xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri"/>
   <!--PHASES-->
   <!--PROLOG-->
   <xsl:output xmlns:iso="http://purl.oclc.org/dsdl/schematron" method="xml"/>
   <!--XSD TYPES FOR XSLT2-->
   <!--KEYS AND FUNCTIONS-->
   <!--DEFAULT RULES-->
   <!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path"/>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
            <xsl:variable name="p_1"
                          select="1+        count(preceding-sibling::*[name()=name(current())])"/>
            <xsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<xsl:value-of select="$p_1"/>]</xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>']</xsl:text>
            <xsl:variable name="p_2"
                          select="1+        count(preceding-sibling::*[local-name()=local-name(current())])"/>
            <xsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<xsl:value-of select="$p_2"/>]</xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="text()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>text()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::text())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="comment()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>comment()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::comment())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>processing-instruction()</xsl:text>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::processing-instruction())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-2-->
   <!--This mode can be used to generate prefixed XPath for humans-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
   <!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: GENERATE-ID-FROM-PATH -->
   <xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>
   <!--MODE: GENERATE-ID-2 -->
   <xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters-->
   <xsl:template match="text()" priority="-1"/>
   <!--SCHEMA SETUP-->
   <xsl:template match="/">
      <xsl:apply-templates select="/" mode="M5"/>
      <xsl:apply-templates select="/" mode="M6"/>
      <xsl:apply-templates select="/" mode="M7"/>
      <xsl:apply-templates select="/" mode="M8"/>
      <xsl:apply-templates select="/" mode="M9"/>
      <xsl:apply-templates select="/" mode="M11"/>
      <xsl:apply-templates select="/" mode="M12"/>
      <xsl:apply-templates select="/" mode="M13"/>
      <xsl:apply-templates select="/" mode="M14"/>
      <xsl:apply-templates select="/" mode="M15"/>
      <xsl:apply-templates select="/" mode="M16"/>
      <xsl:apply-templates select="/" mode="M18"/>
      <xsl:apply-templates select="/" mode="M19"/>
      <xsl:apply-templates select="/" mode="M20"/>
      <xsl:apply-templates select="/" mode="M22"/>
      <xsl:apply-templates select="/" mode="M23"/>
      <xsl:apply-templates select="/" mode="M25"/>
      <xsl:apply-templates select="/" mode="M26"/>
      <xsl:apply-templates select="/" mode="M27"/>
      <xsl:apply-templates select="/" mode="M28"/>
      <xsl:apply-templates select="/" mode="M30"/>
      <xsl:apply-templates select="/" mode="M31"/>
      <xsl:apply-templates select="/" mode="M32"/>
      <xsl:apply-templates select="/" mode="M34"/>
      <xsl:apply-templates select="/" mode="M35"/>
      <xsl:apply-templates select="/" mode="M36"/>
      <xsl:apply-templates select="/" mode="M37"/>
      <xsl:apply-templates select="/" mode="M39"/>
      <xsl:apply-templates select="/" mode="M40"/>
      <xsl:apply-templates select="/" mode="M41"/>
   </xsl:template>
   <!--SCHEMATRON PATTERNS-->
   <!--PATTERN rule.cal.ta-cantennapatterncalibrationelementTA temperature in Kelvin MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_AntennaPatternCalibration" priority="1000" mode="M5">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:TA) = 1) and (normalize-space(cal:TA) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-exists-cantennapatterncalibration-failure-en]<xsl:text>The element TA MUST exist in CA_AntennaPatternCalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:TA)) &gt;= 0) and (number(normalize-space(cal:TA)) &lt;= 350)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-range-cantennapatterncalibration-success-en]<xsl:text>The TA temperature in Kelvin is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:TA)) &lt; 0) or (number(normalize-space(cal:TA)) &gt; 350)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-range-cantennapatterncalibration-failure-en]<xsl:text>The TA temperature in Kelvin MUST be in the range of 0 to 350.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M5"/>
   <xsl:template match="@*|node()" priority="-2" mode="M5">
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>
   <!--PATTERN rule.cal.satelliteorbitalheight-cantennapatterncalibrationOrbital height MUST be greater than zero.-->
   <!--RULE -->
   <xsl:template match="cal:CA_AntennaPatternCalibration" priority="1000" mode="M6">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:satelliteOrbitalHeight) = 1) and (normalize-space(cal:satelliteOrbitalHeight) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-exists-cantennapatterncalibration-failure-en]<xsl:text>The element satelliteOrbitalHeight MUST exist in CA_AntennaPatternCalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:satelliteOrbitalHeight)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-success-en]<xsl:text>satelliteOrbitalHeight is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:satelliteOrbitalHeight)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-failure-en]<xsl:text>satelliteOrbitalHeight MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M6"/>
   <xsl:template match="@*|node()" priority="-2" mode="M6">
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>
   <!--PATTERN rule.cal.beamwidth-cantennapatterncalibrationBeam width MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_AntennaPatternCalibration" priority="1000" mode="M7">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:beamwidth) = 1) and (normalize-space(cal:beamwidth) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.beamwidth-exists-cantennapatterncalibration-failure-en]<xsl:text>The element beamwidth MUST exist in CA_AntennaPatternCalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:beamwidth)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.beamwidt-range-cantennapatterncalibration-success-en]<xsl:text>beamWidth angle is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:beamwidth)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.beamwidt-range-cantennapatterncalibration-failure-en]<xsl:text>beamWidth angle MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M7"/>
   <xsl:template match="@*|node()" priority="-2" mode="M7">
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <!--PATTERN rule.cal.mainbeamefficiency-cantennapatterncalibrationMain beam efficiency MUST be between 0 and 1.-->
   <!--RULE -->
   <xsl:template match="cal:CA_AntennaPatternCalibration" priority="1000" mode="M8">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:mainBeamEfficiency) = 1) and (normalize-space(cal:mainBeamEfficiency) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-exists-cantennapatterncalibration-failure-en]<xsl:text>The element mainBeamEfficiency MUST exist in CA_AntennaPatternCalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:mainBeamEfficiency)) &gt;= 0) and (number(normalize-space(cal:mainBeamEfficiency)) &lt;= 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-range-cantennapatterncalibration-success-en]<xsl:text>mainBeamEfficiency value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:mainBeamEfficiency)) &lt; 0) or (number(normalize-space(cal:mainBeamEfficiency)) &gt; 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-range-cantennapatterncalibration-failure-en]<xsl:text>mainBeamEfficiency value MUST be in the range of 0 to 1.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M8"/>
   <xsl:template match="@*|node()" priority="-2" mode="M8">
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <!--PATTERN rule.cal.tbwithinscene-cantennapatterncalibrationTB in the scene temperature in Kelvin MUST be in the range of 0 to 350.-->
   <!--RULE -->
   <xsl:template match="cal:CA_AntennaPatternCalibration" priority="1000" mode="M9">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:TBWithinTheScene) = 1) and (normalize-space(cal:TBWithinTheScene) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinscene-exists-cantennapatterncalibration-failure-en]<xsl:text>The element TBWithinTheScene MUST exist in CA_AntennaPatternCalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:TBWithinTheScene)) &gt;= 0) and (number(normalize-space(cal:TBWithinTheScene)) &lt;= 350)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinscene-range-cantennapatterncalibration-success-en]<xsl:text>The TBWithinTheScene temperature in Kelvin is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:TBWithinTheScene)) &lt; 0) or (number(normalize-space(cal:TBWithinTheScene)) &gt; 350)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinscene-range-cantennapatterncalibration-failure-en]<xsl:text>The TBWithinTheScene temperature in Kelvin must be in the range of 0 to 350.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="@*|node()" priority="-2" mode="M9">
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <!--PATTERN rule.cal.centrefrequency-cascfCentre frequency MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M11">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:centreFrequency) = 1) and (normalize-space(cal:centreFrequency) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.centrefrequency-exists-cascf-failure-en]<xsl:text>centreFrequency MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:centreFrequency)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.centrefrequency-range-cascf-success-en]<xsl:text>centreFrequency value in Hertz is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:centreFrequency)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.centrefrequency-range-cascf-failure-en]<xsl:text>centreFrequency value in Hertz MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <!--PATTERN rule.cal.bandwidth-cascfBandwidth MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M12">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:bandwidth) = 1) and (normalize-space(cal:bandwidth) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandwidth-exists-cascf-failure-en]<xsl:text>bandWidth MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:bandwidth)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandwidth-range-cascf-success-en]<xsl:text>bandWidth value in Hertz is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:bandwidth)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandwidth-range-cascf-failure-en]<xsl:text>bandWidth value in Hertz MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <!--PATTERN rule.cal.usblimit-cascfUSB limit MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M13">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:USBLimit) = 1) and (normalize-space(cal:USBLimit) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.usblimit-exists-cascf-failure-en]<xsl:text>The element USBLimit MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:USBLimit)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.usblimit-range-cascf-success-en]<xsl:text>USBLimit is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:USBLimit)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.usblimit-range-cascf-failure-en]<xsl:text>USBLimit MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <!--PATTERN rule.cal.lsblimit-cascfLSB limit MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M14">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:LSBLimit) = 1) and (normalize-space(cal:LSBLimit) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.lsblimit-exists-cascf-failure-en]<xsl:text>The element LSBLimit MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:LSBLimit)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.lsblimit-range-cascf-success-en]<xsl:text>LSBLimit is valid.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:LSBLimit)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.lsblimit-range-cascf-failure-en]<xsl:text>LSBLimit MUST be greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="@*|node()" priority="-2" mode="M14">
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <!--PATTERN rule.cal.mainbeamefficiency-cascfMain beam efficiency MUST be in the range of 0 to 1.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M15">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:mainBeamEfficiency) = 1) and (normalize-space(cal:mainBeamEfficiency) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-exists-cascf-failure-en]<xsl:text>The element mainBeamEfficiency MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:mainBeamEfficiency)) &gt;= 0) and (number(normalize-space(cal:mainBeamEfficiency)) &lt;= 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-range-cascf-success-en]<xsl:text>mainBeamEfficiency value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:mainBeamEfficiency)) &lt; 0) or (number(normalize-space(cal:mainBeamEfficiency)) &gt; 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.mainbeamefficiency-range-cascf-failure-en]<xsl:text>mainBeamEfficiency value MUST be in the range of 0 to 1.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="@*|node()" priority="-2" mode="M15">
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <!--PATTERN rule.cal.nonlinearitycoefficient-cascfNon-linearity coefficient MUST be between 0 and 1.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SCF" priority="1000" mode="M16">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:nonlinearityCoefficient) = 1) and (normalize-space(cal:nonlinearityCoefficient) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-exists-cascf-failure-en]<xsl:text>The element nonlinearityCoefficient MUST exist in CA_SCF.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:nonlinearityCoefficient)) &gt;= 0) and (number(normalize-space(cal:nonlinearityCoefficient)) &lt;= 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-range-cascf-success-en]<xsl:text>nonlinearityCoefficient value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:nonlinearityCoefficient)) &lt; 0) or (number(normalize-space(cal:nonlinearityCoefficient)) &gt; 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-range-cascf-failure-en]<xsl:text>nonlinearityCoefficient value MUST be in the range of 0 to 1.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="@*|node()" priority="-2" mode="M16">
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <!--PATTERN rule.cal.satelliteorbitalheight-casatelliteattachmentinformationSatellite orbital height MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SatelliteAttachmentInformation"
                 priority="1000"
                 mode="M18">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:satelliteOrbitalHeight) = 1) and (normalize-space(cal:satelliteOrbitalHeight) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-exists-casatelliteattachmentinformation-failure-en]<xsl:text>The element satelliteOrbitalHeight MUST exist in CA_SatelliteAttachmentInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:satelliteOrbitalHeight)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-success-en]<xsl:text>satelliteOrbitalHeight value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:satelliteOrbitalHeight)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-failure-en]<xsl:text>satelliteOrbitalHeight value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="@*|node()" priority="-2" mode="M18">
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <!--PATTERN rule.cal.latitudeofmeasurement-casatelliteattachmentinformationLatitude of measurement MUST be between -90 and 90.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SatelliteAttachmentInformation"
                 priority="1000"
                 mode="M19">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:latitudeOfMeasurement) = 1) and (normalize-space(cal:latitudeOfMeasurement) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.latitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en]<xsl:text>The element latitudeOfMeasurement MUST exist in CA_SatelliteAttachmentInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:latitudeOfMeasurement)) &gt;= -90) and (number(normalize-space(cal:latitudeOfMeasurement)) &lt;= 90)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-success-en]<xsl:text>latitudeOfMeasurement value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:latitudeOfMeasurement)) &lt; -90) or (number(normalize-space(cal:latitudeOfMeasurement)) &gt; 90)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-failure-en]<xsl:text>latitudeOfMeasurement value MUST be in the range of -90 to 90.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M19"/>
   <xsl:template match="@*|node()" priority="-2" mode="M19">
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <!--PATTERN rule.cal.longitudeofmeasurement-casatelliteattachmentinformationLongitude of measurement MUST be between -180 and 180.-->
   <!--RULE -->
   <xsl:template match="cal:CA_SatelliteAttachmentInformation"
                 priority="1000"
                 mode="M20">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:longitudeOfMeasurement) = 1) and (normalize-space(cal:longitudeOfMeasurement) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.longitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en]<xsl:text>The element longitudeOfMeasurement MUST exist in CA_SatelliteAttachmentInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:longitudeOfMeasurement)) &gt;= -180) and (number(normalize-space(cal:longitudeOfMeasurement)) &lt;= 180)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-success-en]<xsl:text>longitudeOfMeasurement value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:longitudeOfMeasurement)) &lt; -180) or (number(normalize-space(cal:longitudeOfMeasurement)) &gt; 180)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-failure-en]<xsl:text>longitudeOfMeasurement value MUST be in the range of -180 to 180.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M20"/>
   <xsl:template match="@*|node()" priority="-2" mode="M20">
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <!--PATTERN rule.cal.frequency-cabandresponsefunctionFrequency MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_BandResponseFunction" priority="1000" mode="M22">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:frequency) = 1) and (normalize-space(cal:frequency) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.frequency-exists-cabandresponsefunction-failure-en]<xsl:text>The element frequency MUST exist in CA_BandResponseFunction.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:frequency)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.frequency-range-cabandresponsefunction-success-en]<xsl:text>frequency value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:frequency)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.frequency-range-cabandresponsefunction-failure-en]<xsl:text>frequency value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M22"/>
   <xsl:template match="@*|node()" priority="-2" mode="M22">
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <!--PATTERN rule.cal.bandresponse-cabandresponsefunctionBand response MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_BandResponseFunction" priority="1000" mode="M23">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:bandResponse) = 1) and (normalize-space(cal:bandResponse) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandresponse-exists-cabandresponsefunction-failure-en]<xsl:text>The element bandResponse MUST exist in CA_BandResponseFunction.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:bandResponse)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandresponse-range-cabandresponsefunction-success-en]<xsl:text>bandResponse value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:bandResponse)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.bandresponse-range-cabandresponsefunction-failure-en]<xsl:text>bandResponse value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M23"/>
   <xsl:template match="@*|node()" priority="-2" mode="M23">
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <!--PATTERN rule.cal.microwaveradiometerviewingangle-cageometricpositionMicrowave radiometer viewing angle MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_GeometricPosition" priority="1000" mode="M25">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:microwaveRadiometerViewingAngle) = 1) and (normalize-space(cal:microwaveRadiometerViewingAngle) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerviewingangle-exists-cageometricposition-failure-en]<xsl:text>The element microwaveRadiometerViewingAngle MUST exist in CA_GeometricPosition.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerViewingAngle)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerviewingangle-range-cageometricposition-success-en]<xsl:text>microwaveRadiometerViewingAngle value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerViewingAngle)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerviewingangle-range-cageometricposition-failure-en]<xsl:text>microwaveRadiometerViewingAngle value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M25"/>
   <xsl:template match="@*|node()" priority="-2" mode="M25">
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <!--PATTERN rule.cal.microwaveradiometerincidentangle-cageometricpositionMicrowave radiometer incident angle MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_GeometricPosition" priority="1000" mode="M26">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:microwaveRadiometerIncidentAngle) = 1) and (normalize-space(cal:microwaveRadiometerIncidentAngle) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerincidentangle-exists-cageometricposition-failure-en]<xsl:text>The element microwaveRadiometerIncidentAngle MUST exist in CA_GeometricPosition.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerIncidentAngle)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerincidentangle-range-cageometricposition-success-en]<xsl:text>microwaveRadiometerIncidentAngle value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerIncidentAngle)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerincidentangle-range-cageometricposition-failure-en]<xsl:text>microwaveRadiometerIncidentAngle value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <!--PATTERN rule.cal.microwaveradiometerpixelsize-cageometricpositionMicrowave radiometer pixel size MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_GeometricPosition" priority="1000" mode="M27">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:microwaveRadiometerPixelSize) = 1) and (normalize-space(cal:microwaveRadiometerPixelSize) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerpixelsize-exists-cageometricposition-failure-en]<xsl:text>The element microwaveRadiometerPixelSize MUST exist in CA_GeometricPosition.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerPixelSize)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerpixelsize-range-cageometricposition-success-en]<xsl:text>microwaveRadiometerPixelSize value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerPixelSize)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerpixelsize-range-cageometricposition-failure-en]<xsl:text>microwaveRadiometerPixelSize value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <!--PATTERN rule.cal.microwaveradiometerobservationinterval-cageometricpositionMicrowave radiometer observation interval MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_GeometricPosition" priority="1000" mode="M28">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:microwaveRadiometerObservationInterval) = 1) and (normalize-space(cal:microwaveRadiometerObservationInterval) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerobservationinterval-exists-cageometricposition-failure-en]<xsl:text>The element microwaveRadiometerObservationInterval MUST exist in CA_GeometricPosition.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerObservationInterval)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-success-en]<xsl:text>microwaveRadiometerObservationInterval value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:microwaveRadiometerObservationInterval)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-failure-en]<xsl:text>microwaveRadiometerObservationInterval value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <!--PATTERN rule.cal.receivertemperature-catacalibrationMicrowave radiometer observation interval MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TACalibration" priority="1000" mode="M30">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:receiverTemperature) = 1) and (normalize-space(cal:receiverTemperature) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.receivertemperature-exists-catacalibration-failure-en]<xsl:text>The element receiverTemperature MUST exist in CA_TACalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:receiverTemperature)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.receivertemperature-range-catacalibration-success-en]<xsl:text>receiverTemperature value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:receiverTemperature)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.receivertemperature-range-catacalibration-failure-en]<xsl:text>receiverTemperature value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M30"/>
   <xsl:template match="@*|node()" priority="-2" mode="M30">
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <!--PATTERN rule.cal.nonlinearitycoefficient-catacalibrationNon-linearity coefficient MUST be between 0 and 1.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TACalibration" priority="1000" mode="M31">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:nonlinearityCoefficient) = 1) and (normalize-space(cal:nonlinearityCoefficient) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-exists-catacalibration-failure-en]<xsl:text>The element nonlinearityCoefficient MUST exist in CA_TACalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:nonlinearityCoefficient)) &gt;= 0) and (number(normalize-space(cal:nonlinearityCoefficient)) &lt;= 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-range-catacalibration-success-en]<xsl:text>nonlinearityCoefficient value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="(number(normalize-space(cal:nonlinearityCoefficient)) &lt; 0) or (number(normalize-space(cal:nonlinearityCoefficient)) &gt; 1)">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.nonlinearitycoefficient-range-catacalibration-failure-en]<xsl:text>nonlinearityCoefficient value MUST be in the range of 0 to 1.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M31"/>
   <xsl:template match="@*|node()" priority="-2" mode="M31">
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <!--PATTERN rule.cal.ta-catacalibrationTA interval MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TACalibration" priority="1000" mode="M32">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:TA) = 1) and (normalize-space(cal:TA) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-exists-catacalibration-failure-en]<xsl:text>The element TA MUST exist in CA_TACalibration.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TA)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-range-catacalibration-success-en]<xsl:text>TA value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TA)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.ta-range-catacalibration-failure-en]<xsl:text>TA value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M32"/>
   <xsl:template match="@*|node()" priority="-2" mode="M32">
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <!--PATTERN rule.cal.targettb-catargettbinformationTarget TB MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TargetTBInformation" priority="1000" mode="M34">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:targetTB) = 1) and (normalize-space(cal:targetTB) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettb-exists-catargettbinformation-failure-en]<xsl:text>The element targetTB MUST exist in CA_TargetTBInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTB)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettb-range-catargettbinformation-success-en]<xsl:text>targetTB value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTB)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettb-range-catargettbinformation-failure-en]<xsl:text>targetTB value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M34"/>
   <xsl:template match="@*|node()" priority="-2" mode="M34">
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <!--PATTERN rule.cal.targettbbias-catargettbinformationTarget TB bias MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TargetTBInformation" priority="1000" mode="M35">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:targetTBBias) = 1) and (normalize-space(cal:targetTBBias) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbbias-exists-catargettbinformation-failure-en]<xsl:text>The element targetTBBias MUST exist in CA_TargetTBInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBBias)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbbias-range-catargettbinformation-success-en]<xsl:text>targetTBBias value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBBias)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbbias-range-catargettbinformation-failure-en]<xsl:text>targetTBBias value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M35"/>
   <xsl:template match="@*|node()" priority="-2" mode="M35">
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <!--PATTERN rule.cal.targettbuncertainty-catargettbinformationTarget TB uncertainty MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TargetTBInformation" priority="1000" mode="M36">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:targetTBUncertainty) = 1) and (normalize-space(cal:targetTBUncertainty) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbuncertainty-exists-catargettbinformation-failure-en]<xsl:text>The element targetTBUncertainty MUST exist in CA_TargetTBInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBUncertainty)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbuncertainty-range-catargettbinformation-success-en]<xsl:text>targetTBUncertainty value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBUncertainty)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbuncertainty-range-catargettbinformation-failure-en]<xsl:text>targetTBUncertainty value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M36"/>
   <xsl:template match="@*|node()" priority="-2" mode="M36">
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <!--PATTERN rule.cal.targettbvoltage-catargettbinformationTarget TB voltage MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TargetTBInformation" priority="1000" mode="M37">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:targetTBVoltage) = 1) and (normalize-space(cal:targetTBVoltage) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbvoltage-exists-catargettbinformation-failure-en]<xsl:text>The element targetTBVoltage MUST exist in CA_TargetTBInformation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBVoltage)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbvoltage-range-catargettbinformation-success-en]<xsl:text>targetTBVoltage value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:targetTBVoltage)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.targettbvoltage-range-catargettbinformation-failure-en]<xsl:text>targetTBVoltage value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M37"/>
   <xsl:template match="@*|node()" priority="-2" mode="M37">
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <!--PATTERN rule.cal.tbwithinthescene-catbcalibrationvalidationTB within the scene MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TBCalibrationValidation" priority="1000" mode="M39">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:TBWithinTheScene) = 1) and (normalize-space(cal:TBWithinTheScene) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinthescene-exists-catbcalibrationvalidation-failure-en]<xsl:text>The element TBWithinTheScene MUST exist in CA_TBCalibrationValidation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TBWithinTheScene)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinthescene-range-catbcalibrationvalidation-success-en]<xsl:text>TBWithinTheScene value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TBWithinTheScene)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbwithinthescene-range-catbcalibrationvalidation-failure-en]<xsl:text>TBWithinTheScene value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M39"/>
   <xsl:template match="@*|node()" priority="-2" mode="M39">
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <!--PATTERN rule.cal.tbcalibrationstandarddeviation-catbcalibrationvalidationTB calibration standard deviation MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TBCalibrationValidation" priority="1000" mode="M40">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:TBCalibrationStandardDeviation) = 1) and (normalize-space(cal:TBCalibrationStandardDeviation) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbcalibrationstandarddeviation-exists-catbcalibrationvalidation-failure-en]<xsl:text>The element TBCalibrationStandardDeviation MUST exist in CA_TBCalibrationValidation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TBCalibrationStandardDeviation)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-success-en]<xsl:text>TBCalibrationStandardDeviation value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:TBCalibrationStandardDeviation)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-failure-en]<xsl:text>TBCalibrationStandardDeviation value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M40"/>
   <xsl:template match="@*|node()" priority="-2" mode="M40">
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <!--PATTERN rule.cal.recalibratedtb-catbcalibrationvalidationRe-calibrated TB MUST be greater than 0.-->
   <!--RULE -->
   <xsl:template match="cal:CA_TBCalibrationValidation" priority="1000" mode="M41">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(count(cal:reCalibratedTB) = 1) and (normalize-space(cal:reCalibratedTB) != '')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.recalibratedtb-exists-catbcalibrationvalidation-failure-en]<xsl:text>The element reCalibratedTB MUST exist in CA_TBCalibrationValidation.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:reCalibratedTB)) &gt; 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.recalibratedtb-range-catbcalibrationvalidation-success-en]<xsl:text>reCalibratedTB value is within the valid range.</xsl:text>
         </xsl:message>
      </xsl:if>
      <!--REPORT -->
      <xsl:if test="number(normalize-space(cal:reCalibratedTB)) &lt;= 0">
         <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">[#rule.cal.recalibratedtb-range-catbcalibrationvalidation-failure-en]<xsl:text>reCalibratedTB value MUST greater than 0.</xsl:text>
         </xsl:message>
      </xsl:if>
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
</xsl:stylesheet>
