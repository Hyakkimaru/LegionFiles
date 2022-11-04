#!/bin/bash

set -euo pipefail

tr -s '/\\' '/' < listfile.txt \
    | tr '[:upper:]' '[:lower:]' | tr -d '\015' \
    | LC_ALL=C sort -u \
    | (grep -vi .ds_store || true) \
    | (grep -v '^$' || true) \
	   > listfile.tmp

mv listfile.tmp \
   listfile.txt
