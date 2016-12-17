kota65535.pyenv
============

Ansible Galaxy role for [pyenv](https://github.com/yyuu/pyenv) and [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv) on RHEL.

Install it with the following command:

```bash
$ ansible-galaxy install kota65535.pyenv
```

Requirements
------------

None

Role Variables
--------------

Here is the list of all variables and their default values.  
You can use 'x' for specifying the latest version.

* `pyenv_path: "{{ ansible_env.HOME }}/.pyenv"`
* `pyenv_owner: "{{ ansible_env.USER }}"`
* `pyenv_python_versions: ["3.4.1", "3.5.x"]`
* `pyenv_virtualenvs: [{ venv_name: "3.5-latest", py_version: "3.5.x" }]`
* `pyenv_profile_path: "/etc/profile.d/pyenv.sh"`

Dependencies
------------

None

Example Playbook
-------------------------


License
-------

MIT

Author Information
------------------

Tomohiko Ozawa (https://github.com/kota65535)
