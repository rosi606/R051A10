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
BZh91AY&SY,��� O��p1 ���?�ݎ����`x���R��P  "����4��&@4��F�@ @dɣ@h����`MbF� 0�&MF���Ch�b4@�DH�OI<S ƦOP�M44 �4= h8ɓF�Ѧ##C��4�� `� �524&Si1@�=G��22dڇ��m'�=��:����?�a���S�S�_���c^�t1|m�����V���҆�D2QLo7nL[�$jZ�m�8zc�0K��ư.�!%a:3�ו3� |x��kϤ��p��
H!���֖/����m��zO��[A���V�IF�@�/�զ]�b�&��rsGBb�r$xP˃�V�d�j�F�B��aq�u3t���!{�nݞ������m����n.�>�[4]L�יڴ�����X(�'�!4�4���s�,�@&�x���7B�<�N�0� ZNvR_D��R���t�YRD�7|��:l���#nVȷ�����>�A7BI$xN�&&bUm)ik<���0"hgq٬��{0��� �e�V���,�2���D��j �Φf���m2�j��Mb7.���W����u(e�]`tm�I��J�oKP��^w��]�"i�ᯎD�!�h/��m��w��T$�)��N��;�K��	��`�{1)X�h��I�Q�m���`l�y*� ��>.�P1Z��vc�,7�62@��	\Hp�1E-�ڢB�Y���6n0&��9�S��\p�
!`����?Ww��N'���1K&���d�e�_�HG��"Bhm|�3��/�e;+F��H�0��Au���i	W��F�k�RQa%��#N=,�I��^�Azo4gH�bxO��B�;��-Su��$#�HG	�%&�`��9�#,txj|�|E��$7���v�"Ս�2K+=�;!�u�ڱq� ���9M�˔cr�)�L������~Z**�1�V��C(tn�d{�_�h�.T�Lq,�H�å"r>#oA��R<h�)/��	g���Ӏ�3r��Ą5��L��Khv��&#=�J۞�K+"%gK��mHH�
�)	��r6�# (����jh�3�X	A�4�xr���^��yTE��H�)��X��V/��i1\HC6�w����y�rA�L����F��i�?~Jq�A�!�P��ۃ��o	�vO�S���I�bH�	H�,�}�v(� KCx
ޮ<����a���R-��İ	X&xRq�,��Qu�[�(ͿH����	��R6�;��Z�=z:�]�?D,�#��Ѐ�<J�HH��֛���v�9j$)&�T-2P0���WJBE��N��\x�@H�r�h��a��HL4��`~�Ө�<a2�&�ĈA�N"��l=%�,'��S��k������L$�F֗T�>�[��z踄���<�#j뤌�����U%�
R\��$"��:�|w��m$�@$�АC��,:#ae>�bi��{���H��%�D˥�)���P�6�K��5���˯�vy��*��qv�lVP��!HrpJ�f'P��[��E�\/`_�́-ŧ
݌���+l7��������� 3���Ew6a�݀cZ����/�<GoU��2��3�%[�F7�D����Vl�E��5[s ސ#���aPf�+8jaqȭo�!�@\Vaw��HFu�]���G$LC@� j"rcv��ԛ
����	�H@�cQ^��>�k��1�4��!� Ek}�+��Y.��7�ʹ�Dr�Y�p)��F� ����f�u/�� کw��TH��"����o�~�q��Ɓ#>P�Al���w$S�	�l��