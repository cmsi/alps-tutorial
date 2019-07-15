#!/bin/sh

DATE=`grep '^\\\\date{' style/alpstutorial.sty | sed 's/\\\\date{//g' | sed 's/}//g' | sed 's/-//g'`

if test -z "$DATE"; then
  echo "VERSION = NONE"
  BASE="alps-tutorial"
  NOTEBOOK="alps-notebook"
else  
  echo "VERSION = $DATE"
  BASE="alps-tutorial-$DATE"
  NOTEBOOK="alps-notebook-$DATE"
fi

make -j4 default

DIR="$BASE"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR/ja $DIR/en

cp -fp overview/overview-normal.pdf $DIR/ja/01_overview.pdf
cp -fp installation/installation-normal.pdf $DIR/ja/02_installation.pdf
cp -fp tutorial/tutorial1-normal.pdf $DIR/ja/03_tutorial1.pdf
cp -fp python/python-normal.pdf $DIR/ja/04_python.pdf
cp -fp pyalps/pyalps-normal.pdf $DIR/ja/05_pyalps.pdf
cp -fp tutorial/tutorial2-normal.pdf $DIR/ja/06_tutorial2.pdf
cp -fp alpsize/alpsize-normal.pdf $DIR/ja/07_alpsize.pdf

cp -fp python/python.ipynb $DIR/ja
cp -fp pyalps/crash_course_pyalps.ipynb $DIR/ja

cp -fp overview/overview-en-normal.pdf $DIR/en/01_overview.pdf
cp -fp tutorial/tutorial1-en-normal.pdf $DIR/en/03_tutorial1.pdf
cp -fp tutorial/tutorial2-en-normal.pdf $DIR/en/06_tutorial2.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR

DIR="$BASE-wide"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR/ja $DIR/en

cp -fp overview/overview-wide.pdf $DIR/ja/01_overview.pdf
cp -fp installation/installation-wide.pdf $DIR/ja/02_installation.pdf
cp -fp tutorial/tutorial1-wide.pdf $DIR/ja/03_tutorial1.pdf
cp -fp python/python-wide.pdf $DIR/ja/04_python.pdf
cp -fp pyalps/pyalps-wide.pdf $DIR/ja/05_pyalps.pdf
cp -fp tutorial/tutorial2-wide.pdf $DIR/ja/06_tutorial2.pdf
cp -fp alpsize/alpsize-wide.pdf $DIR/ja/07_alpsize.pdf

cp -fp python/python.ipynb $DIR/ja
cp -fp pyalps/crash_course_pyalps.ipynb $DIR/ja

cp -fp overview/overview-en-wide.pdf $DIR/en/01_overview.pdf
cp -fp tutorial/tutorial1-en-wide.pdf $DIR/en/03_tutorial1.pdf
cp -fp tutorial/tutorial2-en-wide.pdf $DIR/en/06_tutorial2.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR
