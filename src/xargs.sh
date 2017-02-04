#!/bin/bash -e
# shellcheck disable=SC2010

ls | grep -v json | xargs echo
ls | grep -v json | xargs -n 1 echo
ls | grep -v json | xargs -n1 echo
ls | grep -v json | xargs -I{} echo {} after
