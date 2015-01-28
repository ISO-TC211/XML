#
# These are the regular expressions required for fixing namespace repositories in xsd files
# thabermann@hdfgroup.org
#
s_"http://www.isotc211.org/namespace/(fcc|gfc)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19110/\1/\2/\3"_g
s_"http://www.isotc211.org/namespace/(rbc|rce)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19111/\1/\2/\3"_g
s_"http://www.isotc211.org/namespace/(cat|cit|gcx|gex|lan|mac|mas|mcc|mco|md1|md2|mda|mdb|mds|mdt|mex|mmi|mpc|mrc|mrd|mri|mrl|mrs|msr|srv)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19115/-3/\1/\2/\3"_g
s_"http://www.isotc211.org/namespace/(pre|reg)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19135/-2/\1/\2/\3"_g
s_"http://www.isotc211.org/namespace/(gco|gml)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19139/\1/\2/\3"_g
s_"http://www.isotc211.org/namespace/(dqc|dqm|mdq)/([0-9\.]*)/([0-9-]{10})"_"http://standards.iso.org/19157/-2/\1/\2/\3"_g
