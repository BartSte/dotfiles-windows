# Dotfiles BartSte
This readme is relevant for the following dotfiles repositories:
- BartSte/dotfiles
- BartSte/dotfiles-linux
- BartSte/doffiles-windows

Please read the following sections to get started with this repository. Make sure you have installed [git](https://git-scm.com/downloads). The examples below are writting in bash and powershell. 

## Bare repository
The text below was inspired on the following article of [atlassian](https://www.atlassian.com/git/tutorials/dotfiles). This article will also explain the difference between a normal repository and a bare repository.

Clone the project (dotfiles, dotfiles-linux, dotfiles-secret or dotfiles-windows) into a bare repository. I will call the bare repository: `dotfiles.git`:
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
where `base` can be replaced by a name you prefer, while the folder `dotfiles.git` is the directory holding the bare repository.

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
This is because your $HOME folder might already have some stock configuration files which would be overwritten by git. The solution is simple: back up the files if you care about them, remove them if you don't care, and try again. 

Set the flag showUntrackedFiles to no on this specific (local) repository:
```bash
base config --local status.showUntrackedFiles no
```
You're done, from now on you can now type `base` commands to add and update your dotfiles:
```base
base status
base add README.md
base commit -m "Add README.md"
base push
```
## Multiple layers
Using a bare repository allows you to working on multiple repositories in the same folder. For dotfiles this is typically the $HOME folder. As such, the repositories `dotfiles` `dotfiles-linux`, `dotfiles-secret` (private) and `dotfiles-windows` should all be created in a bare repository in the $HOME folder. I call them `<repo-name>.git`. Here, the repository `dotfiles.git` can be interpreted as the base layer, containing dotfiles that are cross-platform. On top of that, a linux layer can be added, i.e., the `dotfiles-linux.git` bare repository. As an example, the following code adds a file `.foo` to the `dotfiles` repository (using the alias `base`), and a file `.bar` to the `dotfiles-linux` repostory (using the alias `lin`):
```bash
base add .foo
lin add .bar
base commit -m "Add .foo"
lin commit -m "Add .bar"
base push
lin push
```
You will always need the base layer `dotfiles`. On top of that you can add an OS specific repostory: `dotfiles-linux` or `dotfiles-windows`. Optionally, you can create a private repository that holds sensitive information. I called this repository `dotfiles-secret`. More information about these repositories is provided below.
## dotfiles (cross-platform)
- No initialization needed. It only contains dotfiles.
## dotfiles-linux (Ubuntu and Debian)
- To initialize the repository run the script `~\dotfiles-linux\main.sh`.
- To initialize X11 witr a window manager (i3) install the `dependencies_extra` in `~\dotfiles-linux\config.sh`.
- Optionally, if you run on an asus device, you can run `~\doffiles-linux\main_asus.sh`.
- If you want to run mutt complete the environment variables in `secret-config.sh`. Alternatively, add this config to a private repository.
## dotfiles-windows (Windows 10 & 11)
- To initialize the dotfiles repository for windows, please run script `\dotfiles-windows\main.ps1`. 
- All the subfolders of `\dotfiles-windows` are runned by calling the `main.ps1` file. You can run each subfolder separately by calling the `main.ps1` file in each subfolder, e.g., `\dotfiles-windows\powershell\main.ps1`.
- Apply your personal settings by altering the file `\dotfiles-windows\config.ps1`. If you are a new user, and your not planning to add new features to this repository, altering the `config.ps1` should be sufficient.
## dotfiles-secret (cross-platform)
- Similarly to the `dotfiles` repository, the `dotfiles-secret` repository is a collection of static files. These files contains sensitive information and should therefore not be publicly shared.
