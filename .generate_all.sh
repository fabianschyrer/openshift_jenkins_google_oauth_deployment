#!/bin/bash
# Create the local generate script

for folder in `ls -d */`
do
    
  DIRECTORY=$folder
  echo ==========
  echo Processing : $DIRECTORY
  cat $DIRECTORY/env.config .template/template-generate.sh > $DIRECTORY/.generate.sh
  
  chmod 755 $DIRECTORY/.generate.sh
  echo Generate : generate.sh

  cd $DIRECTORY
  ./.generate.sh
  echo Generate : Yaml spec
  chmod 755 *.sh
  echo update : execute permission for *.sh
  cd ..
done