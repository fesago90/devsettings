#!/bin/bash

LIGHT_START=${LIGHT_START:-7}
LIGHT_END=${LIGHT_END:-18}

hour=$(date +%-H)
if ((hour <= LIGHT_START || hour >= LIGHT_END )); then
  echo dark
else
  echo light
fi
