#!/bin/bash -e
RULE_UNSUPPORTED_SCRIPTS=SC1071

for dir in src test lib docs; do
  shellcheck -e $RULE_UNSUPPORTED_SCRIPTS ./$dir/*.sh
done
