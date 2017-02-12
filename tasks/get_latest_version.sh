#!/bin/sh
tmpdir=$(mktemp -d /tmp/XXXX)
git clone -q $1 ${tmpdir}
export PYENV_ROOT=${tmpdir}
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(${PYENV_ROOT}/bin/pyenv init -)"

version_regex_str=$(echo "$2" | sed -e 's/x/[[:digit:]]/g' -e 's/\./\\./g')
regex_str="^[[:space:]]*${version_regex_str}[[:digit:]]*$"
pyenv install -l | grep -e "${regex_str}" | tail -n 1 | perl -pe 's/\s//g'
