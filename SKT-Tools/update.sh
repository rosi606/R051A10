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
BZh91AY&SY\�s ���p}���.ގ����  �� @ P"�e)��CXI!LM2i2`Bd����2!�a2a?T��=@)1
~���MG����  �   �iS�5'�O)����h     d�4244����ѦC�$D�2FS��<Q�4�Ѡ�F���D�t.n�%��u-2�T�w��%WK�vi��X�{�Z->�@��-gC����f����$��߽b��>�=�g���1:�X�y�K�g�ؕ#LX���K!��H�³���^2�+5w�y��q ՜��|�G��Q�l��_�y���E蕾��DZŢ|rH1��-���X�Ysf�+"�Y]�hX9��`}�B�crk�!�۞!]��G��k�1��eҨw`�s�v9,�*�"�ar�\�50�J����|�/��E�h��+��*�m��� F���s��Tִ|�G�e)c��蔴���(0��<B}\o@%dvIRB�8��s��z�|Q$�& }:���£Rp�����1,�t�vD0���ŉjA�hB�\8N��%3Ķ�,��5�},C-L!��*�ڹ��9$�w�+6���=���J��w7�b�3�����C�p2I���3w	��3Y��I*�!$�����%e����_ V��.A��|JP,�&���v��J&��`	`[$$wE��x��;�~�T��]�%�e̱8ӡ���4�N��<����	�v�Q��W�Veh"!���!D�����ip��$ �v�(|/<&��%�HY��zF2�ch4'U�	B%���)�L�����[IV��� !C�H�P&T�&0��+��*l�O��惌���,Ko��!��3��F����32P�����@�>�x��<�m��7(:iV�>$��\��1�9�Wp��	��*��F��L�,��c���kUu�ԅ%���{��B�w�+ɽmʬE�7�[uR�x%g=�)�a114�RR;�7I�vw�ӖR�QB��,ۡ �UT'����@�)� s�N/́�e�:64ƴ�P3ņu�@�i�ӌ�gx������}�e8�ВK��I��	4��.�p� �L$�