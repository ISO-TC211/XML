Working ISO TC211 XML Schema Repository
===

XML schema, transforms, schematron rules, and examples for ISO TC211 Metadata Standards

__201803 Update__ Schema and namespace changes related to the ISO 19115-1 and ISO 19157 Ammendments, and the ISO 19115-2 Revision were included in this repository early in March 2018. We are working with ISO to migrate these changes to standards.iso.org as soon as possible. Please submit issues to this repository if you find problems with these updates. The wiki page Namespace Updates 2018 03 describes the changes.

This repository contains draft XML schema and related documents for the ISO TC211 metadata (ISO 19115-1) 
and data quality (ISO 19157). These are not final schemas for these standards but may be suitable for 
initial testing and familiarization. They are provided here to support those kinds of use cases 
without any expectation for persistence.

The current version of the official schema are at <http://standards.iso.org/iso>. These official schemas are also in the standards.iso.org directory of this repository. The directory standards.iso.org/iso includes a sub-directory for each ISO Standard.

# The ISO TC211 Schema Repository
The ISO TC211 XML Schema repository is located at <http://standards.iso.org/iso>. Each part of each standard has a directory like: http://standards.iso.org/iso/StandardNumber/PartNumber/NamespacePrefix/Version. For example:
<http://standards.iso.org/iso/19115/-3/cit/1.0> or
<http://standards.iso.org/iso/19157/-2/mdq/1.0>. Comments, suggestions, change requests and revisions are managed in this repository, i.e. [ISO TC211 Git Repository](https://github.com/ISO-TC211/XML).

A zip archive of the complete official schema is available at http://standards.iso.org/iso/19115/19115AllNamespaces.zip.

Summary information about all of these namespaces is avaialble at http://standards.iso.org/iso/19115/resources/namespaceSummary.html. Each namespace directory in the repository has an index file that provides information relevant to the namespace and links. These files are described below.

## Package Diagram
UML Package Diagrams show dependencies between the current namespace and others as well as the entities defined in each namespace.
## Description
The Description includes information about the ISO Standard implemented in the namespace and general information about the purpose and content of the namespace.
## Sample XML Files
Each namespace directory includes sample XML files for the namespace and for demonstrating related schematron rules. The namespace sample files are called xxx.xml (for namespace xxx). The schematron rule examples include xxx_valid.xml and xxx_invalid.xml examples for each schematron rule.
## Codelists
If the namespace includes codelists, an xml (codelists.xml) and html (codelists.html) version of the codelists are provided.
## Namespace Location
The standard location for namespace xxx is http://standards.iso.org/iso/StandardNumber/PartNumber/xxx/Version. For example:
<http://standards.iso.org/iso/19115/-3/cit/1.0> or
<http://standards.iso.org/iso/19157/-2/mdq/1.0>.
## Schema Location
The standard schema for namespace xxx is http://standards.iso.org/iso/StandardNumber/PartNumber/xxx/Version/xxx.xsd. For example:
<http://standards.iso.org/iso/19115/-3/cit/1.0/cit.xsd> or
<http://standards.iso.org/iso/19157/-2/mdq/1.0/mdq.xsd>.
These XML schema include (indirectly) all the implemented concepts of the xxx namespace, but they do not contain the declaration of any types.
## Related Schema
The xxx.xsd files reference other schemas that define the types included in the namespace. These usually have more descriptive names than xxx.xsd, e.g. citation.xsd.
## Related Namespaces
If there are dependencies  between namespace xxx and others, the standard prefix for the namespace, the URI (absolute), and the schema location (relative) are listed here.
## Schematron Rules
If the namespace includes requirements that can not be tested 
