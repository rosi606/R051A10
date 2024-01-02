#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�H�b  V_� �����?����@(��p�4A=SL!�0��`�44h��i�0�OI������O#)��OPOPh��x��ڄj�����M �4 @hi��F�(��h�����茇�P��� 44mM��2��fEI4FB�*�Ԛovq����SF�d����H��i��ha�(NF���V%Q�Ģ�n�"��UN�L��ieJ�<�t0����.|O��eRbmb�fa��$i	����KQ����M��1m��8����9=# ��"��n���/~�[�Ҥd�$.�u�Ŕ` N�Ude��A�1>ȘG�z�j��}��w��;ߪI!�<LgYv�{���5�]�;��o��/����]��٨�h�sg��^��1�Z��z�����Uj/ �Q���ט\I� w�{��s�:��+��/B�H�����E�[7K"��qŮH}��J���J���'s!��5�I�J�������Si�+���J<8��{�?1���0���s���6Ģ���⻾��-�o!�ru��S �)Hx@-�Ɂha�-�'���S��&	3����v��u8`��6���Ԍ��|�rR���i���P{z����e^YZ�U���G�) @V�A�O�w$S�	d�� 