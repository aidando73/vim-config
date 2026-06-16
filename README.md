> [!WARNING]
> **Deprecated.** This repo has been merged into [aidando73/dotfiles](https://github.com/aidando73/dotfiles) under `vim/`.
> Install via dotfiles instead: `curl -fsSL d.aidando.com/setup.sh | bash`. This repo is no longer maintained.

# Vim Config
```bash
cd ~
wget https://codeload.github.com/aidando73/vim-config/zip/refs/heads/master -O vim-config.zip
unzip vim-config.zip
cp -r vim-config-master/.* .
rm -rf README.md vim-config.zip vim-config-master
```

- Open up vim and then run :PlugInstall
- If on linux, `sudo apt install vim-gtk`
