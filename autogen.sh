# !/bin/sh -e

if [ `(uname -s) 2>/dev/null` == 'Darwin' ]
then
	glibtoolize --copy
else
	libtoolize --copy
fi
aclocal -I m4
automake --foreign --add-missing
aclocal -I m4
autoreconf

