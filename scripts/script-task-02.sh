#!/usr/bin/env bash

while ((1==1)) 
do
  curl https://localhost:4757 
  if (($? != 0))
  then
    date >> curl.log
  else
      echo localhost:4745 up
      break;
  fi
done

