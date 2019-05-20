#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -j unix \
  -F \
  -f $VCL_CONFIG \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS"
