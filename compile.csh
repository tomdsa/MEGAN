#!/bin/tcsh
#
# ================================================================================================
#                                                                                   [环境变量配置]
  setenv NETCDF "/home/tools/NETCDF"
  setenv IOAPI3 "/home/tools/ioapi-3.2"

  set MODEL  = `pwd`
  set CLEAN  = "$1" # NONE, lib, clean
# ================================================================================================
#
# //lib link//
rm -rf   "$MODEL/lib"
mkdir -p "$MODEL/lib"
ln -sf $NETCDF $MODEL/lib/netcdf
ln -sf $IOAPI3 $MODEL/lib/ioapi
tree -C $MODEL/lib/
if ( "$CLEAN" == "lib" ) exit 0

# //megan v3.1//
# ================================================================================================
foreach TASK ("prep4cmaq" "daymet" "ioapi2uam" "megcan" "megsea" "megvea" "met2mgn" "met2mgn_rad45" "mgn2mech" "txt2ioapi")
/bin/echo -e "\033[31;1m >> $MODEL/$TASK \033[0m"

  cd $MODEL/$TASK/src/
  if ( $CLEAN != "clean") then
    make ; if ($? != 0) exit 1
  else
  make clean
  endif

end

if ( $CLEAN == "clean" )  then
  cd $MODEL/ && rm -rf lib
endif
