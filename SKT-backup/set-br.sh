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
BZh91AY&SYQ�/�  R߀ }�����,����@��@�P���L��4  4   �4a 5Ğ�S�zG�   � ��4bh`&�&�2bFF�aL$���2�2i�z�j�HPɐ��ީ�����G�*�4 "gTPf�i�)��C�W��" |M"����1h���?T�;��\ G�To8�H:v\���B��J��vL'��)	�HpB�b�l����Kg�C�5/)���_E�WsFy��J>~�=�DT�E���6V�u����&(���&�������`���{���Y`�rY两�ťq����h�����>>)�>1W���/q.9Մ��A�#(,��XUF��&�$�R�7���ǒ�rW�>Ey��cO�����H��5�	/Zh.�$>^�xp%y�ޗ.�34:R��r�����xNǞ�9�	)Q."Ng%��p�!�m0��x)���o��O���Z���<��(+�H�8,W�l�Q�R��+�E�����%�n}����]x�[�
`M-���Z�h��I�P35 ��%��lLk�C#0��KQd6��RY��2h��ց��������r��[ܕ�;Q͌��F�*v~��Z#->����:�ױ|���r��W�^�DwQb�=W|s��NH��X(�����D���tó$v
%Ɣ�P�Y,�� ��B��s�j��� ���X���<6┊B�u&����A�* ��SB�(x� ��OځB��sOUD �=g��Y]��꤭�+� �2XI.Uy<�?�f�GA�o�]��BAG��D