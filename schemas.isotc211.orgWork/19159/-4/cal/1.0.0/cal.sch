<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xml:lang="en">

    <sch:ns prefix="cal" uri="https://schemas.isotc211.org/19159/-4/cal/1.0"/>
    <sch:ns prefix="gco" uri="https://schemas.isotc211.org/19103/-/gco/1.2"/>
    <sch:ns prefix="smi" uri="https://schemas.isotc211.org/19130/-3/smi/1.1"/>
    <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>

    <sch:diagnostics>
        
        <!-- 
            =================================   
            CA_AntennaPatternCalibration 
            =================================
        -->

        <!-- TA element must exist -->
        <sch:diagnostic id="rule.cal.ta-exists-cantennapatterncalibration-failure-en" xml:lang="en"
            >The element TA MUST exist in CA_AntennaPatternCalibration.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.ta-exists-cantennapatterncalibration-success-en" xml:lang="en"
            >The element TA exists in CA_AntennaPatternCalibration.</sch:diagnostic>
        <!-- TA temperature in Kelvin must be in the range of 0 to 350 -->
        <sch:diagnostic id="rule.cal.ta-range-cantennapatterncalibration-failure-en" xml:lang="en">The TA
            temperature in Kelvin MUST be in the range of 0 to 350.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.ta-range-cantennapatterncalibration-success-en" xml:lang="en">The TA
            temperature in Kelvin is valid.</sch:diagnostic>

        <!-- satelliteOrbitalHeight element must exist -->
        <sch:diagnostic
            id="rule.cal.satelliteorbitalheight-exists-cantennapatterncalibration-failure-en"
            xml:lang="en">The element satelliteOrbitalHeight MUST exist in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.satelliteorbitalheight-exists-cantennapatterncalibration-success-en"
            xml:lang="en">The element satelliteOrbitalHeight exists in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <!-- satelliteOrbitalHeight must be greater than 0 -->
        <sch:diagnostic id="rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-success-en"
            xml:lang="en">satelliteOrbitalHeight is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-failure-en"
            xml:lang="en">satelliteOrbitalHeight MUST be greater than 0.</sch:diagnostic>

        <!-- beamwidth must exist -->
        <sch:diagnostic id="rule.cal.beamwidth-exists-cantennapatterncalibration-failure-en"
            xml:lang="en">The element beamwidth MUST exist in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.beamwidth-exists-cantennapatterncalibration-success-en"
            xml:lang="en">The element beamwidth exists in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <!-- beamWidth angle must be greater than 0 -->
        <sch:diagnostic id="rule.cal.beamwidt-range-cantennapatterncalibration-success-en" xml:lang="en">beamWidth
            angle is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.beamwidt-range-cantennapatterncalibration-failure-en" xml:lang="en"
            >beamWidth angle MUST be greater than 0.</sch:diagnostic>

        <!-- mainBeamEfficiency must exist -->
        <sch:diagnostic
            id="rule.cal.mainbeamefficiency-exists-cantennapatterncalibration-failure-en"
            xml:lang="en">The element mainBeamEfficiency MUST exist in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.mainbeamefficiency-exists-cantennapatterncalibration-success-en"
            xml:lang="en">The element mainBeamEfficiency exists in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <!-- mainBeamEfficiency must be in the range of 0 to 1 -->
        <sch:diagnostic id="rule.cal.mainbeamefficiency-range-cantennapatterncalibration-success-en"
            xml:lang="en">mainBeamEfficiency value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.mainbeamefficiency-range-cantennapatterncalibration-failure-en"
            xml:lang="en">mainBeamEfficiency value MUST be in the range of 0 to 1.</sch:diagnostic>

        <!-- TBWithinTheScene must exist -->
        <sch:diagnostic id="rule.cal.tbwithinscene-exists-cantennapatterncalibration-failure-en"
            xml:lang="en">The element TBWithinTheScene MUST exist in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.tbwithinscene-exists-cantennapatterncalibration-success-en"
            xml:lang="en">The element TBWithinTheScene exists in
            CA_AntennaPatternCalibration.</sch:diagnostic>
        <!-- TBWithinTheScene temperature in Kelvin must be greater than 0 -->
        <sch:diagnostic id="rule.cal.tbwithinscene-range-cantennapatterncalibration-failure-en"
            xml:lang="en">The TBWithinTheScene temperature in Kelvin must be in the range of 0 to 350.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.tbwithinscene-range-cantennapatterncalibration-success-en"
            xml:lang="en">The TBWithinTheScene temperature in Kelvin is valid.</sch:diagnostic>
    </sch:diagnostics>

    <sch:pattern id="rule.cal.ta-cantennapatterncalibrationelement">
        <sch:title xml:lang="en">TA temperature in Kelvin MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_AntennaPatternCalibration">
            <sch:assert
                test="(count(cal:TA) = 1) and (normalize-space(cal:TA) != '')"
                diagnostics="rule.cal.ta-exists-cantennapatterncalibration-failure-en"/>
            <sch:report test="(number(normalize-space(cal:TA)) >= 0) and (number(normalize-space(cal:TA)) &lt;= 350)"
                diagnostics="rule.cal.ta-range-cantennapatterncalibration-success-en"/>
            <sch:report test="(number(normalize-space(cal:TA)) &lt; 0) or (number(normalize-space(cal:TA)) &gt; 350)"
                diagnostics="rule.cal.ta-range-cantennapatterncalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="rule.cal.satelliteorbitalheight-cantennapatterncalibration">
        <sch:title xml:lang="en">Orbital height MUST be greater than zero.</sch:title>
        <sch:rule context="cal:CA_AntennaPatternCalibration">
            <sch:assert
                test="(count(cal:satelliteOrbitalHeight) = 1) and (normalize-space(cal:satelliteOrbitalHeight) != '')"
                diagnostics="rule.cal.satelliteorbitalheight-exists-cantennapatterncalibration-failure-en"/>
            <sch:report test="number(normalize-space(cal:satelliteOrbitalHeight)) > 0"
                diagnostics="rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-success-en"/>
            <sch:report test="number(normalize-space(cal:satelliteOrbitalHeight)) &lt;= 0"
                diagnostics="rule.cal.satelliteorbitalheight-range-cantennapatterncalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="rule.cal.beamwidth-cantennapatterncalibration">
        <sch:title xml:lang="en">Beam width MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_AntennaPatternCalibration">
            <sch:assert
                test="(count(cal:beamwidth) = 1) and (normalize-space(cal:beamwidth) != '')"
                diagnostics="rule.cal.beamwidth-exists-cantennapatterncalibration-failure-en"/>
            <sch:report test="number(normalize-space(cal:beamwidth)) > 0"
                diagnostics="rule.cal.beamwidt-range-cantennapatterncalibration-success-en"/>
            <sch:report test="number(normalize-space(cal:beamwidth)) &lt;= 0"
                diagnostics="rule.cal.beamwidt-range-cantennapatterncalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="rule.cal.mainbeamefficiency-cantennapatterncalibration">
        <sch:title xml:lang="en">Main beam efficiency MUST be between 0 and 1.</sch:title>
        <sch:rule context="cal:CA_AntennaPatternCalibration">
            <sch:assert
                test="(count(cal:mainBeamEfficiency) = 1) and (normalize-space(cal:mainBeamEfficiency) != '')"
                diagnostics="rule.cal.mainbeamefficiency-exists-cantennapatterncalibration-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:mainBeamEfficiency)) >= 0) and (number(normalize-space(cal:mainBeamEfficiency)) &lt;= 1)"
                diagnostics="rule.cal.mainbeamefficiency-range-cantennapatterncalibration-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:mainBeamEfficiency)) &lt; 0) or (number(normalize-space(cal:mainBeamEfficiency)) &gt; 1)"
                diagnostics="rule.cal.mainbeamefficiency-range-cantennapatterncalibration-failure-en"
            />
        </sch:rule>
    </sch:pattern>

    <sch:pattern id="rule.cal.tbwithinscene-cantennapatterncalibration">
        <sch:title xml:lang="en">TB in the scene temperature in Kelvin MUST be in the range of 0 to 350.</sch:title>
        <sch:rule context="cal:CA_AntennaPatternCalibration">
            <sch:assert
                test="(count(cal:TBWithinTheScene) = 1) and (normalize-space(cal:TBWithinTheScene) != '')"
                diagnostics="rule.cal.tbwithinscene-exists-cantennapatterncalibration-failure-en"/>
            <sch:report test="(number(normalize-space(cal:TBWithinTheScene)) >= 0) and (number(normalize-space(cal:TBWithinTheScene)) &lt;= 350)"
                diagnostics="rule.cal.tbwithinscene-range-cantennapatterncalibration-success-en"/>
            <sch:report test="(number(normalize-space(cal:TBWithinTheScene)) &lt; 0) or (number(normalize-space(cal:TBWithinTheScene)) &gt; 350)"
                diagnostics="rule.cal.tbwithinscene-range-cantennapatterncalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>

    
    <!-- 
        =================================  
        CA_SCF 
        =================================
     -->
    
    <sch:diagnostics>
        <!-- centreFrequency must exist in CA_SCF -->
        <sch:diagnostic id="rule.cal.centrefrequency-exists-cascf-failure-en" xml:lang="en">centreFrequency MUST exist in CA_SCF.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.centrefrequency-exists-cascf-success-en" xml:lang="en">centreFrequency exists in CA_SCF.</sch:diagnostic>
        <!-- centreFrequency must be greater than 0. -->
        <sch:diagnostic id="rule.cal.centrefrequency-range-cascf-success-en"
            xml:lang="en">centreFrequency value in Hertz is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.centrefrequency-range-cascf-failure-en"
            xml:lang="en">centreFrequency value in Hertz MUST be greater than 0.</sch:diagnostic>
        
        <!-- bandWidth must exist in CA_SCF-->
        <sch:diagnostic id="rule.cal.bandwidth-exists-cascf-failure-en" xml:lang="en">bandWidth MUST exist in CA_SCF.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.bandwidth-exists-cascf-success-en" xml:lang="en">bandWidth exists in CA_SCF.</sch:diagnostic>
        <!-- centreFrequency must be greater than 0. -->
        <sch:diagnostic id="rule.cal.bandwidth-range-cascf-success-en"
            xml:lang="en">bandWidth value in Hertz is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.bandwidth-range-cascf-failure-en"
            xml:lang="en">bandWidth value in Hertz MUST be greater than 0.</sch:diagnostic>
 
        <!-- bandwidthCorrectionCoefficients must exist -->
        <!-- TODO: Add messages
        Including 3 items: the unit of the 1st is Kelvin / Volt2, of the 2nd is Kelvin / Volt, of the 3rd is Kelvin.
        -->
 
        <!-- USBLimit must exist -->
        <sch:diagnostic id="rule.cal.usblimit-exists-cascf-failure-en"
            xml:lang="en">The element USBLimit MUST exist in
            CA_SCF.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.usblimit-exists-cascf-success-en"
            xml:lang="en">The element USBLimit exists in
            CA_SCF.</sch:diagnostic>
        <!-- USBLimit  must be greater than 0 -->
        <sch:diagnostic id="rule.cal.usblimit-range-cascf-success-en" xml:lang="en">USBLimit is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.usblimit-range-cascf-failure-en" xml:lang="en">USBLimit MUST be greater than 0.</sch:diagnostic>
        
        <!-- LSBLimit must exist -->
        <sch:diagnostic id="rule.cal.lsblimit-exists-cascf-failure-en"
            xml:lang="en">The element LSBLimit MUST exist in
            CA_SCF.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.lsblimit-exists-cascf-success-en"
            xml:lang="en">The element LSBLimit exists in
            CA_SCF.</sch:diagnostic>
        <!-- LSBLimit must be greater than 0 -->
        <sch:diagnostic id="rule.cal.lsblimit-range-cascf-success-en" xml:lang="en">LSBLimit is valid.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.lsblimit-range-cascf-failure-en" xml:lang="en"
            >LSBLimit MUST be greater than 0.</sch:diagnostic>

        <!--  stokesVector must exist -->
        <!-- TODO: Add stokesVector messages
        Stokes vector including four elements; the unit is usually Kelvin 
        -->

        <!-- mainBeamEfficiency must exist -->
        <sch:diagnostic
            id="rule.cal.mainbeamefficiency-exists-cascf-failure-en"
            xml:lang="en">The element mainBeamEfficiency MUST exist in
            CA_SCF.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.mainbeamefficiency-exists-cascf-success-en"
            xml:lang="en">The element mainBeamEfficiency exists in
            CA_SCF.</sch:diagnostic>
        <!-- mainBeamEfficiency must be in the range of 0 to 1 -->
        <sch:diagnostic id="rule.cal.mainbeamefficiency-range-cascf-success-en"
            xml:lang="en">mainBeamEfficiency value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.mainbeamefficiency-range-cascf-failure-en"
            xml:lang="en">mainBeamEfficiency value MUST be in the range of 0 to 1.</sch:diagnostic>
        
        <!-- thermistorCalibrationCoefficients must exist -->
        <!-- TODO: Add thermistorCalibrationCoefficients messages
        Including 3 items: the unit of the 1st is Kelvin / Volt2, of the 2nd is Kelvin / Volt, of the 3rd is Kelvin.
        -->
        
        <!-- nonlinearityCoefficient must exist -->
        <sch:diagnostic
            id="rule.cal.nonlinearitycoefficient-exists-cascf-failure-en"
            xml:lang="en">The element nonlinearityCoefficient MUST exist in
            CA_SCF.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.nonlinearitycoefficient-exists-cascf-success-en"
            xml:lang="en">The element nonlinearityCoefficient exists in
            CA_SCF.</sch:diagnostic>
        <!-- mainBeamEfficiency must be in the range of 0 to 1 -->
        <sch:diagnostic id="rule.cal.nonlinearitycoefficient-range-cascf-success-en"
            xml:lang="en">nonlinearityCoefficient value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.nonlinearitycoefficient-range-cascf-failure-en"
            xml:lang="en">nonlinearityCoefficient value MUST be in the range of 0 to 1.</sch:diagnostic> 
    </sch:diagnostics>

    <!-- centreFrequency must exist -->
    <sch:pattern id="rule.cal.centrefrequency-cascf">
        <sch:title xml:lang="en">Centre frequency MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:centreFrequency) = 1) and (normalize-space(cal:centreFrequency) != '')"
                diagnostics="rule.cal.centrefrequency-exists-cascf-failure-en"/>
            <sch:report test="number(normalize-space(cal:centreFrequency)) > 0"
                diagnostics="rule.cal.centrefrequency-range-cascf-success-en"/>
            <sch:report test="number(normalize-space(cal:centreFrequency)) &lt;= 0"
                diagnostics="rule.cal.centrefrequency-range-cascf-failure-en"/>
        </sch:rule>
    </sch:pattern>

    <!-- bandwidth must exist -->
    <sch:pattern id="rule.cal.bandwidth-cascf">
        <sch:title xml:lang="en">Bandwidth MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:bandwidth) = 1) and (normalize-space(cal:bandwidth) != '')"
                diagnostics="rule.cal.bandwidth-exists-cascf-failure-en"/>
            <sch:report test="number(normalize-space(cal:bandwidth)) > 0"
                diagnostics="rule.cal.bandwidth-range-cascf-success-en"/>
            <sch:report test="number(normalize-space(cal:bandwidth)) &lt;= 0"
                diagnostics="rule.cal.bandwidth-range-cascf-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- USBLimit must exist -->
    <sch:pattern id="rule.cal.usblimit-cascf">
        <sch:title xml:lang="en">USB limit MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:USBLimit) = 1) and (normalize-space(cal:USBLimit) != '')"
                diagnostics="rule.cal.usblimit-exists-cascf-failure-en"/>
            <sch:report test="number(normalize-space(cal:USBLimit)) > 0"
                diagnostics="rule.cal.usblimit-range-cascf-success-en"/>
            <sch:report test="number(normalize-space(cal:USBLimit)) &lt;= 0"
                diagnostics="rule.cal.usblimit-range-cascf-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- LSBLimit must exist -->
    <sch:pattern id="rule.cal.lsblimit-cascf">
        <sch:title xml:lang="en">LSB limit MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:LSBLimit) = 1) and (normalize-space(cal:LSBLimit) != '')"
                diagnostics="rule.cal.lsblimit-exists-cascf-failure-en"/>
            <sch:report test="number(normalize-space(cal:LSBLimit)) > 0"
                diagnostics="rule.cal.lsblimit-range-cascf-success-en"/>
            <sch:report test="number(normalize-space(cal:LSBLimit)) &lt;= 0"
                diagnostics="rule.cal.lsblimit-range-cascf-failure-en"/>
        </sch:rule>
    </sch:pattern>


    <!-- mainbeamefficiency must exist -->
    <sch:pattern id="rule.cal.mainbeamefficiency-cascf">
        <sch:title xml:lang="en">Main beam efficiency MUST be in the range of 0 to 1.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:mainBeamEfficiency) = 1) and (normalize-space(cal:mainBeamEfficiency) != '')"
                diagnostics="rule.cal.mainbeamefficiency-exists-cascf-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:mainBeamEfficiency)) >= 0) and (number(normalize-space(cal:mainBeamEfficiency)) &lt;= 1)"
                diagnostics="rule.cal.mainbeamefficiency-range-cascf-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:mainBeamEfficiency)) &lt; 0) or (number(normalize-space(cal:mainBeamEfficiency)) &gt; 1)"
                diagnostics="rule.cal.mainbeamefficiency-range-cascf-failure-en"/>
        </sch:rule>
    </sch:pattern>
   
    <!-- thermistorCalibrationCoefficients must exist -->
    <!-- TODO: Add thermistorCalibrationCoefficients check
        Including 3 items: the unit of the 1st is Kelvin / Volt2, of the 2nd is Kelvin / Volt, of the 3rd is Kelvin.
        -->
    
    <!-- nonlinearityCoefficient must exist -->
    <sch:pattern id="rule.cal.nonlinearitycoefficient-cascf">
        <sch:title xml:lang="en">Non-linearity coefficient MUST be between 0 and 1.</sch:title>
        <sch:rule context="cal:CA_SCF">
            <sch:assert
                test="(count(cal:nonlinearityCoefficient) = 1) and (normalize-space(cal:nonlinearityCoefficient) != '')"
                diagnostics="rule.cal.nonlinearitycoefficient-exists-cascf-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:nonlinearityCoefficient)) >= 0) and (number(normalize-space(cal:nonlinearityCoefficient)) &lt;= 1)"
                diagnostics="rule.cal.nonlinearitycoefficient-range-cascf-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:nonlinearityCoefficient)) &lt; 0) or (number(normalize-space(cal:nonlinearityCoefficient)) &gt; 1)"
                diagnostics="rule.cal.nonlinearitycoefficient-range-cascf-failure-en"
            />
        </sch:rule>
    </sch:pattern>
    

    <!-- 
        =================================   
        CA_SatelliteAttachmentInformation 
        =================================   
    -->
    <sch:diagnostics>
        <!-- satelliteOrbitalHeight must exist -->
        <sch:diagnostic
            id="rule.cal.satelliteorbitalheight-exists-casatelliteattachmentinformation-failure-en"
            xml:lang="en">The element satelliteOrbitalHeight MUST exist in
            CA_SatelliteAttachmentInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.satelliteorbitalheight-exists-casatelliteattachmentinformation-success-en"
            xml:lang="en">The element satelliteOrbitalHeight exists in
            CA_SatelliteAttachmentInformation.</sch:diagnostic>
        <!-- satelliteOrbitalHeight must be greater than 0 -->
        <sch:diagnostic id="rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-success-en"
            xml:lang="en">satelliteOrbitalHeight value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-failure-en"
            xml:lang="en">satelliteOrbitalHeight value MUST greater than 0.</sch:diagnostic> 
   
    
        <!-- latitudeOfMeasurement must exist -->
    <sch:diagnostic
        id="rule.cal.latitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en"
        xml:lang="en">The element latitudeOfMeasurement MUST exist in
        CA_SatelliteAttachmentInformation.</sch:diagnostic>
    <sch:diagnostic
        id="rule.cal.latitudeofmeasurement-exists-casatelliteattachmentinformation-success-en"
        xml:lang="en">The element latitudeOfMeasurement exists on
        CA_SatelliteAttachmentInformation.</sch:diagnostic> 
        <!-- latitudeOfMeasurement must be in the range of -90 to 90 -->
        <sch:diagnostic id="rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-success-en"
        xml:lang="en">latitudeOfMeasurement value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-failure-en"
        xml:lang="en">latitudeOfMeasurement value MUST be in the range of -90 to 90.</sch:diagnostic>
    
        <!-- longitudeOfMeasurement must exist -->
        <sch:diagnostic
            id="rule.cal.longitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en"
            xml:lang="en">The element longitudeOfMeasurement MUST exist in
            CA_SatelliteAttachmentInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.longitudeofmeasurement-exists-casatelliteattachmentinformation-success-en"
            xml:lang="en">The element longitudeOfMeasurement exists on
            CA_SatelliteAttachmentInformation.</sch:diagnostic>
        <!-- longitudeOfMeasurement must be in the range of -180 to 180 -->
        <sch:diagnostic id="rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-success-en"
            xml:lang="en">longitudeOfMeasurement value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-failure-en"
            xml:lang="en">longitudeOfMeasurement value MUST be in the range of -180 to 180.</sch:diagnostic>
    </sch:diagnostics>
    
    <!-- satelliteOrbitalHeight must exist -->
    <sch:pattern id="rule.cal.satelliteorbitalheight-casatelliteattachmentinformation">
        <sch:title xml:lang="en">Satellite orbital height MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_SatelliteAttachmentInformation">
            <sch:assert
                test="(count(cal:satelliteOrbitalHeight) = 1) and (normalize-space(cal:satelliteOrbitalHeight) != '')"
                diagnostics="rule.cal.satelliteorbitalheight-exists-casatelliteattachmentinformation-failure-en"/>
            <sch:report test="number(normalize-space(cal:satelliteOrbitalHeight)) > 0"
                diagnostics="rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-success-en"/>
            <sch:report test="number(normalize-space(cal:satelliteOrbitalHeight)) &lt;= 0"
                diagnostics="rule.cal.satelliteorbitalheight-range-casatelliteattachmentinformation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- latitudeOfMeasurement must exist -->
    <sch:pattern id="rule.cal.latitudeofmeasurement-casatelliteattachmentinformation">
        <sch:title xml:lang="en">Latitude of measurement MUST be between -90 and 90.</sch:title>
        <sch:rule context="cal:CA_SatelliteAttachmentInformation">
            <sch:assert
                test="(count(cal:latitudeOfMeasurement) = 1) and (normalize-space(cal:latitudeOfMeasurement) != '')"
                diagnostics="rule.cal.latitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:latitudeOfMeasurement)) >= -90) and (number(normalize-space(cal:latitudeOfMeasurement)) &lt;= 90)"
                diagnostics="rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:latitudeOfMeasurement)) &lt; -90) or (number(normalize-space(cal:latitudeOfMeasurement)) &gt; 90)"
                diagnostics="rule.cal.latitudeofmeasurement-range-casatelliteattachmentinformation-failure-en"
            />
        </sch:rule>
    </sch:pattern>
    
    <!-- longitudeOfMeasurement must exist -->
    <sch:pattern id="rule.cal.longitudeofmeasurement-casatelliteattachmentinformation">
        <sch:title xml:lang="en">Longitude of measurement MUST be between -180 and 180.</sch:title>
        <sch:rule context="cal:CA_SatelliteAttachmentInformation">
            <sch:assert
                test="(count(cal:longitudeOfMeasurement) = 1) and (normalize-space(cal:longitudeOfMeasurement) != '')"
                diagnostics="rule.cal.longitudeofmeasurement-exists-casatelliteattachmentinformation-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:longitudeOfMeasurement)) >= -180) and (number(normalize-space(cal:longitudeOfMeasurement)) &lt;= 180)"
                diagnostics="rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:longitudeOfMeasurement)) &lt; -180) or (number(normalize-space(cal:longitudeOfMeasurement)) &gt; 180)"
                diagnostics="rule.cal.longitudeofmeasurement-range-casatelliteattachmentinformation-failure-en"
            />
        </sch:rule>
    </sch:pattern>
    
    <!-- 
        =================================   
        CA_BandResponseFunction 
        =================================   
    -->
    <sch:diagnostics>
        <!-- frequency must exist -->
        <sch:diagnostic
            id="rule.cal.frequency-exists-cabandresponsefunction-failure-en"
            xml:lang="en">The element frequency MUST exist in
            CA_BandResponseFunction.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.frequency-exists-cabandresponsefunction-success-en"
            xml:lang="en">The element frequency exists in
            CA_BandResponseFunction.</sch:diagnostic>
        <!-- satelliteOrbitalHeight must be greater than 0 -->
        <sch:diagnostic id="rule.cal.frequency-range-cabandresponsefunction-success-en"
            xml:lang="en">frequency value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.frequency-range-cabandresponsefunction-failure-en"
            xml:lang="en">frequency value MUST greater than 0.</sch:diagnostic> 
        
        <!-- bandResponse must exist -->
        <sch:diagnostic
            id="rule.cal.bandresponse-exists-cabandresponsefunction-failure-en"
            xml:lang="en">The element bandResponse MUST exist in
            CA_BandResponseFunction.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.bandresponse-exists-cabandresponsefunction-success-en"
            xml:lang="en">The element bandResponse exists in
            CA_BandResponseFunction.</sch:diagnostic>
        <!-- satelliteOrbitalHeight must be greater than 0 -->
        <sch:diagnostic id="rule.cal.bandresponse-range-cabandresponsefunction-success-en"
            xml:lang="en">bandResponse value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.bandresponse-range-cabandresponsefunction-failure-en"
            xml:lang="en">bandResponse value MUST greater than 0.</sch:diagnostic> 
    </sch:diagnostics>
    
    <!-- frequency must exist -->
    <sch:pattern id="rule.cal.frequency-cabandresponsefunction">
        <sch:title xml:lang="en">Frequency MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_BandResponseFunction">
            <sch:assert
                test="(count(cal:frequency) = 1) and (normalize-space(cal:frequency) != '')"
                diagnostics="rule.cal.frequency-exists-cabandresponsefunction-failure-en"/>
            <sch:report test="number(normalize-space(cal:frequency)) > 0"
                diagnostics="rule.cal.frequency-range-cabandresponsefunction-success-en"/>
            <sch:report test="number(normalize-space(cal:frequency)) &lt;= 0"
                diagnostics="rule.cal.frequency-range-cabandresponsefunction-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- bandResponse must exist -->
    <sch:pattern id="rule.cal.bandresponse-cabandresponsefunction">
        <sch:title xml:lang="en">Band response MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_BandResponseFunction">
            <sch:assert
                test="(count(cal:bandResponse) = 1) and (normalize-space(cal:bandResponse) != '')"
                diagnostics="rule.cal.bandresponse-exists-cabandresponsefunction-failure-en"/>
            <sch:report test="number(normalize-space(cal:bandResponse)) > 0"
                diagnostics="rule.cal.bandresponse-range-cabandresponsefunction-success-en"/>
            <sch:report test="number(normalize-space(cal:bandResponse)) &lt;= 0"
                diagnostics="rule.cal.bandresponse-range-cabandresponsefunction-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
        =================================
        CA_GeometricPosition
        =================================   
    -->
    <sch:diagnostics>
        <!-- microwaveRadiometerViewingAngle must exist -->
        <sch:diagnostic
            id="rule.cal.microwaveradiometerviewingangle-exists-cageometricposition-failure-en"
            xml:lang="en">The element microwaveRadiometerViewingAngle MUST exist in
            CA_GeometricPosition.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.microwaveradiometerviewingangle-exists-cageometricposition-success-en"
            xml:lang="en">The element microwaveRadiometerViewingAngle exists in
            CA_GeometricPosition.</sch:diagnostic>
        <!-- microwaveRadiometerViewingAngle must be greater than 0 -->
        <sch:diagnostic id="rule.cal.microwaveradiometerviewingangle-range-cageometricposition-success-en"
            xml:lang="en">microwaveRadiometerViewingAngle value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.microwaveradiometerviewingangle-range-cageometricposition-failure-en"
            xml:lang="en">microwaveRadiometerViewingAngle value MUST greater than 0.</sch:diagnostic> 
        
        <!-- microwaveRadiometerIncidentAngle must exist -->
        <sch:diagnostic
            id="rule.cal.microwaveradiometerincidentangle-exists-cageometricposition-failure-en"
            xml:lang="en">The element microwaveRadiometerIncidentAngle MUST exist in
            CA_GeometricPosition.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.microwaveradiometerincidentangle-exists-cageometricposition-success-en"
            xml:lang="en">The element microwaveRadiometerIncidentAngle exists in
            CA_GeometricPosition.</sch:diagnostic>
        <!-- microwaveRadiometerIncidentAngle must be greater than 0 -->
        <sch:diagnostic id="rule.cal.microwaveradiometerincidentangle-range-cageometricposition-success-en"
            xml:lang="en">microwaveRadiometerIncidentAngle value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.microwaveradiometerincidentangle-range-cageometricposition-failure-en"
            xml:lang="en">microwaveRadiometerIncidentAngle value MUST greater than 0.</sch:diagnostic> 
        
        <!-- microwaveRadiometerPixelSize must exist -->
        <sch:diagnostic
            id="rule.cal.microwaveradiometerpixelsize-exists-cageometricposition-failure-en"
            xml:lang="en">The element microwaveRadiometerPixelSize MUST exist in
            CA_GeometricPosition.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.microwaveradiometerpixelsize-exists-cageometricposition-success-en"
            xml:lang="en">The element microwaveRadiometerPixelSize exists in
            CA_GeometricPosition.</sch:diagnostic>
        <!-- microwaveRadiometerPixelSize must be greater than 0 -->
        <sch:diagnostic id="rule.cal.microwaveradiometerpixelsize-range-cageometricposition-success-en"
            xml:lang="en">microwaveRadiometerPixelSize value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.microwaveradiometerpixelsize-range-cageometricposition-failure-en"
            xml:lang="en">microwaveRadiometerPixelSize value MUST greater than 0.</sch:diagnostic> 
        
        <!-- microwaveRadiometerObservationInterval must exist -->
        <sch:diagnostic
            id="rule.cal.microwaveradiometerobservationinterval-exists-cageometricposition-failure-en"
            xml:lang="en">The element microwaveRadiometerObservationInterval MUST exist in
            CA_GeometricPosition.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.microwaveradiometerobservationinterval-exists-cageometricposition-success-en"
            xml:lang="en">The element microwaveRadiometerObservationInterval exists in
            CA_GeometricPosition.</sch:diagnostic>
        <!-- microwaveRadiometerObservationInterval must be greater than 0 -->
        <sch:diagnostic id="rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-success-en"
            xml:lang="en">microwaveRadiometerObservationInterval value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-failure-en"
            xml:lang="en">microwaveRadiometerObservationInterval value MUST greater than 0.</sch:diagnostic>  
    </sch:diagnostics>
    
    <!-- microwaveRadiometerViewingAngle must exist -->
    <sch:pattern id="rule.cal.microwaveradiometerviewingangle-cageometricposition">
        <sch:title xml:lang="en">Microwave radiometer viewing angle MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_GeometricPosition">
            <sch:assert
                test="(count(cal:microwaveRadiometerViewingAngle) = 1) and (normalize-space(cal:microwaveRadiometerViewingAngle) != '')"
                diagnostics="rule.cal.microwaveradiometerviewingangle-exists-cageometricposition-failure-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerViewingAngle)) > 0"
                diagnostics="rule.cal.microwaveradiometerviewingangle-range-cageometricposition-success-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerViewingAngle)) &lt;= 0"
                diagnostics="rule.cal.microwaveradiometerviewingangle-range-cageometricposition-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- microwaveRadiometerIncidentAngle must exist -->
    <sch:pattern id="rule.cal.microwaveradiometerincidentangle-cageometricposition">
        <sch:title xml:lang="en">Microwave radiometer incident angle MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_GeometricPosition">
            <sch:assert
                test="(count(cal:microwaveRadiometerIncidentAngle) = 1) and (normalize-space(cal:microwaveRadiometerIncidentAngle) != '')"
                diagnostics="rule.cal.microwaveradiometerincidentangle-exists-cageometricposition-failure-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerIncidentAngle)) > 0"
                diagnostics="rule.cal.microwaveradiometerincidentangle-range-cageometricposition-success-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerIncidentAngle)) &lt;= 0"
                diagnostics="rule.cal.microwaveradiometerincidentangle-range-cageometricposition-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- microwaveRadiometerPixelSize must exist -->
    <sch:pattern id="rule.cal.microwaveradiometerpixelsize-cageometricposition">
        <sch:title xml:lang="en">Microwave radiometer pixel size MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_GeometricPosition">
            <sch:assert
                test="(count(cal:microwaveRadiometerPixelSize) = 1) and (normalize-space(cal:microwaveRadiometerPixelSize) != '')"
                diagnostics="rule.cal.microwaveradiometerpixelsize-exists-cageometricposition-failure-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerPixelSize)) > 0"
                diagnostics="rule.cal.microwaveradiometerpixelsize-range-cageometricposition-success-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerPixelSize)) &lt;= 0"
                diagnostics="rule.cal.microwaveradiometerpixelsize-range-cageometricposition-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- microwaveRadiometerObservationInterval must exist -->
    <sch:pattern id="rule.cal.microwaveradiometerobservationinterval-cageometricposition">
        <sch:title xml:lang="en">Microwave radiometer observation interval MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_GeometricPosition">
            <sch:assert
                test="(count(cal:microwaveRadiometerObservationInterval) = 1) and (normalize-space(cal:microwaveRadiometerObservationInterval) != '')"
                diagnostics="rule.cal.microwaveradiometerobservationinterval-exists-cageometricposition-failure-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerObservationInterval)) > 0"
                diagnostics="rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-success-en"/>
            <sch:report test="number(normalize-space(cal:microwaveRadiometerObservationInterval)) &lt;= 0"
                diagnostics="rule.cal.microwaveradiometerobservationinterval-range-cageometricposition-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
        =================================
        CA_TACalibration
        =================================   
    -->
    <sch:diagnostics>
        <!-- receiverTemperature must exist -->
        <sch:diagnostic
            id="rule.cal.receivertemperature-exists-catacalibration-failure-en"
            xml:lang="en">The element receiverTemperature MUST exist in
            CA_TACalibration.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.receivertemperature-exists-catacalibration-success-en"
            xml:lang="en">The element receiverTemperature exists in
            CA_TACalibration.</sch:diagnostic>
        <!-- satelliteOrbitalHeight must be greater than 0 -->
        <sch:diagnostic id="rule.cal.receivertemperature-range-catacalibration-success-en"
            xml:lang="en">receiverTemperature value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.receivertemperature-range-catacalibration-failure-en"
            xml:lang="en">receiverTemperature value MUST greater than 0.</sch:diagnostic> 
        
        <!-- nonlinearityCoefficient must exist -->
        <sch:diagnostic
            id="rule.cal.nonlinearitycoefficient-exists-catacalibration-failure-en"
            xml:lang="en">The element nonlinearityCoefficient MUST exist in
            CA_TACalibration.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.nonlinearitycoefficient-exists-catacalibration-success-en"
            xml:lang="en">The element nonlinearityCoefficient exists in
            CA_TACalibration.</sch:diagnostic>
        <!-- nonlinearityCoefficient must be in the range of 0 to 1 -->
        <sch:diagnostic id="rule.cal.nonlinearitycoefficient-range-catacalibration-success-en"
            xml:lang="en">nonlinearityCoefficient value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.nonlinearitycoefficient-range-catacalibration-failure-en"
            xml:lang="en">nonlinearityCoefficient value MUST be in the range of 0 to 1.</sch:diagnostic>
        
        <!-- TA must exist -->
        <sch:diagnostic
            id="rule.cal.ta-exists-catacalibration-failure-en"
            xml:lang="en">The element TA MUST exist in
            CA_TACalibration.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.ta-exists-catacalibration-success-en"
            xml:lang="en">The element TA exists in
            CA_TACalibration.</sch:diagnostic>
        <!-- TA must be greater than 0 -->
        <sch:diagnostic id="rule.cal.ta-range-catacalibration-success-en"
            xml:lang="en">TA value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.ta-range-catacalibration-failure-en"
            xml:lang="en">TA value MUST greater than 0.</sch:diagnostic> 
    </sch:diagnostics>
    
    <!-- receiverTemperature must exist -->
    <sch:pattern id="rule.cal.receivertemperature-catacalibration">
        <sch:title xml:lang="en">Microwave radiometer observation interval MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TACalibration">
            <sch:assert
                test="(count(cal:receiverTemperature) = 1) and (normalize-space(cal:receiverTemperature) != '')"
                diagnostics="rule.cal.receivertemperature-exists-catacalibration-failure-en"/>
            <sch:report test="number(normalize-space(cal:receiverTemperature)) > 0"
                diagnostics="rule.cal.receivertemperature-range-catacalibration-success-en"/>
            <sch:report test="number(normalize-space(cal:receiverTemperature)) &lt;= 0"
                diagnostics="rule.cal.receivertemperature-range-catacalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- nonlinearityCoefficient must exist -->
    <sch:pattern id="rule.cal.nonlinearitycoefficient-catacalibration">
        <sch:title xml:lang="en">Non-linearity coefficient MUST be between 0 and 1.</sch:title>
        <sch:rule context="cal:CA_TACalibration">
            <sch:assert
                test="(count(cal:nonlinearityCoefficient) = 1) and (normalize-space(cal:nonlinearityCoefficient) != '')"
                diagnostics="rule.cal.nonlinearitycoefficient-exists-catacalibration-failure-en"/>
            <sch:report
                test="(number(normalize-space(cal:nonlinearityCoefficient)) >= 0) and (number(normalize-space(cal:nonlinearityCoefficient)) &lt;= 1)"
                diagnostics="rule.cal.nonlinearitycoefficient-range-catacalibration-success-en"/>
            <sch:report
                test="(number(normalize-space(cal:nonlinearityCoefficient)) &lt; 0) or (number(normalize-space(cal:nonlinearityCoefficient)) &gt; 1)"
                diagnostics="rule.cal.nonlinearitycoefficient-range-catacalibration-failure-en"
            />
        </sch:rule>
    </sch:pattern>
    
    <!-- TA must exist -->
    <sch:pattern id="rule.cal.ta-catacalibration">
        <sch:title xml:lang="en">TA interval MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TACalibration">
            <sch:assert
                test="(count(cal:TA) = 1) and (normalize-space(cal:TA) != '')"
                diagnostics="rule.cal.ta-exists-catacalibration-failure-en"/>
            <sch:report test="number(normalize-space(cal:TA)) > 0"
                diagnostics="rule.cal.ta-range-catacalibration-success-en"/>
            <sch:report test="number(normalize-space(cal:TA)) &lt;= 0"
                diagnostics="rule.cal.ta-range-catacalibration-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- 
        =================================
        CA_TargetTBInformation
        =================================   
    -->
    <sch:diagnostics>
        <!-- targetTB must exist -->
        <sch:diagnostic
            id="rule.cal.targettb-exists-catargettbinformation-failure-en"
            xml:lang="en">The element targetTB MUST exist in
            CA_TargetTBInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.targettb-exists-catargettbinformation-success-en"
            xml:lang="en">The element targetTB exists in
            CA_TargetTBInformation.</sch:diagnostic>
        <!-- targetTB must be greater than 0 -->
        <sch:diagnostic id="rule.cal.targettb-range-catargettbinformation-success-en"
            xml:lang="en">targetTB value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.targettb-range-catargettbinformation-failure-en"
            xml:lang="en">targetTB value MUST greater than 0.</sch:diagnostic> 
        
        <!-- targetTBBias must exist -->
        <sch:diagnostic
            id="rule.cal.targettbbias-exists-catargettbinformation-failure-en"
            xml:lang="en">The element targetTBBias MUST exist in
            CA_TargetTBInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.targettbbias-exists-catargettbinformation-success-en"
            xml:lang="en">The element targetTBBias exists in
            CA_TargetTBInformation.</sch:diagnostic>
        <!-- targetTBBias must be greater than 0 -->
        <sch:diagnostic id="rule.cal.targettbbias-range-catargettbinformation-success-en"
            xml:lang="en">targetTBBias value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.targettbbias-range-catargettbinformation-failure-en"
            xml:lang="en">targetTBBias value MUST greater than 0.</sch:diagnostic> 
        
        <!-- targetTBUncertainty must exist -->
        <sch:diagnostic
            id="rule.cal.targettbuncertainty-exists-catargettbinformation-failure-en"
            xml:lang="en">The element targetTBUncertainty MUST exist in
            CA_TargetTBInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.targettbuncertainty-exists-catargettbinformation-success-en"
            xml:lang="en">The element targetTBUncertainty exists in
            CA_TargetTBInformation.</sch:diagnostic>
        <!-- targetTBUncertainty must be greater than 0 -->
        <sch:diagnostic id="rule.cal.targettbuncertainty-range-catargettbinformation-success-en"
            xml:lang="en">targetTBUncertainty value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.targettbuncertainty-range-catargettbinformation-failure-en"
            xml:lang="en">targetTBUncertainty value MUST greater than 0.</sch:diagnostic> 
        
        <!-- targetTBVoltage must exist -->
        <sch:diagnostic
            id="rule.cal.targettbvoltage-exists-catargettbinformation-failure-en"
            xml:lang="en">The element targetTBVoltage MUST exist in
            CA_TargetTBInformation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.targettbvoltage-exists-catargettbinformation-success-en"
            xml:lang="en">The element targetTBVoltage exists in
            CA_TargetTBInformation.</sch:diagnostic>
        <!-- targetTBVoltage must be greater than 0 -->
        <sch:diagnostic id="rule.cal.targettbvoltage-range-catargettbinformation-success-en"
            xml:lang="en">targetTBVoltage value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.targettbvoltage-range-catargettbinformation-failure-en"
            xml:lang="en">targetTBVoltage value MUST greater than 0.</sch:diagnostic> 
    </sch:diagnostics>
    
    <!-- targetTB must exist -->
    <sch:pattern id="rule.cal.targettb-catargettbinformation">
        <sch:title xml:lang="en">Target TB MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TargetTBInformation">
            <sch:assert
                test="(count(cal:targetTB) = 1) and (normalize-space(cal:targetTB) != '')"
                diagnostics="rule.cal.targettb-exists-catargettbinformation-failure-en"/>
            <sch:report test="number(normalize-space(cal:targetTB)) > 0"
                diagnostics="rule.cal.targettb-range-catargettbinformation-success-en"/>
            <sch:report test="number(normalize-space(cal:targetTB)) &lt;= 0"
                diagnostics="rule.cal.targettb-range-catargettbinformation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- targetTBBias must exist -->
    <sch:pattern id="rule.cal.targettbbias-catargettbinformation">
        <sch:title xml:lang="en">Target TB bias MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TargetTBInformation">
            <sch:assert
                test="(count(cal:targetTBBias) = 1) and (normalize-space(cal:targetTBBias) != '')"
                diagnostics="rule.cal.targettbbias-exists-catargettbinformation-failure-en"/>
            <sch:report test="number(normalize-space(cal:targetTBBias)) > 0"
                diagnostics="rule.cal.targettbbias-range-catargettbinformation-success-en"/>
            <sch:report test="number(normalize-space(cal:targetTBBias)) &lt;= 0"
                diagnostics="rule.cal.targettbbias-range-catargettbinformation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- targetTBUncertainty must exist -->
    <sch:pattern id="rule.cal.targettbuncertainty-catargettbinformation">
        <sch:title xml:lang="en">Target TB uncertainty MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TargetTBInformation">
            <sch:assert
                test="(count(cal:targetTBUncertainty) = 1) and (normalize-space(cal:targetTBUncertainty) != '')"
                diagnostics="rule.cal.targettbuncertainty-exists-catargettbinformation-failure-en"/>
            <sch:report test="number(normalize-space(cal:targetTBUncertainty)) > 0"
                diagnostics="rule.cal.targettbuncertainty-range-catargettbinformation-success-en"/>
            <sch:report test="number(normalize-space(cal:targetTBUncertainty)) &lt;= 0"
                diagnostics="rule.cal.targettbuncertainty-range-catargettbinformation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- targetTBVoltage must exist -->
    <sch:pattern id="rule.cal.targettbvoltage-catargettbinformation">
        <sch:title xml:lang="en">Target TB voltage MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TargetTBInformation">
            <sch:assert
                test="(count(cal:targetTBVoltage) = 1) and (normalize-space(cal:targetTBVoltage) != '')"
                diagnostics="rule.cal.targettbvoltage-exists-catargettbinformation-failure-en"/>
            <sch:report test="number(normalize-space(cal:targetTBVoltage)) > 0"
                diagnostics="rule.cal.targettbvoltage-range-catargettbinformation-success-en"/>
            <sch:report test="number(normalize-space(cal:targetTBVoltage)) &lt;= 0"
                diagnostics="rule.cal.targettbvoltage-range-catargettbinformation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    
    <!-- 
        =================================
        CA_TBCalibrationValidation
        =================================   
    --> 
    <sch:diagnostics>
        <!-- TBWithinTheScene must exist -->
        <sch:diagnostic
            id="rule.cal.tbwithinthescene-exists-catbcalibrationvalidation-failure-en"
            xml:lang="en">The element TBWithinTheScene MUST exist in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.tbwithinthescene-exists-catbcalibrationvalidation-success-en"
            xml:lang="en">The element TBWithinTheScene exists in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <!-- TBWithinTheScene must be greater than 0 -->
        <sch:diagnostic id="rule.cal.tbwithinthescene-range-catbcalibrationvalidation-success-en"
            xml:lang="en">TBWithinTheScene value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.tbwithinthescene-range-catbcalibrationvalidation-failure-en"
            xml:lang="en">TBWithinTheScene value MUST greater than 0.</sch:diagnostic> 
        
        <!-- TBTrueValue  must exist -->
        <!-- TODO: Review details for TBTrueValue checks -->
        <!--<sch:diagnostic
            id="rule.cal.tbtruevalue-exists-catbcalibrationvalidation-failure-en"
            xml:lang="en">The element TBTrueValue MUST exist in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.tbtruevalue-exists-catbcalibrationvalidation-success-en"
            xml:lang="en">The element TBTrueValue exists in
            CCA_TBCalibrationValidation.</sch:diagnostic>
        <!-\- TBTrueValue must be greater than 0 -\->
        <sch:diagnostic id="rule.cal.tbtruevalue-range-catbcalibrationvalidation-success-en"
            xml:lang="en">TBTrueValue value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.tbtruevalue-range-catbcalibrationvalidation-failure-en"
            xml:lang="en">TBTrueValue value MUST greater than 0.</sch:diagnostic> -->
        
        <!-- TBCalibrationStandardDeviation must exist -->
        <sch:diagnostic
            id="rule.cal.tbcalibrationstandarddeviation-exists-catbcalibrationvalidation-failure-en"
            xml:lang="en">The element TBCalibrationStandardDeviation MUST exist in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.tbcalibrationstandarddeviation-exists-catbcalibrationvalidation-success-en"
            xml:lang="en">The element TBCalibrationStandardDeviation exists in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <!-- TBCalibrationStandardDeviation must be greater than 0 -->
        <sch:diagnostic id="rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-success-en"
            xml:lang="en">TBCalibrationStandardDeviation value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-failure-en"
            xml:lang="en">TBCalibrationStandardDeviation value MUST greater than 0.</sch:diagnostic> 
        
        <!-- reCalibratedTB must exist -->
        <sch:diagnostic
            id="rule.cal.recalibratedtb-exists-catbcalibrationvalidation-failure-en"
            xml:lang="en">The element reCalibratedTB MUST exist in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <sch:diagnostic
            id="rule.cal.recalibratedtb-exists-catbcalibrationvalidation-success-en"
            xml:lang="en">The element reCalibratedTB exists in
            CA_TBCalibrationValidation.</sch:diagnostic>
        <!-- reCalibratedTB must be greater than 0 -->
        <sch:diagnostic id="rule.cal.recalibratedtb-range-catbcalibrationvalidation-success-en"
            xml:lang="en">reCalibratedTB value is within the valid range.</sch:diagnostic>
        <sch:diagnostic id="rule.cal.recalibratedtb-range-catbcalibrationvalidation-failure-en"
            xml:lang="en">reCalibratedTB value MUST greater than 0.</sch:diagnostic> 
    </sch:diagnostics>
    
    <!-- TBWithinTheScene must exist -->
    <sch:pattern id="rule.cal.tbwithinthescene-catbcalibrationvalidation">
        <sch:title xml:lang="en">TB within the scene MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TBCalibrationValidation">
            <sch:assert
                test="(count(cal:TBWithinTheScene) = 1) and (normalize-space(cal:TBWithinTheScene) != '')"
                diagnostics="rule.cal.tbwithinthescene-exists-catbcalibrationvalidation-failure-en"/>
            <sch:report test="number(normalize-space(cal:TBWithinTheScene)) > 0"
                diagnostics="rule.cal.tbwithinthescene-range-catbcalibrationvalidation-success-en"/>
            <sch:report test="number(normalize-space(cal:TBWithinTheScene)) &lt;= 0"
                diagnostics="rule.cal.tbwithinthescene-range-catbcalibrationvalidation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- TBTrueValue must exist -->
    <!-- TODO: COnfirm TBTrueValue validation requirements -->
    
    <!--<sch:pattern id="rule.cal.tbtruevalue-catbcalibrationvalidation">
        <sch:title xml:lang="en">TTB true value MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TBCalibrationValidation">
            <sch:assert
                test="(count(cal:TBTrueValue) = 1) and (normalize-space(cal:TBTrueValue) != '')"
                diagnostics="rule.cal.tbtruevalue-exists-catbcalibrationvalidation-failure-en"/>
            <sch:report test="number(normalize-space(cal:TBTrueValue)) > 0"
                diagnostics="rule.cal.tbtruevalue-range-catbcalibrationvalidation-success-en"/>
            <sch:report test="number(normalize-space(cal:TBTrueValue)) &lt;= 0"
                diagnostics="rule.cal.tbtruevalue-range-catbcalibrationvalidation-failure-en"/>
        </sch:rule>
    </sch:pattern>-->
    
    <!-- TBCalibrationStandardDeviation must exist -->
    <sch:pattern id="rule.cal.tbcalibrationstandarddeviation-catbcalibrationvalidation">
        <sch:title xml:lang="en">TB calibration standard deviation MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TBCalibrationValidation">
            <sch:assert
                test="(count(cal:TBCalibrationStandardDeviation) = 1) and (normalize-space(cal:TBCalibrationStandardDeviation) != '')"
                diagnostics="rule.cal.tbcalibrationstandarddeviation-exists-catbcalibrationvalidation-failure-en"/>
            <sch:report test="number(normalize-space(cal:TBCalibrationStandardDeviation)) > 0"
                diagnostics="rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-success-en"/>
            <sch:report test="number(normalize-space(cal:TBCalibrationStandardDeviation)) &lt;= 0"
                diagnostics="rule.cal.tbcalibrationstandarddeviation-range-catbcalibrationvalidation-failure-en"/>
        </sch:rule>
    </sch:pattern>
    
    <!-- reCalibratedTB must exist -->
    <sch:pattern id="rule.cal.recalibratedtb-catbcalibrationvalidation">
        <sch:title xml:lang="en">Re-calibrated TB MUST be greater than 0.</sch:title>
        <sch:rule context="cal:CA_TBCalibrationValidation">
            <sch:assert
                test="(count(cal:reCalibratedTB) = 1) and (normalize-space(cal:reCalibratedTB) != '')"
                diagnostics="rule.cal.recalibratedtb-exists-catbcalibrationvalidation-failure-en"/>
            <sch:report test="number(normalize-space(cal:reCalibratedTB)) > 0"
                diagnostics="rule.cal.recalibratedtb-range-catbcalibrationvalidation-success-en"/>
            <sch:report test="number(normalize-space(cal:reCalibratedTB)) &lt;= 0"
                diagnostics="rule.cal.recalibratedtb-range-catbcalibrationvalidation-failure-en"/>
        </sch:rule>
    </sch:pattern>
</sch:schema>
