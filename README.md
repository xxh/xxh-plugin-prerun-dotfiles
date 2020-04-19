The dotfiles plugin is the start point to create something similar to [dotfiles project](https://dotfiles.github.io/) for xxh.

The `home` directory contains the files which will be copied to xxh home directory (default `/home/user/.xxh/`) before running shell. 
The [XDG](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) directory `.config` 
will be coped to `$XDG_CONFIG_HOME` (default `/home/user/.xxh/.config`).

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
