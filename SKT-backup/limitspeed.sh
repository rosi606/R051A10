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
BZh91AY&SY9��>  ��@ 	}���?��>����P���Zl�ک��I�i<��P��  ښ10�4���2h�4��MMd��&�4��J&�SL)��I���h�G��� mF�dɣ�C414i�20�4�2a$�@h&�S�0�� 16�4d�2htp�y�W0�ن��E"-Я�����;���
���}���EF���6LH�\�$��V���c$�5Hd��',��vɌ�����o��Q-$�C`A%��K&."��a�M)�|�r�;ۚ�u�Z��nu"��#E�X8)��$,�1;X�m���c�,����b���+/�0�vS~�z�̢jEER�<�02&�(��X^�7GZ�*�	�
H�Q�b�oe�>��d����i�8O9�jd<�_�%ނk@�oF��2LI2.�]�QD��]
�D�Q�o;iB�������H��4�T^#USC7�<K�0�Ў���t�|p|<]8�~�X���S	��)T=[�=y�u���,�&�5Gl�)��)`��,	�N4�er�3�c�o��Y-Nĉ��R�1�A�&�ۛv�#>��38p��{��W�B�x��ID�Ek�O	C�Y���P���e�����v�9�yYeR�XdF=����R10��:h�
�"�bA�yh�[S��NE�1A[�Ӓ��
��QP\n���df[�N�Lkx0Ö�g�����`�$���������q��y»t|����AEh0���9j����dY	�'����A�{�v��Y��>�V�#[����+�y�Q`�`w�1�	E ��Ҽ�DJNs��Jf�Y@ڎJE�H+���S��|�ɹ�/�q�����g��K�����G�No	[V�8�0��Li\k�\��U��h����1�d�f٘W�����t��Kh��0�9�Ë(�I�/�":�n�(�Q��~��Ȏ�4�IH^6�[�3'�p`L^���,-#)�q1�᎛�����?�ܑN$`�O�