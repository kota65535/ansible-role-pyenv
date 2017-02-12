#!/bin/sh

tmpdir=$(mktemp -d /tmp/XXXX)
# Clone repository and set path
git clone -q $1 ${tmpdir}
export PYENV_ROOT=${tmpdir}
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(${PYENV_ROOT}/bin/pyenv init -)"

version_regex_str=$(echo "$2" | perl -pe 's/X/\\d/g; s/\./\\./g')
regex_str="^\s*${version_regex_str}$"
pyenv install -l | perl -nle "print if /${regex_str}/" | sort -V | tail -n 1 | perl -pe 's/\s//g'
