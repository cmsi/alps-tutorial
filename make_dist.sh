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

make default

DIR="$BASE"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR/jp $DIR/en

cp -fp overview/overview-normal.pdf $DIR/jp/01_overview.pdf
cp -fp installation/installation-normal.pdf $DIR/jp/02_installation.pdf
cp -fp tutorial/tutorial-normal.pdf $DIR/jp/03_tutorial.pdf
cp -fp python/python-normal.pdf $DIR/jp/04_python.pdf
cp -fp pyalps/pyalps-normal.pdf $DIR/jp/05_pyalps.pdf
cp -fp matplotlib/matplotlib-normal.pdf $DIR/jp/06_matplotlib.pdf
cp -fp alpsize/alpsize-normal.pdf $DIR/jp/07_alpsize.pdf

cp -fp overview/overview-en-normal.pdf $DIR/en/01_overview.pdf
cp -fp tutorial/tutorial-en-normal.pdf $DIR/en/03_tutorial.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR

DIR="$BASE-wide"
rm -rf $DIR $DIR.tgz $DIR.zip && mkdir -p $DIR/jp $DIR/en

cp -fp overview/overview-wide.pdf $DIR/jp/01_overview.pdf
cp -fp installation/installation-wide.pdf $DIR/jp/02_installation.pdf
cp -fp tutorial/tutorial-wide.pdf $DIR/jp/03_tutorial.pdf
cp -fp python/python-wide.pdf $DIR/jp/04_python.pdf
cp -fp pyalps/pyalps-wide.pdf $DIR/jp/05_pyalps.pdf
cp -fp matplotlib/matplotlib-wide.pdf $DIR/jp/06_matplotlib.pdf
cp -fp alpsize/alpsize-wide.pdf $DIR/jp/07_alpsize.pdf

cp -fp overview/overview-en-wide.pdf $DIR/en/01_overview.pdf
cp -fp tutorial/tutorial-en-wide.pdf $DIR/en/03_tutorial.pdf

tar zcf $DIR.tgz $DIR
zip -r $DIR.zip $DIR

# notebook
if test -z "$DATE"; then
  tar zcf $NOTEBOOK.tgz notebook
  zip -r $NOTEBOOK.zip notebook
else
  rm -rf notebook-$DATE && mkdir -p notebook-$DATE
  cp -rp notebook/* notebook-$DATE
  tar zcf $NOTEBOOK.tgz notebook-$DATE
  zip -r $NOTEBOOK.zip notebook-$DATE
fi
