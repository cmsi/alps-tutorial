#!/bin/sh

DATE=`grep '^\\\\date{' style/alpstutorial.sty | sed 's/\\\\date{//g' | sed 's/}//g' | sed 's/-//g'`

if test -z "$DATE"; then
  echo "VERSION = NONE"
  BASE="alps-tutorial"

else  
  echo "VERSION = $DATE"
  BASE="alps-tutorial-$DATE"
fi

make default

DIR="$BASE"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR

cp -fp overview/overview-normal.pdf $DIR/01_overview.pdf
cp -fp library/library-normal.pdf $DIR/02_library.pdf
cp -fp tutorial/tutorial-normal.pdf $DIR/03_tutorial.pdf
cp -fp python/python-normal.pdf $DIR/04_python.pdf
cp -fp pyalps/pyalps-normal.pdf $DIR/05_pyalps.pdf
cp -fp matplotlib/matplotlib-normal.pdf $DIR/06_matplotlib.pdf
cp -fp alpsize/alpsize-normal.pdf $DIR/07_alpsize.pdf
cp -fp installation/installation-normal.pdf $DIR/08_installation.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR

DIR="$BASE-wide"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR

cp -fp overview/overview-wide.pdf $DIR/01_overview.pdf
cp -fp library/library-wide.pdf $DIR/02_library.pdf
cp -fp tutorial/tutorial-wide.pdf $DIR/03_tutorial.pdf
cp -fp python/python-wide.pdf $DIR/04_python.pdf
cp -fp pyalps/pyalps-wide.pdf $DIR/05_pyalps.pdf
cp -fp matplotlib/matplotlib-wide.pdf $DIR/06_matplotlib.pdf
cp -fp alpsize/alpsize-wide.pdf $DIR/07_alpsize.pdf
cp -fp installation/installation-wide.pdf $DIR/08_installation.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR
