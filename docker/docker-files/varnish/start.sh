#!/bin/bash

# start varnish with various options
varnishd -F -f ${VARNISH_VCL_PATH} -s malloc,${VARNISH_MEMORY} -a :${VARNISH_PORT} -p http_req_hdr_len=16384 -p http_resp_hdr_len=16384
