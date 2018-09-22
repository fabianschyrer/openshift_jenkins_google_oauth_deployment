#!/bin/bash
for folder in `ls -d */`
do
  cd $folder
  find . -type f -not -name 'env.config' -not -name 'gcr_key.json' | xargs rm
  cd ..
done
