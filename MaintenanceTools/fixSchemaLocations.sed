#
# These are the regular expressions required for fixing namespace repositories in xsd files
# thabermann@hdfgroup.org
#
s_schemaLocation="../../../ISO19110/(fcc|gfc)/([0-9\.]*)/_schemaLocation="../../../../../19110/\1/\2/2014-12-25/_g
s_schemaLocation="../../../ISO19111/(rbc|rce)/([0-9\.]*)/_schemaLocation="../../../../../19111/\1/\2/2014-12-25/_g
s_schemaLocation="../../../ISO19115-3/(cat|cit|gcx|gex|lan|mac|mas|mcc|mco|md1|md2|mda|mdb|mds|mdt|mex|mmi|mpc|mrc|mrd|mri|mrl|mrs|msr|srv)/([0-9\.]*)/_schemaLocation="../../../../../19115/-3/\1/\2/2014-12-25/_g
s_"http://www.isotc211.org/namespace/(pre|reg)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19135/-2/\1/\2/\3"_g
s_schemaLocation="../../../ISO19139/(gco|gmw)_schemaLocation="../../../../../19139/\1/1.0/2014-12-25/\1_g
s_schemaLocation="../../../ISO19139rework/(gco|gmw)_schemaLocation="../../../../../19139/\1/1.0/2014-12-25/\1_g
s_schemaLocation="../../../ISO19157/(dqc|dqm|mdq)/([0-9\.]*)_schemaLocation="../../../../../19157/-2/\1/\2/2014-12-25_g

s_namespace="http://www.isotc211.org/2014/gco"_namespace="http://standards.iso.org/19139/gco/1.0"_g