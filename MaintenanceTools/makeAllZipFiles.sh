#
# makeAllZipFiles.sh
#
# This utility creates zip files with the schemas at several levels:
# all inclusive files for each standard, e.g. ./iso/19115/19115.zip
# and namespace specific zip files are created in each namespace directory
# e.g. ./iso/19115/-3/cat/1.0/cat.zip
#
# run this script from XML/MaintenanceTools directory
#
# remove all existing namespaces
echo "Remove existing zip files"
find ../standards.iso.org -name *.zip -print
find ../standards.iso.org -name *.zip -delete
# 
# create the zip files in 19110 namespaces
#
pushd ../standards.iso.org/iso/19110/fcc/1.0;	zip fcc.zip *; popd
pushd ../standards.iso.org/iso/19110/gfc/1.1;	zip gfc.zip *; popd
# 
# create the zip files in 19111 namespaces
#
pushd ../standards.iso.org/iso/19111/rbc/1.0;	zip rbc.zip *; popd
pushd ../standards.iso.org/iso/19111/rce/1.0;	zip rce.zip *; popd
# 
# create the zip files in 19115 namespaces
#
pushd ../standards.iso.org/iso/19115/-2/gmi/1.0;	zip gmi.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/cat/1.0;	zip cat.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/cit/1.0;	zip cit.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/cit/2.0;	zip cit.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/gcx/1.0;	zip gcx.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/gex/1.0;	zip gex.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/gmw/1.0;	zip gmw.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/lan/1.0;	zip lan.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mac/1.0;	zip mac.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mac/2.0;	zip mac.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mas/1.0;	zip mas.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mcc/1.0;	zip mcc.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mco/1.0;	zip mco.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/md1/1.0;	zip md1.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/md1/2.0;	zip md1.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/md2/1.0;	zip md2.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/md2/2.0;	zip md2.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mda/1.0;	zip mda.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mda/2.0;	zip mda.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mdb/1.0;	zip mdb.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mdb/2.0;	zip mdb.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mds/1.0;	zip mds.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mds/2.0;	zip mds.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mdt/1.0;	zip mdt.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mdt/2.0;	zip mdt.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mex/1.0;	zip mex.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mmi/1.0;	zip mmi.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mpc/1.0;	zip mpc.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrc/1.0;	zip mrc.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrc/2.0;	zip mrc.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrd/1.0;	zip mrd.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mri/1.0;	zip mri.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrl/1.0;	zip mrl.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrl/2.0;	zip mrl.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/mrs/1.0;	zip mrs.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/msr/1.0;	zip msr.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/msr/2.0;	zip msr.zip *; popd
pushd ../standards.iso.org/iso/19115/-3/srv/2.0;	zip srv.zip *; popd
pushd ../standards.iso.org/iso/19115/resources;	zip -r resources.zip *; popd
# 
# create the zip files in 19135 namespaces
#
pushd ../standards.iso.org/iso/19135/-2/pre/1.0;	zip pre.zip *; popd
pushd ../standards.iso.org/iso/19135/-2/reg/1.0;	zip reg.zip *; popd
# 
# create the zip files in 19155 namespaces
#
pushd ../standards.iso.org/iso/19155/gpi/1.0;	zip gpi.zip *; popd
# 
# create the zip files in 19157 namespaces
#
pushd ../standards.iso.org/iso/19157/-2/dqc/1.0;	zip dqc.zip *; popd
pushd ../standards.iso.org/iso/19157/-2/dqm/1.0;	zip dqm.zip *; popd
pushd ../standards.iso.org/iso/19157/-2/mdq/1.0;	zip mdq.zip *; popd
#
# create the zip files for each standard - these include the up-to-date
# namespace archives
#
pushd ../standards.iso.org/iso/19110;zip -r 19110.zip .; popd
pushd ../standards.iso.org/iso/19111;zip -r 19111.zip .; popd
pushd ../standards.iso.org/iso/19115;zip -r 19115.zip .; popd
pushd ../standards.iso.org/iso/19115;zip -r 19115AllNamespaces.zip ../*; popd
pushd ../standards.iso.org/iso/19135;zip -r 19135.zip .; popd
pushd ../standards.iso.org/iso/19139;zip -r 19139.zip .; popd
pushd ../standards.iso.org/iso/19155;zip -r 19155.zip .; popd
pushd ../standards.iso.org/iso/19157;zip -r 19157.zip .; popd
#
# list all zipfiles
#
echo "Existing zip files"
find ../standards.iso.org -name *.zip -print > zipFileList.txt
cat zipFileList.txt


