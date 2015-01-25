#!/bin/sh

SCRIPT_DIR=`echo $0 | sed "s/convertFromScratch.sh//"`

$SCRIPT_DIR/css3fonts --clean
rm hinted-*.ttf
$SCRIPT_DIR/css3fonts --use-font-weight --output=weighted-stylesheet.css  $*
$SCRIPT_DIR/css3fonts --use-font-weight --use-font-prefix=hinted- --autohint  --output=hinted-stylesheet.css *.ttf