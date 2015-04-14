XML
===

XML schema, transforms, schematron rules, and examples for ISO TC211 Metadata Standards

This repository contains draft XML schema and related documents for the ISO TC211 metadata (ISO 19115-1) 
and data quality (ISO 19157). These are not final schemas for these standards but may be suitable for 
initial testing and familiarization. They are provided here to support those kinds of use cases 
without any expectation for persistence.

The schemas in the standards.iso.org directory of this repository are the most current schemas. This directory structure is different from the previous one in several important ways. First, each standard has a single root that contains sub-directories for each part of the standard. For example, the directory standards.iso.org includes the 19115 sub-directory and it includes -2 and -3 sub-directories that include sub-directories for each namespace defined in each part of the standard. Second, the namespace directories have no working dates. For example the mdb namespace is in the directory standards.iso.org/19115/-3/mdb/1.0. This anticipates the directory structure at the eventual target for these schemas (http://standards.iso.org).
