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
BZh91AY&SY�$8B  �߀P}���>�ޮ?���@�m���(�"=&�!���� � ��% #L��5b 4� =A�1 �&L��L �0L�0�IM'���<SЛD�HɠdCE�Ry{W6�1���C��"f����e%�7��,U��j/\ke���hY��,�42����(Z�2P �p���!��a["�u�zU�m%;�?��W�,���|�}�ް�^���*�1v�BU�W����E-Rd�K��C�B'�ф�8�8�s=%�E#�as<�=	F�T�z��k�5zR&���@���_��!�Q�w�(l%��ߵ7Ol �+ӣ�!82i��٧<F�"�X�CK�&�j5��;�R�B��aq��F��{��B3%�r�9]�U�y�����ɖc۱<c,�vu����ftxY�_�x�N�cK�p(PΖ��e� ���Z�E/4�����@�2n�$,F[ǐqU�*��Y��Ϛf:�>dsVMH�o7V`��q�O8��dEyD���/H��"�(���vM�mLџn�+�SW�λ��*�UU$���J ��4=zF_�#����q�����ƞS��L�{d���
�5<� ��	��mUS�a�tĊCٛ�z^r�\�=��dX�1}�K�����iM�T0���2!P��J+}�]:�Z� ֎Q���`�d�� =(A0�V=˨c��&�]0�$>�y=���-�4Be�Ή/#�ܑN$/I�