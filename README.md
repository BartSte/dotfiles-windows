# Dotfiles BartSte

This readme is relevant for the following dotfiles repositories:

- BartSte/dotfiles
- BartSte/dotfiles-linux
- BartSte/doffiles-windows

Please read the following sections to get started with this repository. The
examples below are writing in bash and powershell.

## Dotfiles (cross-platform)

- No initialization needed. It only contains static dotfiles. Typically, you
  will not clone this repository by yourself, instead it will be cloned for you
  by the `dotfiles-linux` or the `dotfiles-windows` repositories, as they depend
  on it.

### Neovim (`dotfiles/nvim`)

Some directories of the neovim configuration could use some explanation:

- `dotfiles/nvim/lua`:
  - `helpers`: helper functions that are used in the other lua files.
  - `plugins`: plugins that are loaded by lazy.nvim
  - `config`: plugin configuration files.
- `dotfiles/nvim/vim`: plugin configuration files in vimscript.
- `dotfiles/nvim/plugin`: non-plugin configuration files that must be sourced
  before `after/plugin`.
- `dotfiles/nvim/after/plugin`: non-plugin configuration files.
- `dotfiles/nvim/after/ftplugin`: configuration files that are loaded after the
  filetype is detected.

## Dotfiles-linux (Arch linux)

### Installation

- To initialize the repository run the following line in a bash shell:

```bash
curl -O https://raw.githubusercontent.com/BartSte/dotfiles-linux/master/dotfiles-linux/initialize && bash ./initialize; rm ./initialize
```

- Complete the environment variables in `~/.dotfiles_config.sh`.
- Run the script: `~/dotfiles-linux/main`
- Afterwards, authenticate for:
  - Dropbox
  - Davmail

### Authenticate dropbox

After installing dropbox, you need to authenticate it with your account. At the
moment of writing, the only way was to do this through a tray icon. Waybar did
not work from me so I did the following:

- Run xwayland
- Intall the program `trayer`
- Run trayer.
- Run dropbox.
- Dropbox will apear in the tray icon.
- Press `sign in` and follow the instructions.

After dropbox is working, re-run the following scripts as they rely on files
(containing personal data) that are synced by dropbox:

```bash
dotfiles-linux/qutebrowser/main
dotfiles-linux/wakatime/main
```

### Authenticate davmail

To be able to use khal/khard/khalorg/vdirsyncer, you need to authenticate
davmail. This can be done by doing the following:

- In shell 1, run:

```bash
davmail ~/.config/davmail/davmail.properties
```

- In shell 2, run:

```bash
vdirsyncer discover
vdirsyncer sync
```

- Head back to shell 1 and follow the instructions. If you are prompted with a
  message that states that "interactive" mode is not supported, you can change
  the davmail.properties setting `davmail.mode=O365Interactive` to
  `davmail.mode=O365Manual`.

- After this, you can run the following commands to ensure all is synced:

```bash
mycalsync
mymailsync
```

### Git crypt

The `dotfiles` repository contains some files that are encrypted using
`git-crypt`. To be able to read the encrypted files, the
`dotfiles-linux\crypt\main` script is used is executed when running het main
file.

#### get-rbw-base64-keys

The function `get-rbw-base64-keys` will convert the output of \`base crypt
export-key\` to a base64 string. This sting can be stored in the password
manager. In the \`main\` script this key is decoced and piped to \`base crypt
unlock\`. The `get-rbw-base64-keys` is only needed when you want to update the
keys in `rbw` and does not have to run when you are initializing your dotfiles.

## Dotfiles-windows (Windows 10 & 11)

- To initialize the repository copy the following line into powershell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
[bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544");
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BartSte/dotfiles-windows/master/dotfiles-windows/initialize.ps1'))
```

- Complete the configuration file in `$HOME/dotfiles-windows/config.ps1`.
- Run the script: `$HOME/dotfiles-windows/main.ps1`
- All the subfolders of `$HOME/dotfiles-windows` are executed by calling the
  `main.ps1` file, e.g., `$HOME/dotfiles-windows/powershell/main.ps1`.

### Git crypt

The `dotfiles` repository contains some files that are encrypted using
`git-crypt`. However, using git crypt on windows is not straightforward yet. To
be able to read the encrypted files, we use WSL to unlock the `dotfiles`
repository, by using the following script:
[dotfiles-linux/crypt/main](https://github.com/BartSte/dotfiles-linux/blob/master/dotfiles-linux/crypt/main_windows).
Here, it is assumed that, in WSL, the environment variable `WH` is set to the
windows home directory of the user. When using the `dotfiles-linux` repository,
this variable is already set when the `.zshrc` file is sourced.

# Background

The following sections explain how the 3 repositories work together.

## Bare repository

The text below was inspired on the following article of [atlassian](https://www.atlassian.com/git/tutorials/dotfiles). This article will also explain the difference between a normal repository and a bare repository.

Clone the project (dotfiles, dotfiles-linux, or dotfiles-windows) into a bare
repository. I will call the bare repository: `dotfiles.git`:

```powershell
git clone --bare <git-repo-url> $HOME/dotfiles.git
```

Add the following alias to your .bashrc:

```bash
alias base='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
```

Or to your $PSHome/profile.ps1:

```powershell
${function:base} = { git.exe --git-dir=$HOME\dotfiles.git\ --work-tree=$HOME @args }
```

where `base` can be replaced by a name you prefer, while the folder
`dotfiles.git` is the directory holding the bare repository.

Checkout the actual content from the bare repository to your $HOME:

```bash
base checkout
```

The step above might fail with a message like:

```
error: The following untracked working tree files would be overwritten by checkout:
    README.md
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your `$HOME` folder might already have some stock configuration
files which would be overwritten by git. The solution is simple: back up the
files if you care about them, remove them if you don't care, and try again.

Set the flag showUntrackedFiles to no on this specific (local) repository:

```bash
base config --local status.showUntrackedFiles no
```

You're done, from now on you can now type `base` commands to add and update
your dotfiles:

```base
base status
base add README.md
base commit -m "Add README.md"
base push
```

## Multiple layers

Using a bare repository allows you to working on multiple repositories in the
same folder. For dotfiles this is typically the `$HOME` folder. As such, the
repositories `dotfiles` `dotfiles-linux`, and `dotfiles-windows` should all be
created in a bare repository in the `$HOME` folder. I call them
`<repo-name>.git`. Here, the repository `dotfiles.git` can be interpreted as
the base layer, containing dotfiles that are cross-platform. On top of that, a
linux layer can be added, i.e., the `dotfiles-linux.git` bare repository. As an
example, the following code adds a file `.foo` to the `dotfiles` repository
(using the alias `base`), and a file `.bar` to the `dotfiles-linux` repostory
(using the alias `lin`):

```bash
base add .foo
lin add .bar
base commit -m "Add .foo"
lin commit -m "Add .bar"
base push
lin push
```

You will always need the base layer `dotfiles`. On top of that you can add an
OS specific repostory: `dotfiles-linux` or `dotfiles-windows`.

# References

This repos are inspired on the following projects:

- [dotfiles for windows](https://github.com/jayharris/dotfiles-windows)
- [polybar-connection](https://github.com/BartSte/polybar-collection)
- [polybar-bluetooth](https://github.com/msaitz/polybar-bluetooth)
- [mutt-oauth2](https://github.com/muttmua/mutt/blob/master/contrib/mutt_oauth2.py)
- [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/)
