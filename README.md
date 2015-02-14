XML
===

XML schema, transforms, schematron rules, and examples for ISO TC211 Metadata Standards

This repository contains draft XML schema and related documents for the ISO TC211 metadata (ISO 19115-1) 
and data quality (ISO 19157). These are not final schemas for these standards but may be suitable for 
initial testing and familiarization. They are provided here to support those kinds of use cases 
without any expectation for persistence.

Note: the directory structure here was changed (Aug. 2014) in order to be consistent with the proposed ISO TC211
structure by adding working version date directories into the directory structure. For exxample, the
cat/1.0 directory now includes two working version directories: 2013-06-24 and 2014-07-11 which have
two different versions of the cat schema documents.

Note: the directory structure was changed again for the 2014-12-25 release in order to match the iso.standards.org structure. Directories like ISO19115-3 were changed to standards.iso.org/19115/-3. The current schemas are now in the standards.iso.org directory.

We finally achieved a valid transform result with the 2014-12-25 schema. Thanks to everyone that helped. The output is in
standards.iso.org/19115/-3/mdt/1.0/2014-12-25/mdt.xml. It is a PathFile that has the source 19115 paths as element contents.
This allow us to see where the content comes from in the source 19115 record and defines the crosswalk.
