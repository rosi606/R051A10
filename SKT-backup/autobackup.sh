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
BZh91AY&SY�:�y  ���  ���?�߯����P�{;�e�G\�"h)��S��4� hڙ=M�4��=#F�!0Bd4�!� �  �Bjj4hI�&jz@h�2i��� 9��F�#A��&&��2�$D�2e<�4�4G� �A�D�3aw#Ԟi����4Ԝ��X��Õ4�`c^�,QӨZ�$��a�Ҽd�ei����CP�6��0Rm׼F&����z����_7��E�2�<��L1C������N�7�MX�N�lC��<�>&w���w-�� ����3�cl�r<Sp�Ӿ������J��v��4N��Q+�Nf�m�-*M �']�@ݫ�q!bB��([jD'@q;�譭C���h��ЄB��a�BQV��Ⱥ���H�	�� _Uw���G��傻'&2؀��L9֡	�<��)�u��x&m��m���
��B
�;����"w����H�̑�oI��u�D�j7F�|�\-�A_$�Ö���
*��zTDO� rß��37JS���?���TN`в'9��Y��U��:�-��|vbW�����O�@�VV^���3_��d����iˣ���n�s�R����r)��On�;�8�4&�@�)񢞾Ԧ�h��sbӦ�����gd�)E�����o����F%?�kW��atv�6\(���;!<�H$%`)]9*(PԋI�P��H�u"j1׏��ٽ`�}{�-&N1�J�A	�Sh�X�㊓�
�3��B �ٲD�P"#�X)�km��H߀X�~�t.���ECr�R��4����m3L�[�K�n��S�n��ب�\��(��'Ao��dV�5�����R�9%r���#m>� ��	�Q��ٺ ;��,��̍O)���l�Kr�/*f���Ah3�ө,�q�dD-4�? ��PXv����̌'b��j�HˁZw���ڌN]�-�KJ6�9"'���1��Y���czG)Q����o@@B�(�V��  E����+(����b�'�|y�Ǯ�lW�R
���QUZ�����C,*I3EF:7Z*&S�n�P��2��Xb��k6�c�KX�䄸񔙑b�1V	{�幏%*�V0d�YDؑ�]���ܑN$ �^@