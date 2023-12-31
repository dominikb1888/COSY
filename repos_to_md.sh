#!/bin/bash

HEADER="| Name | Homepage URL | Description |"
SEPARATOR="|---|---|---|"

echo $HEADER > bloglist_auto.md &&\
echo $SEPARATOR >> bloglist_auto.md &&\
gh repo list 23W-gph -L 100 --json name --json description --json url\
| jq -r '.[] | [.name, .url, .description] | @tsv' | sed 's/\t/ | /g' \
| sed 's/^/| /g'\
| sed 's/$/ |/g' >> bloglist_auto.md

