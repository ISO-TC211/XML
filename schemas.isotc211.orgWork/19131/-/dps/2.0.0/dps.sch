<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="dps" uri="https://schemas.isotc211.org/19131/-/dps/2.0"/>
    <sch:ns prefix="mdq" uri="https://schemas.isotc211.org/19157/-/mdq/1.2"/>
 
    <!--
    ISO 19131 Edition 2 - base requirements for data product specifications
  -->
     <!-- 
    Rule: SpecificationScope
    Ref: {count(level + extent + coverageName) > 0}
    -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.dps.SpecificationScope.levelORextentORcoverageName-failure-en"
            xml:lang="en">The specification scope does not have a level or an extent or coverageName.</sch:diagnostic>
        <sch:diagnostic id="rule.dps.SpecificationScope.levelORextentORcoverageName-failure-fr"
            xml:lang="fr">La portee de la specification n'a pas de niveau, d'etendue ou de nom de couverture.</sch:diagnostic>
        
      <!--  <sch:diagnostic id="rule.dps.SpecificationScope.levelORextentORcoverageName-success-en"
            xml:lang="en">the level is  
            "<sch:value-of select="normalize-space($level)"/>"
            and the extent is
            "<sch:value-of select="normalize-space($extent)"/>"
            and coverageName is
            "<sch:value-of select="normalize-space($coverageName)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.dps.SpecificationScope.levelORextentORcoverageName-success-fr"
            xml:lang="fr">le niveau est  
            "<sch:value-of select="normalize-space($level)"/>"
             et l'étendue est 
            "<sch:value-of select="normalize-space($position)"/>"
            et le nom de couverture est
            "<sch:value-of select="normalize-space($coverageName)"/>"
            .</sch:diagnostic>
      -->
    </sch:diagnostics>
 
    <sch:pattern id="rule.dps.SpecificationScope.levelORextentORcoverageName">
        <sch:title xml:lang="en">SpecificScope MUST have a level OR an extent OR a coverageName</sch:title>
        <sch:title xml:lang="fr">SpecificScope DOIT avoir un niveau OU une étendue OU un nom de couverture</sch:title>
        
        <sch:rule context="//dps:SpecificationScope">
            
            <sch:let name="level" value="dps:level"/>
            <sch:let name="levelAttribute" value="dps:level/@*"/>
            <sch:let name="extent" value="dps:extent"/>
            <sch:let name="extentAttribute" value="dps:extent/@*"/>
            <sch:let name="coverageName" value="dps:coverageName"/>
            <sch:let name="coverageNameAttribute" value="dps:coverageName/@*"/>
            <sch:let name="hasLevel" 
                value="concat(normalize-space($level),$levelAttribute) != ''"/>
            <sch:let name="hasExtent" 
                value="concat(normalize-space($extent),$extentAttribute) != ''"/>
            <sch:let name="hasCoverageName" 
                value="concat(normalize-space($coverageName),$coverageNameAttribute) != ''"/>
            
            <sch:assert test="$hasLevel or $hasExtent or $hasCoverageName"
                diagnostics="rule.dps.SpecificationScope.levelORextentORcoverageName-failure-en 
                rule.dps.SpecificationScope.levelORextentORcoverageName-failure-fr"/>
            
            <!-- <sch:report test="$hasLevel or $hasExtent or $hasCoverageName"
                diagnostics="rule.dps.SpecificationScope.levelORextentORcoverageName-success-en 
                rule.dps.SpecificationScope.levelORextentORcoverageName-success-fr"/> -->
        </sch:rule>
    </sch:pattern>
     
    <!-- 
    Rule: DataContentAndStructure
    Ref: {count(applicationSchema + contentInformation) > 0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-failure-en"
            xml:lang="en">The DataContentAndStructure does not have an applicationSchema or a contentInformation.</sch:diagnostic>
        <sch:diagnostic id="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-failure-fr"
            xml:lang="fr">Le DataContentAndStructure n'a pas de applicationSchema ou de contentInformation.</sch:diagnostic>
        
   <!--      <sch:diagnostic id="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-success-en"
            xml:lang="en">DataContentAndStructure applicationSchema is  
            "<sch:value-of select="normalize-space($applicationSchema)"/>"
            and contentInformation is 
            "<sch:value-of select="normalize-space($contentInformation)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-success-fr"
            xml:lang="fr">Le applicationSchema est  
            "<sch:value-of select="normalize-space($applicationSchema)"/>"
            , son dps:contentInformation est
            "<sch:value-of select="normalize-space($contentInformation)"/>"
            .</sch:diagnostic>
   -->
    </sch:diagnostics>
    
    <sch:pattern id="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation">
        <sch:title xml:lang="en">DataContentAndStructure MUST have an applicationSchema or a contentInformation</sch:title>
        <sch:title xml:lang="fr">DataContentAndStructure DOIT avoir un applicationSchema ou un contentInformation</sch:title>
        
        <sch:rule context="//dps:DataContentAndStructure">
            
            <sch:let name="applicationSchema" value="dps:applicationSchema"/>
            <sch:let name="applicationSchemaAttribute" value="dps:applicationSchema/@*"/>
            <sch:let name="hasApplicationSchema" value="concat(normalize-space($applicationSchema),normalize-space($applicationSchemaAttribute)) != ''"/>
            <sch:let name="contentInformation" value="dps:contentInformation"/>
            <sch:let name="contentInformationAttribute" value="dps:contentInformation/@*"/>
            <sch:let name="hasContentInformation" value="concat(normalize-space($contentInformation), normalize-space($contentInformationAttribute)) != ''"/>
             <sch:assert test="$hasApplicationSchema or $hasContentInformation"    
                
                diagnostics="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-failure-en 
                rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-failure-fr"/>
            
            <!--  <sch:report test="$hasapplicationSchema or $hascontentInformation"
                diagnostics="rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-success-en 
                rule.dps.DataContentAndStructure.applicationSchemaORcontentInformation-success-fr"/> -->
        </sch:rule>
    </sch:pattern>
    
    <!-- 
    Rule: ConformanceQualityLevel
    Ref: {count(element//result.DQ_ConformanceResult)=0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-failure-en"
            xml:lang="en">The ConformanceQualityLevel element has an result of type DQ_ConformanceResult.</sch:diagnostic>
        <sch:diagnostic id="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-failure-fr"
            xml:lang="fr">L'element ConformanceQualityLevel a un resultat de type DQ_Conformance.</sch:diagnostic>
 
 <!--
        <sch:diagnostic id="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-success-en"
            xml:lang="en">DQ_ConformanceResult is  
            "<sch:value-of select="normalize-space($DQ_ConformanceResult)"/>"
             .</sch:diagnostic>
        <sch:diagnostic id="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-success-fr"
            xml:lang="fr">DQ_ConformanceResult est  
            "<sch:value-of select="normalize-space($DQ_ConformanceResult)"/>"
             .</sch:diagnostic>
  -->
    </sch:diagnostics>

        
    <sch:pattern id="rule.dps.rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult">
        <sch:title xml:lang="en">ConformanceQualityLevel element MUST NOT have a result of type DQ_Conformance</sch:title>
        <sch:title xml:lang="fr">L'élément ConformanceQualityLevel NE DOIT PAS avoir un résultat de type DQ_Conformance</sch:title>
        
        <sch:rule context="//dps:ConformanceQualityLevel/dps:element//mdq:result/mdq:DQ_ConformanceResult">
            
            <sch:let name="DQ_ConformanceResult" value="."/>
            <sch:let name="hasDQ_ConformanceResult" 
                value="normalize-space($DQ_ConformanceResult) != ''"/>
             
            <sch:assert test="$hasDQ_ConformanceResult"
                diagnostics="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-failure-en 
                rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-failure-fr"/>
            
            <!-- <sch:report test="$hasDQ_ConformanceResult"
                diagnostics="rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-success-en 
                rule.dps.ConformanceQualityLevel.element.result.NOTDQ_ConformanceResult-success-fr"/> -->
        </sch:rule>
    </sch:pattern>
</sch:schema>