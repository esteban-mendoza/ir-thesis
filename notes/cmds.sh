# TeX-related commands
brew install --cask basictex

sudo tlmgr update --self && sudo tlmgr update --all
tlmgr search --global --file mypackage.sty
sudo tlmgr install <package1> <package2>
tlmgr list --only-installed