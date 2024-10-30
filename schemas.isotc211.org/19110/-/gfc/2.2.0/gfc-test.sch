<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    <sch:ns prefix="fcc" uri="https://schemas.isotc211.org/19110/-/fcc/2.2"/> 
    <sch:ns prefix="gfc" uri="https://schemas.isotc211.org/19110/-/gfc/2.2"/>
    <sch:ns prefix="gco" uri="https://schemas.isotc211.org/19103/-/gco/1.2"/>
    <sch:ns prefix="cat" uri="https://schemas.isotc211.org/19139/-/cat/1.2"/> 
     
    <!-- 
    Rule: FC_FeatureOperation.observedValueOf
    Ref: {count observesValueOf = count observedValueOf/FC_FeatureAttribute + count observedValueOf/FC_BoundFeatureAttribute}
    -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatOp.obsVal-failure-en"
            xml:lang="en">The observed value of a Feature Operation is neither a Feature Attribute nor a Bound Feature Attribute.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.obsVal-failure-fr"
            xml:lang="fr">La valeur observée d'une Feature Operation n'est ni un Feature Attribute ni un Bound Feature Attribute.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatOp.obsVal-success-en"
            xml:lang="en">The observed value of a Feature Operation is  
            "<sch:value-of select="normalize-space($obsVal)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.obsVal-success-fr"
            xml:lang="fr">
            La valeur observée d'une Feature Operation est  
            "<sch:value-of select="normalize-space($obsVal)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatOp.obsVal">
        <sch:title xml:lang="en">The observed value of a Feature Operation MUST be either a Feature Attribute or a Bound Feature Attribute.</sch:title>
        <sch:title xml:lang="fr">La valeur observée d'une Feature Operation DOIT être soit un Feature Attribute soit un Bound Feature Attribute.</sch:title>
        
        <sch:rule context="//gfc:FC_FeatureOperation">
            
            <sch:let name="obsVal" value="gfc:observedValueOf"/>
            <sch:let name="obsVal.FA" value="gfc:observedValueOf/gfc:FC_FeatureAttribute"/>
            <sch:let name="obsVal.BFA" value="gfc:observedValueOf/gfc:FC_BoundFeatureAttribute"/>
            <sch:let name="has_obsVal.FA" 
                value="normalize-space($obsVal.FA) != ''"/>
            <sch:let name="has_obsVal.BFA" 
                value="normalize-space($obsVal.BFA) != ''"/>
            
            <sch:assert test="$has_obsVal.FA or $has_obsVal.BFA"
                diagnostics="rule.gfc.FeatOp.obsVal-failure-en 
                rule.gfc.FeatOp.obsVal-failure-fr"/>
            
            <sch:report test="$has_obsVal.FA or $has_obsVal.BFA"
                diagnostics="rule.gfc.FeatOp.obsVal-success-en 
                rule.gfc.FeatOp.obsVal-success-fr"/>
        </sch:rule>
    </sch:pattern>
    <!-- 
    Rule: FC_FeatureOperation.affectsValueOf
    Ref: {count affectsValueOf = count affectsValueOf/FC_FeatureAttribute + count affectsValueOf/FC_BoundFeatureAttribute}
    -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatOp.affVal-failure-en"
            xml:lang="en">The affected value of a FeatureOperation is neither a FeatureAttribute nor a BoundFeatureAttribute.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.affVal-failure-fr"
            xml:lang="fr">La valeur affectée d'une FeatureOperation n'est ni un FeatureAttribute ni un BoundFeatureAttribute</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatOp.affVal-success-en"
            xml:lang="en">The affected value of a FeatureOperation is  
            "<sch:value-of select="normalize-space($affVal)"/>".</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.affVal-success-fr"
            xml:lang="fr">
            La valeur affectée d'une FeatureOperation est  
            "<sch:value-of select="normalize-space($affVal)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatOp.affVal">
        <sch:title xml:lang="en">The affected value of a FeatureOperation MUST be either a FeatureAttribute or a BoundFeatureAttribute.</sch:title>
        <sch:title xml:lang="fr">La valeur affectée d'une FeatureOperation DOIT être soit un FeatureAttribute soit un BoundFeatureAttribute.</sch:title>
        
        <sch:rule context="//gfc:FC_FeatureOperation">
            
            <sch:let name="affVal" value="gfc:affectsValueOf"/>
            <sch:let name="affVal.FA" value="gfc:affectsValueOf/gfc:FC_FeatureAttribute"/>
            <sch:let name="affVal.BFA" value="gfc:affectsValueOf/gfc:FC_BoundFeatureAttribute"/>
            <sch:let name="has_affVal.FA" 
                value="normalize-space($affVal.FA) != ''"/>
            <sch:let name="has_affVal.BFA" 
                value="normalize-space($affVal.BFA) != ''"/>
            
            <sch:assert test="$has_affVal.FA or $has_affVal.BFA"
                diagnostics="rule.gfc.FeatOp.affVal-failure-en 
                rule.gfc.FeatOp.affVal-failure-fr"/>
            
            <sch:report test="$has_affVal.FA or $has_affVal.BFA"
                diagnostics="rule.gfc.FeatOp.affVal-success-en 
                rule.gfc.FeatOp.affVal-success-fr"/>
        </sch:rule>
    </sch:pattern>
    <!-- 
    Rule: FC_FeatureOperation.triggeredByValueOf
    Ref: {count triggeredByValueOf = count triggeredByValueOf/FC_FeatureAttribute + count triggeredByValueOf/FC_BoundFeatureAttribute}
    -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatOp.trigVal-failure-en"
            xml:lang="en">The value was triggered by neither a FeatureAttribute nor a BoundFeatureAttribute.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.trigVal-failure-fr"
            xml:lang="fr">La valeur n'a été déclenchée ni par un FeatureAttribute ni par un BoundFeatureAttribute.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatOp.trigVal-success-en"
            xml:lang="en">The triggeredBy value of a FeatureOperation is  
            "<sch:value-of select="normalize-space($trigVal)"/>".</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatOp.trigVal-success-fr"
            xml:lang="fr">
            La valeur déclenchée par une FeatureOperation est  
            "<sch:value-of select="normalize-space($trigVal)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatOp.trigVal">
        <sch:title xml:lang="en">A value must be triggered by either a FeatureAttribute or a BoundFeatureAttribute.</sch:title>
        <sch:title xml:lang="fr">Une valeur doit être déclenchée soit par un Feature Attribute soit par un BoundFeatureAttribute.</sch:title>
        
        <sch:rule context="//gfc:FC_FeatureOperation">
            
            <sch:let name="trigVal" value="gfc:triggeredByValueOf"/>
            <sch:let name="trigVal.FA" value="gfc:triggeredByValueOf/gfc:FC_FeatureAttribute"/>
            <sch:let name="trigVal.BFA" value="gfc:triggeredByValueOf/gfc:FC_BoundFeatureAttribute"/>
            <sch:let name="has_trigVal.FA" 
                value="normalize-space($trigVal.FA) != ''"/>
            <sch:let name="has_trigVal.BFA" 
                value="normalize-space($trigVal.BFA) != ''"/>
            
            <sch:assert test="$has_trigVal.FA or $has_trigVal.BFA"
                diagnostics="rule.gfc.FeatOp.trigVal-failure-en 
                rule.gfc.FeatOp.trigVal-failure-fr"/>
            
            <sch:report test="$has_trigVal.FA or $has_trigVal.BFA"
                diagnostics="rule.gfc.FeatOp.trigVal-success-en 
                rule.gfc.FeatOp.trigVal-success-fr"/>
        </sch:rule>
    </sch:pattern>
    
    
    
    
    <!-- 
    Rule: FC_FeatureType.definition
    Ref: {count(definition + definitionReference) > 0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatType.defin-failure-en"
            xml:lang="en">The Feature Type has neither a definition nor a definition reference.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatType.defin-failure-fr"
            xml:lang="fr">Le Feature Type n'a ni définition ni référence de définition.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatType.defin-success-en"
            xml:lang="en">The FeatureType.definition is  
            "<sch:value-of select="normalize-space($FT.defin)"/>"
            and FeatureType.definitionReference is
            "<sch:value-of select="normalize-space($FT.definRef)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatType.defin-success-fr"
            xml:lang="fr">La définition de FeatureType est  
            "<sch:value-of select="normalize-space($FT.defin)"/>"
            et FeatureType.definitionReference est
            "<sch:value-of select="normalize-space($FT.definRef)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatType.defin">
        <sch:title xml:lang="en">The Feature Type MUST have either a definition or a definition reference.</sch:title>
        <sch:title xml:lang="fr">Le Feature Type DOIT avoir une définition ou une référence de définition.</sch:title>
        
        <sch:rule context="//gfc.FC_FeatureType">
            
            <sch:let name="FT.defin" value="gfc:definition"/>
            <sch:let name="FT.definRef" value="gfc:definitionReference"/>
            <sch:let name="has_FT.defin" 
                value="normalize-space($FT.defin) != ''"/>
            <sch:let name="has_FT.definRef" 
                value="normalize-space($FT.definRef) != ''"/>
            
            <sch:assert test="$has_FT.defin or $has_FT.definRef"
                diagnostics="rule.gfc.FeatType.defin-failure-en 
                rule.gfc.FeatType.defin-failure-fr"/>
            
            <sch:report test="$has_FT.defin or $has_FT.definRef"
                diagnostics="rule.gfc.FeatType.defin-success-en 
                rule.gfc.FeatType.defin-success-fr"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
    Rule: featureType.FC_AssociationRole.rolePlayer
    Ref: {if featureType.FC_AssociationRole the count(rolePlayer) > 0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.featType.AssocRole.rolePlayer-failure-en"
            xml:lang="en">A rolePlayer has not been provided in the featureType.AssociationRole.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.featType.AssocRole.rolePlayer-failure-fr"
            xml:lang="fr">un rolePlayer n'est pas fourni dans featureType.AssociationRole.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.featType.AssocRole.rolePlayer-success-en"
            xml:lang="en">The featureType.AssociationRole.rolePlayer is  
            "<sch:value-of select="normalize-space($ft.FA.valType)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.featType.AssocRole.rolePlayer-success-fr"
            xml:lang="fr">Le featureType.AssociationRole.rolePlayer est  
            "<sch:value-of select="normalize-space($ft.FA.valType)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.featType.AssocRole.rolePlayer">
        <sch:title xml:lang="en">A rolePlayer MUST be provided in a featureType.AssociationRole.</sch:title>
        <sch:title xml:lang="fr">Un rolePlayer DOIT être fourni dans un featureType.AssociationRole.</sch:title>
        
        <sch:rule context="//gfc.featureType/gfc:FC_AssociationRole">
            
            <sch:let name="ft.AR.rolePlayer" value="gfc:rolePlayer"/>
            <sch:let name="has_ft.AR.rolePlayer" 
                value="normalize-space($ft.AR.rolePlayer) != ''"/>
            <sch:assert test="$has_ft.AR.rolePlayer"
                diagnostics="rule.gfc.featType.AssocRole.rolePlayer-failure-en 
                rule.gfc.featType.AssocRole.rolePlayer-failure-fr"/>
            
            <sch:report test="$has_ft.AR.rolePlayer"
                diagnostics="rule.gfc.featType.AssocRole.rolePlayer-success-en 
                rule.gfc.featType.AssocRole.rolePlayer-success-fr"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
    Rule: featureType.FC_FeatureAttribute.valueType
    Ref: {if featureType.FC_FeatureAttribute the count(valueType) > 0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.featType.FeatAtt.valType-failure-en"
            xml:lang="en">A valueType has not been provided in the featureType.FeatureAttribute.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.featType.FeatAtt.valType-failure-fr"
            xml:lang="fr">un valueType n'est pas fourni dans featureType.FeatureAttribute.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.featType.FeatAtt.valType-success-en"
            xml:lang="en">The featureType.FeatureAttribute.valueType is  
            "<sch:value-of select="normalize-space($ft.FA.valType)"/>"
             .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.featType.FeatAtt.valType-success-fr"
            xml:lang="fr">Le featureType.FeatureAttribute.valueType est  
            "<sch:value-of select="normalize-space($ft.FA.valType)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.featType.FeatAtt.valType">
        <sch:title xml:lang="en">A valueType MUST be provided in a featureType.FeatureAttribute.</sch:title>
        <sch:title xml:lang="fr">Un valueType DOIT être fourni dans un featureType.FeatureAttribute.</sch:title>
        
        <sch:rule context="//gfc.featureType/gfc:FC_FeatureAttributeType">
            
            <sch:let name="ft.FA.valType" value="gfc:valueType"/>
            <sch:let name="has_ft.FA.valType" 
                value="normalize-space($ft.FA.valType) != ''"/>
            <sch:assert test="$has_ft.FA.valType"
                diagnostics="rule.gfc.featType.FeatAtt.valType-failure-en 
                rule.gfc.featType.FeatAtt.valType-failure-fr"/>
            
            <sch:report test="$has_ft.FA.valType"
                diagnostics="rule.gfc.featType.FeatAtt.valType-success-en 
                rule.gfc.featType.FeatAtt.valType-success-fr"/>
        </sch:rule>
    </sch:pattern>

    <!-- 
    Rule: FC_FeatureAttribute.valueType-featureCatalogue
    Ref: {if FC_FeatureAttribute the count(valueType) = count(featureCatalogue = 1}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatAtt.valType-failure-en"
            xml:lang="en">A valueType not provided in the featureType.FeatureAttribute.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatAtt.valType-failure-fr"
            xml:lang="fr">un valueType n'est par fourni dans FeatureAttribute.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatAtt.valType-success-en"
            xml:lang="en">The FeatureAttribute.valueType is  
            "<sch:value-of select="normalize-space($FA.valType)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatAtt.valType-success-fr"
            xml:lang="fr">Le FeatureAttribute.valueType est  
            "<sch:value-of select="normalize-space($FA.valType)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatAtt.valType">
        <sch:title xml:lang="en">A valueType MUST be provided in a FeatureAttribute.</sch:title>
        <sch:title xml:lang="fr">Un valueType DOIT être fourni dans un FeatureAttribute.</sch:title>
        
        <sch:rule context="//gfc.FC_FeatureAttributeType">
            
            <sch:let name="FA.valType" value="gfc:valueType"/>
            <sch:let name="has_FA.valType" 
                value="normalize-space($FA.valType) != ''"/>
            <sch:assert test="$has_FA.valType"
                diagnostics="rule.gfc.FeatAtt.valType-failure-en 
                rule.gfc.FeatAtt.valType-failure-fr"/>
            
            <sch:report test="$has_FA.valType"
                diagnostics="rule.gfc.FeatAtt.valType-success-en 
                rule.gfc.FeatAtt.valType-success-fr"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
    Rule: FC_FeatureAttribute.definition
    Ref: {count(definition + definitionReference) > 0}
  -->
    <sch:diagnostics>
        <sch:diagnostic id="rule.gfc.FeatAttrib.defin-failure-en"
            xml:lang="en">The FeatureAttribute has neither a definition nor a definition reference.</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatAttrib.defin-failure-fr"
            xml:lang="fr">Le FeatureAttribute n'a ni définition ni référence de définition.</sch:diagnostic>
        
        <sch:diagnostic id="rule.gfc.FeatAttrib.defin-success-en"
            xml:lang="en">The FeatureAttribute.definition is  
            "<sch:value-of select="normalize-space($FA.defin)"/>"
            and FeatureAttribute.definitionReference is
            "<sch:value-of select="normalize-space($FA.definRef)"/>"
            .</sch:diagnostic>
        <sch:diagnostic id="rule.gfc.FeatAttrib.defin-success-fr"
            xml:lang="fr">La définition de FeatureAttribute est  
            "<sch:value-of select="normalize-space($FA.defin)"/>"
            et la définition de FeatureType.definitionReference est
            "<sch:value-of select="normalize-space($FA.definRef)"/>"
            .</sch:diagnostic>
    </sch:diagnostics>
    
    <sch:pattern id="rule.gfc.FeatAttrib.defin">
        <sch:title xml:lang="en">The FeatureAttribute MUST have either a definition or a definition reference.</sch:title>
        <sch:title xml:lang="fr">Le FeatureAttribute DOIT avoir soit une définition soit une référence de définition.</sch:title>
        
        <sch:rule context="//gfc.FC_FeatureAttribute">
            
            <sch:let name="FA.defin" value="gfc:definition"/>
            <sch:let name="FA.definRef" value="gfc:definitionReference"/>
            <sch:let name="has_FA.defin" 
                value="normalize-space($FA.defin) != ''"/>
            <sch:let name="has_FA.definRef" 
                value="normalize-space($FA.definRef) != ''"/>
            
            <sch:assert test="$has_FA.defin or $has_FA.definRef"
                diagnostics="rule.gfc.FeatAttrib.defin-failure-en 
                rule.gfc.FeatType.defin-failure-fr"/>
            
            <sch:report test="$has_FA.defin or $has_FA.definRef"
                diagnostics="rule.gfc.FeatAttrib.defin-success-en 
                rule.gfc.FeatType.defin-success-fr"/>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>