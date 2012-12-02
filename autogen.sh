# !/bin/sh -e

if [ `(uname -s) 2>/dev/null` == 'Darwin' ]
then
	glibtoolize --copy
else
	libtoolize --copy
fi

automake --add-missing

autoreconf

