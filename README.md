# Dotfiles BartSte
This readme is relevant for the following dotfiles repositories:
- BartSte/dotfiles
- BartSte/dotfiles-linux
- BartSte/doffiles-windows

Please read the following sections to get started with this repository. Make sure you have installed [git](https://git-scm.com/downloads).

## Bare repository
The text below was inspired on the following article of [atlassian](https://www.atlassian.com/git/tutorials/dotfiles). This article will also explain the difference between a normal repository and a bare repository.

Clone the project (dotfiles or dotfiles-windows) into a bare repository. I will call the bare repository: `.dotfiles-windows`:
```powershell
git clone --bare <git-repo-url> $HOME/.dotfiles-windows
```
Add the following alias to your .bashrc:
```bash
alias win='/usr/bin/git --git-dir=$HOME/.dotfiles-windows/ --work-tree=$HOME'
```
Or to your $PSHome/profile.ps1:
```powershell
${function:win} = { git.exe --git-dir=$HOME\.dotfiles-windows\ --work-tree=$HOME @args }
```
where `win` can be replaced by a name you prefer, while the folder `.dotfiles-windows` is the directory holding the bare repository.

Checkout the actual content from the bare repository to your $HOME:
```powershell
win checkout
```
The step above might fail with a message like:
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
This is because your $HOME folder might already have some stock configuration files which would be overwritten by git. The solution is simple: back up the files if you care about them, remove them if you don't care, and try again. 

Set the flag showUntrackedFiles to no on this specific (local) repository:
```powershell
win config --local status.showUntrackedFiles no
```
You're done, from now on you can now type `win` commands to add and update your dotfiles:
```powershell
win status
win add .bashrc
win commit -m "Add bashrc"
win push
```
## Multiple layers
Using a bare repository allows you to working on multiple repositories in the same folder. For dotfiles this is typically the $HOME folder. As such, the repositories `dotfiles` and `dotfiles-windows` should both be created in a bare repository in the $HOME folder. I call them `.dotfiles` and `.dotfiles-windows`. Here, the repository `dotfiles` can be interpreted as the base layer, containing dotfiles that are cross-platform. On top of that, a windows layer can be added, i.e., the `dotfiles-windows` bare repository. As an example, the following code adds a file `.foo` to the `dotfiles` repository (using the alias `base`), and a file `.bar` to the `dotfiles-windows` repostory (using the alias `win`):
```powershell
base add .foo
win add .bar
base commit -m "Add .foo"
win commit -m "Add .bar"
base push
win push
```
Put simply, follow this document for both the `dotfiles` and `dotfiles-windows` repositories, and you are on your way.
## dotfiles (cross-platform)
- No initialization needed. It only contains dotfiles.
## dotfiles-windows
- To initialize the dotfiles repository for windows, please run script `\dotfiles-windows\main.ps1`. 
- All the subfolders of `\dotfiles-windows` are runned by calling the `main.ps1` file. You can run each subfolder separately by calling the `main.ps1` file in each subfolder, e.g., `\dotfiles-windows\powershell\main.ps1`.
- Apply your personal settings by altering the file `\dotfiles-windows\config.ps1`. If you are a new user, and your not planning to add new features to this repository, altering the `config.ps1` should be sufficient.
