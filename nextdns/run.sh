#!/bin/bash


set -e

[ -n "${NEXTDNS_ID}" ] &&  NEXTDNS_ARGUMENTS+=" -config ${NEXTDNS_ID}"

./nextdns run ${NEXTDNS_ARGUMENTS} &

echo $$
# -$$: kill process group (parent and children)
#trap 'trap - TERM; kill 0' TERM
#trap 'trap - INT TERM; kill 0' INT TERM

trap 'trap - TERM; kill -s TERM -- -$$' TERM

tail -f /dev/null & wait

exit 0


