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
BZh91AY&SY�e�M  S_� }���?�߬����@	v�a!(M$�G�E==�ڌh���mD�M���b �F�h4��d49�L�����a0CLM0�i�     h ����w��~��H���lrgc��o&Qc�8�R��0�D�2N��k��������Z��4��Ǵ�C+*����:� St�J3�%�.�n%�b�h
�
�Ղ�Z��)0��tA��F�D� [2L�)HKD�l���b�+z ���������t�KO:U4vT�nPb�C�K%o��i�@-�N�μ7I��)x��&���NJV��@c��[�����T�;��&��yl%4��C��=��cR̆܍#��>Y����ay]�ʖ_^�P��-٧l�Q��<�QVq���ƪ�6��bu㶚�e%F�_�y�Vܚ�b�����Z3ccd�WG会��<}`�:U�Uq!*�㊅l4�3{�$���&�

���R*ua�SDt�
����iK�J���@$r뢩VV<ɂ�D���C�����r(��ʄe:�#���=��$W��B���rE8P��e�M