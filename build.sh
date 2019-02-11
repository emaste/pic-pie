#!/bin/sh
set -e

for CC in clang gcc; do
	$CC -Wall -fPIC -c -o lib_pic_$CC.o lib.c
	$CC -Wall -fPIE -c -o lib_pie_$CC.o lib.c

	objdump -r -S lib_pic_$CC.o > lib_pic_$CC.txt
	objdump -r -S lib_pie_$CC.o > lib_pie_$CC.txt

	PATH=/usr/local/bin:$PATH diffoscope --html $CC.html lib_pic_$CC.o lib_pie_$CC.o || true
done
