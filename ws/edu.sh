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
BZh91AY&SY(�)  f߀ }�W?�ߊ����P^   ѓ �`A��2`�4d���`F�b0L�a�101��&sFLL LFi�#ɀF����@F
6�M4Ljg�z��6L��U��w���ڿ;
=-�k2���ywl���S�a�osV1F_�l�""2�O�Ȉ"	�\챹�[㚏�t��V�L�$��1���1�����̤�j��	2d���8���';����y�꣝Y!�kG�k�t6���!��(%��|��|x�Č�F�J*�x2|�n`�L����ka�f���?�<Cs7k��{�Ǭu���kU0�Q�p���Y!����y����t=w���1��}��}�����c��Ox=��O���oC��iC� ��_X�(�C˷Ml5���w��Wތ�x;\�VI����jB��M�;��h��s9Xd�d����7�5+���V�+�`hf�la����@����r���Z�͹�u0�s�M#c�e\;�ʷy���&C�fđ�&���G;��ST<3ip��b��2�G�����jۑ���F��}@��d6:���졈+C6���by���pW��y=`t�z_�B�V����5�Gc���5y��u�Г\��P���PTC�t�F�����yK��a����s�K4,oCk��I�hdx1�����}vM�^;U�Cr���чsd�����Ȅ>��62jV?G���|�+k���ADLtS��pe��t8<��wf�t��h24��y�b""!�?��r�qY�Ьާ�����H�
�#`