#!/bin/bash
set -e

# For better performance, we include the content of htdir.txt in apache conf
echo >&2 "Apache uses $PWD/data/htdir.txt for location and directory rules"
if [ ! -e htdocs/htdir.txt ]; then
  echo "#Put your Apache Directory or Location rules here" > htdocs/htdir.txt;
fi

exec "$@"
