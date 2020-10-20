#!/usr/bin/env sh
DIR="$( cd "$( dirname "$0" )" && pwd )"
INAME="./src/main.pdf"
ONAME="./resume-compressed.pdf"
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4  -dPDFSETTINGS=/ebook -dNOPAUSE \
  -dQUIET -dBATCH -sOutputFile=$DIR/$ONAME \
  $DIR/$INAME

printf "Compressed file %s to %s\n" $INAME $ONAME
