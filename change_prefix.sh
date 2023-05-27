#!/bin/sh

make clean

#search e_* files| e_file s21_file... | grouping by n=2 strings for mv
find e_* -type f | sed 'p;s/e_/s21_/' | xargs -n2 mv

for FILE in $(ls | grep -e.sh -e.bak -v)
do
  if [ -f $FILE ] ; then
  echo "processing "$FILE
  sed -i.bak 's/^e_/s21_/g' $FILE
  sed -i.bak 's/ e_/ s21_/g' $FILE
  sed -i.bak 's/_e_/_s21_/g' $FILE
  sed -i.bak 's/\"e_/\"s21_/g' $FILE
  sed -i.bak 's/\/e_/\/s21_/g' $FILE
  sed -i.bak 's/(e_/(s21_/g' $FILE
  sed -i.bak 's/)e_/)s21_/g' $FILE
  sed -i.bak 's/!e_/!s21_/g' $FILE
  sed -i.bak 's/ E_/ S21_/g' $FILE
  sed -i.bak 's/_E_/_S21_/g' $FILE
fi
done
rm -rf *.bak  #backup files removing
make style
