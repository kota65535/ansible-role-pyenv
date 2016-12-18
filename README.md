kota65535.pyenv
============

[![Build Status](https://travis-ci.org/kota65535/ansible-role-pyenv.svg?branch=master)](https://travis-ci.org/kota65535/ansible-role-pyenv)

Ansible role for installing [pyenv](https://github.com/yyuu/pyenv) and [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv) on RHEL.

Install it with the following command:

```bash
$ ansible-galaxy install kota65535.pyenv
```

Dependencies
------------

none

Role Variables
--------------

* `pyenv_users` - Array of usernames for multiuser install. User must be present in the system.
* `pyenv_python_versions` - Python versions to be installed
* `pyenv_virtualenvs` - Dict of virtualenvs created for each users. Following keys should be set.
    * `venv_name`: the name of the virtualenv
    * `py_version`: python version used by the virtualenv
* `pyenv_root` - Install path of pyenv
* `pyenv_profile_path` - Install path of pyenv initialization script

You can use `x` to specify python version, which means the latest version number (ex. `3.5.x`)

The default values is as follows:

```
pyenv_users: ["{{ ansible_env.USER }}"]
pyenv_python_versions: ["3.x.x"]
pyenv_virtualenvs: []
pyenv_root: "~/.pyenv"
pyenv_profile_path: "/etc/profile.d/pyenv.sh"
```

Example Playbook
-------------------------

    - hosts: all
      vars:
        pyenv_python_versions:
          - 2.7.12
          - 3.5.x
        pyenv_virtualenvs:
          - venv_name: the-conventional
            py_version: 2.7.12
          - venv_name: the-latest
            py_version: 3.5.x
        pyenv_users:
          - test01
          - test02
      roles:
        - kota65535.pyenv

License
-------

MIT

Author Information
------------------

Tomohiko Ozawa (https://github.com/kota65535)
