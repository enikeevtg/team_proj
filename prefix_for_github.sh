#!/bin/sh

make clean

#search s21_* files| s21_file e_file... | grouping by n=2 strings for mv
find s21_* -type f | sed 'p;s:s21_:e_:' | xargs -n2 mv

for FILE in $(ls | grep -e.git -e.sh -e.out -elib -e.bak -v)
do
  if [ -f $FILE ] ; then
  echo "processing "$FILE
  sed -i.bak 's:^s21_:e_:g' $FILE
  sed -i.bak 's: s21_: e_:g' $FILE
  sed -i.bak 's:_s21_:_e_:g' $FILE
  sed -i.bak 's:\"s21_:\"e_:g' $FILE
  sed -i.bak 's:\/s21_:\/e_:g' $FILE
  sed -i.bak 's:(s21_:(e_:g' $FILE
  sed -i.bak 's:)s21_:)e_:g' $FILE
  sed -i.bak 's:!s21_:!e_:g' $FILE
  sed -i.bak 's: S21_: E_:g' $FILE
  sed -i.bak 's:_S21_:_E_:g' $FILE
  sed -i.bak 's:zeftyrst@student.21-school.ru:enikeev.tg@gmail.com:g' $FILE
  sed -i.bak 's:src/tagir/:src/:g' $FILE
fi
done
rm -rf *.bak  #backup files removing
make style
