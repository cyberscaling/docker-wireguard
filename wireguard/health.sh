#!/bin/bash

wgok=`wg | grep interface`

if [[-z $wgok]]; then
    echo "wg empty";
    exit 1;
fi

dnsok=`drill @127.0.0.1 cloudflare.com | grep NOERROR`
if [[-z $dnsok]]; then
    echo "drill error";
    exit 1;
fi