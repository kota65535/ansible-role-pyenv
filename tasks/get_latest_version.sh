#!/bin/sh

tmpdir=$(mktemp -d /tmp/XXXX)
if ! which -s pyenv; then
    # If pyenv is not installed, clone repository and set path
    git clone -q $1 ${tmpdir}
    export PYENV_ROOT=${tmpdir}
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(${PYENV_ROOT}/bin/pyenv init -)"
fi

version_regex_str=$(echo "$2" | perl -pe 's/X/\\d+/g; s/\./\\./g')
regex_str="^\s*${version_regex_str}$"
pyenv install -l | perl -nle "print if /${regex_str}/" | perl -e 'use Sort::Versions; print sort versions <STDIN>' | tail -n 1 | perl -pe 's/\s//g'
