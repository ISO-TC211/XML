#
# These are the regular expressions required for replacing version dates in xsd files
# thabermann@hdfgroup.org
#
s_xmlns:([a-z0-9]{3})="http://www.isotc211.org/namespace/([a-z0-9]*)/([0-9\.]*)/([0-9-]{10})"_xmlns:\1="http://www.isotc211.org/namespace/\1/\3"_g
s_schemaLocation="../../../../(ISO[0-9-]*)/([a-z0-9]*)/([0-9\.]*)/[0-9-]{10}/[a-z0-9]*.xsd"_schemaLocation="../../../\1/\2/\3/\2.xsd"_g
s_namespace="http://www.isotc211.org/namespace/([a-z0-9]*)/([0-9\.]*)/[0-9-]{10}"_namespace="http://www.isotc211.org/namespace/\1/\2"_g
s_targetNamespace="http://www.isotc211.org/namespace/([a-z0-9]*)/([0-9\.]*)/[0-9-]{10}"_targetNamespace="http://www.isotc211.org/namespace/\1/\2"_
