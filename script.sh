#!/bin/bash
echo "Welcome!"

firstline=$(head -n1 ./source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo $version

echo "Press 1 to continue or 0 to exit"
read versioncontinue

mkdir build

if [ $versioncontinue -eq 1 ]
  then 
    for file in source/*
      do
        if [ "$file" == "source/secretinfo.md" ]
          then
            echo "not copying" $file
          else
            echo "copying" $file
            cp $file build
        fi
    done
  else
    echo "Please come back when you are ready"
fi
echo "========================================="
cd build
echo "listed files of version" $version "are in the build directory"
ls -alt

cd ..
