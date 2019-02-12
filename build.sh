#!/bin/sh
set -e

for CC in clang gcc; do
	for ptype in pie pic; do
		PTYPE=$(echo $ptype | tr a-z A-Z)
		$CC -Wall -f$PTYPE -c -o lib_${ptype}_$CC.o lib.c
		objdump -r -S lib_${ptype}_$CC.o > lib_${ptype}_$CC.txt
	done

	PATH=/usr/local/bin:$PATH diffoscope --html $CC.html lib_pic_$CC.o lib_pie_$CC.o || true
done
