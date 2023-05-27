#!/bin/sh

DIR1=test1;
if ! [ -d $DIR1 ] ; then
  mkdir $DIR1
fi
for FILE in $(find e_*);
do NEW=$(echo $FILE | sed 's/e_/s21_/');
cp $FILE $DIR1/$NEW;
done

#OR:
DIR2=test2;
if ! [ -d $DIR2 ] ; then
  mkdir $DIR2;
fi
SED_ARG="p;s/e_/"$DIR2"\/s21_/g";
find s21_* -type f | sed $SED_ARG | xargs -n2 cp
