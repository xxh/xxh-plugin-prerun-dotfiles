The dotfiles plugin is the start point to create something similar to [dotfiles project](https://dotfiles.github.io/) for xxh.

The `home` directory contains the files which will be copied to xxh home directory (default `/home/user/.xxh/`) before running shell. 
The [XDG](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) directory `.config` 
will be copied to `$XDG_CONFIG_HOME` (default `/home/user/.xxh/.config`). Learn more about [home settings in docs](https://github.com/xxh/xxh/wiki#how-to-set-homeuser-as-home-on-host).

## Install
From xxh repo:
```
xxh +I xxh-plugin-prerun-dotfiles
```
From any repo:
```
xxh +I xxh-plugin-prerun-dotfiles+git+https://github.com/xxh/xxh-plugin-prerun-dotfiles
```
Connect:
```
xxh yourhost +if
```

## Preinstall Python packages
Add python packages to `pip-requirements.txt` and they will be in `$XXH_HOME/.local`. 
This is compatible with [xxh-shell-xonsh](https://github.com/xxh/xxh-shell-xonsh) and [xxh-plugin-prerun-python](https://github.com/xxh/xxh-plugin-prerun-python). 