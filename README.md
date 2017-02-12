kota65535.pyenv
============

[![Build Status](https://travis-ci.org/kota65535/ansible-role-pyenv.svg?branch=master)](https://travis-ci.org/kota65535/ansible-role-pyenv)

Ansible role for installing [pyenv](https://github.com/yyuu/pyenv) and [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv) on RHEL and Ubuntu.

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

You can use `x` as the latest version number to specify python version (ex. `3.5.x`).

The default values are as follows:

```
pyenv_python_versions: []
pyenv_virtualenvs: []
pyenv_root: "~/.pyenv"
pyenv_repo: "https://github.com/yyuu/pyenv.git"
pyenv_virtualenv_repo: "https://github.com/yyuu/pyenv-virtualenv.git"
```

Example Playbooks
-------------------------

### 1. Personal setup
- Install pyenv for me only
- Install python 2.7.12 and the latest version of 3.5
- Create virtualenvs with the installed pythons
- Add lines to `~/.bashrc` to initialize pyenv

```
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
     pyenv_profile_path: ~/.bashrc
   roles:
     - kota65535.pyenv
```

### 2. Multiple users, global profile
- Install pyenv for users `test01` and `test02`
- Install python 2.7.12
- Crerate `/etc/profile.d/pyenv.sh` to initialize pyenv for all users

```
- hosts: all
  vars:
    pyenv_python_versions:
      - 2.7.12
    pyenv_users:
      - test01
      - test02
    pyenv_profile_path: /etc/profile.d/pyenv.sh
    pyenv_profile_owner: root
  roles:
    - kota65535.pyenv
```

### 3. Multiple users, personal profiles
- Install pyenv for users `test01` and `test02`
- Install python 2.7.12
- Add lines to `~/.bashrc` of each users to initialize pyenv

```
- hosts: all
  vars:
    pyenv_python_versions:
      - 2.7.12
    pyenv_users:
      - test01
      - test02
    pyenv_profile_path: ~/.bashrc
  roles:
    - kota65535.pyenv
```


License
-------

MIT

Author Information
------------------

Tomohiko Ozawa (https://github.com/kota65535)
