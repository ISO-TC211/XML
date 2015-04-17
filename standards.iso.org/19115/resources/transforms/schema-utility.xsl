<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  
  
  <xsl:template name="add-iso19115-3-namespaces">
    <!-- new namespaces -->
    <xsl:namespace name="xsi" select="'http://www.w3.org/2001/XMLSchema-instance'"/>
    <!-- Namespaces that include concepts outside of metadata -->
    <!-- Catalog (ISO 19115-3) -->
    <xsl:namespace name="cat" select="'http://www.isotc211.org/namespace/cat/1.0/2014-07-11'"/>
    <!-- Citation (ISO 19115-3) -->
    <xsl:namespace name="cit" select="'http://www.isotc211.org/namespace/cit/1.0/2014-07-11'"/>
    <!-- Geospatial Common eXtension (ISO 19115-3) -->
    <xsl:namespace name="gcx" select="'http://www.isotc211.org/namespace/gcx/1.0/2014-07-11'"/>
    <!-- Geospatial EXtent (ISO 19115-3) -->
    <xsl:namespace name="gex" select="'http://www.isotc211.org/namespace/gex/1.0/2014-07-11'"/>
    <!-- Language Localization (ISO 19115-3) -->
    <xsl:namespace name="lan" select="'http://www.isotc211.org/namespace/lan/1.0/2014-07-11'"/>
    <!-- Metadata for Services (ISO 19115-3) -->
    <xsl:namespace name="srv" select="'http://www.isotc211.org/namespace/srv/2.0/2014-07-11'"/>
    <!-- Metadata for Application Schema (ISO 19115-3) -->
    <xsl:namespace name="mas" select="'http://www.isotc211.org/namespace/mas/1.0/2014-07-11'"/>
    <!-- Metadata for Common Classes (ISO 19115-3) -->
    <xsl:namespace name="mcc" select="'http://www.isotc211.org/namespace/mcc/1.0/2014-07-11'"/>
    <!-- Metadata for COnstraints (ISO 19115-3) -->
    <xsl:namespace name="mco" select="'http://www.isotc211.org/namespace/mco/1.0/2014-07-11'"/>
    <!-- MetaData Application (ISO 19115-3) -->
    <xsl:namespace name="mda" select="'http://www.isotc211.org/namespace/mda/1.0/2014-07-11'"/>
    <!-- MetaDataBase (ISO 19115-3) -->
    <xsl:namespace name="mdb" select="'http://www.isotc211.org/namespace/mdb/1.0/2014-07-11'"/>
    <!-- Metadata for Data and Services (ISO 19115-3) -->
    <xsl:namespace name="mds" select="'http://www.isotc211.org/namespace/mds/1.0/2014-07-11'"/>
    <!-- Metadata based Data Transfer (ISO 19115-3) -->
    <xsl:namespace name="mdt" select="'http://www.isotc211.org/namespace/mdt/1.0/2014-07-11'"/>
    <!-- Metadata for EXtensions (ISO 19115-3) -->
    <xsl:namespace name="mex" select="'http://www.isotc211.org/namespace/mex/1.0/2014-07-11'"/>
    <!-- Metadata for Maintenance Information (ISO 19115-3) -->
    <xsl:namespace name="mmi" select="'http://www.isotc211.org/namespace/mmi/1.0/2014-07-11'"/>
    <!-- Metadata for Portrayal Catalog (ISO 19115-3) -->
    <xsl:namespace name="mpc" select="'http://www.isotc211.org/namespace/mpc/1.0/2014-07-11'"/>
    <!-- Metadata for Resource Content (ISO 19115-3) -->
    <xsl:namespace name="mrc" select="'http://www.isotc211.org/namespace/mrc/1.0/2014-07-11'"/>
    <!-- Metadata for Resource Distribution (ISO 19115-3) -->
    <xsl:namespace name="mrd" select="'http://www.isotc211.org/namespace/mrd/1.0/2014-07-11'"/>
    <!-- Metadata for Resource Identification (ISO 19115-3) -->
    <xsl:namespace name="mri" select="'http://www.isotc211.org/namespace/mri/1.0/2014-07-11'"/>
    <!-- Metadata for Resource Lineage (ISO 19115-3) -->
    <xsl:namespace name="mrl" select="'http://www.isotc211.org/namespace/mrl/1.0/2014-07-11'"/>
    <!-- Metadata for Reference System (ISO 19115-3) -->
    <xsl:namespace name="mrs" select="'http://www.isotc211.org/namespace/mrs/1.0/2014-07-11'"/>
    <!-- Metadata for Spatial Representation (ISO 19115-3) -->
    <xsl:namespace name="msr" select="'http://www.isotc211.org/namespace/msr/1.0/2014-07-11'"/>
    <!-- Data Quality Measures (ISO 19157-2) -->
    <xsl:namespace name="mdq" select="'http://www.isotc211.org/namespace/mdq/1.0/2014-07-11'"/>
    <!-- Metadata for Data Quality (ISO 19157-2) -->
    <xsl:namespace name="mdq" select="'http://www.isotc211.org/namespace/mdq/1.0/2014-07-11'"/>
    <!-- Metadata for Acquisition (ISO 19115-4) -->
    <xsl:namespace name="mac" select="'http://www.isotc211.org/namespace/mac/1.0/2014-07-11'"/>
    <!-- Metadata for Acquisition and Imagery (ISO 19115-4) -->
    <xsl:namespace name="mai" select="'http://www.isotc211.org/namespace/mai/1.0/2014-07-11'"/>
    <!-- Metadata for Image Content (ISO 19115-4) -->
    <xsl:namespace name="mic" select="'http://www.isotc211.org/namespace/mic/1.0/2014-07-11'"/>
    <!-- Metadata for Image Lineage (ISO 19115-4) -->
    <xsl:namespace name="mil" select="'http://www.isotc211.org/namespace/mil/1.0/2014-07-11'"/>
    <!-- other ISO namespaces -->
    <!-- Geospatial COmmon -->
    <xsl:namespace name="gco" select="'http://www.isotc211.org/2005/gco'"/>
    <!-- external namespaces -->
    <xsl:namespace name="gml" select="'http://www.opengis.net/gml/3.2'"/>
    <xsl:namespace name="xlink" select="'http://www.w3.org/1999/xlink'"/>
  </xsl:template>
</xsl:stylesheet>