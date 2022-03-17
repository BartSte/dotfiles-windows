# Dotfiles B. Steensma
This readme is relevant for the following dotfiles repositories:
- BartSte/dotfiles
- BartSte/doffiles-windows

Please read the following sections to get started with this repository. Make sure you have installed git.

## Bare repository
The text below was inspired on the following article of [atlassian](https://www.atlassian.com/git/tutorials/dotfiles).


Add the following alias to your .bashrc:
```
alias win='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
Or to your $PSHome/profile.ps1:
```
${function:win} = { git.exe --git-dir=~\.dotfiles-windows\ --work-tree=~ @args }
```

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

echo ".cfg" >> .gitignore

    Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

git clone --bare <git-repo-url> $HOME/.cfg

    Define the alias in the current shell scope:

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    Checkout the actual content from the bare repository to your $HOME:

config checkout

    The step above might fail with a message like:

error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting

This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

    Re-run the check out if you had problems:

config checkout

    Set the flag showUntrackedFiles to no on this specific (local) repository:

config config --local status.showUntrackedFiles no

    You're done, from now on you can now type config commands to add and update your dotfiles:

config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push

Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as Bitbucket snippet like I did, create a short url for it and call it like this:

curl -Lks http://bit.do/cfg-install | /bin/bash

For completeness this is what I ended up with (tested on many freshly minted Alpine Linux containers to test it out):

git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

Wrapping up

I hope you find this technique useful to track your configuration. If you're curious, my dotfiles live here. Also please do stay connected by following @durdn or my awesome team at @atlassiandev.




## Multiple layers

## Main script

## Config file


