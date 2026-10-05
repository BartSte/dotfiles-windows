# BartSte dotfiles

Each dotfiles repository tracks this README. Their bare Git checkouts share the home directory.

These repositories put configuration files in the home directory:

| Repository | Purpose |
| --- | --- |
| `dotfiles` | Base files, Neovim configuration, and Linux and Windows initialization scripts |
| `dotfiles-linux` | Linux configuration for the shell, Git, mail, calendars, Codex, and other tools |
| `dotfiles-arch` | Arch packages, Sway, Waybar, DNS, firewall, and systemd units |
| `dotfiles-pi` | Raspberry Pi packages, services, network setup, and application setup |
| `dotfiles-windows` | Windows and PowerShell setup |
| `dotfiles-secret` | Optional private configuration, including Codex and qutebrowser files |

The Linux initializer checks out the selected repositories into `$HOME` from separate bare Git repositories.
It installs the base and Linux layers, then selects the Arch or Raspberry Pi layer.
It also tries to check out `dotfiles-secret` when access is available.

The private `dotfiles-hermes` workspace is separate from `dotfiles-secret`.
The Raspberry Pi setup runs `~/dotfiles-hermes/main` when that workspace exists.

## Linux installation

Run the initializer on Arch Linux or a Raspberry Pi:

```bash
curl -fsSLo /tmp/dotfiles-initialize https://raw.githubusercontent.com/BartSte/dotfiles/master/dotfiles/initialize
bash /tmp/dotfiles-initialize
```

The initializer can replace tracked files in your home directory.
It creates `~/.dotfiles_config.sh` when that file does not exist.
Set the values that you use before you run the setup scripts:

```bash
export BWEMAIL=
export MICROSOFT_ACCOUNT=
```

Run the common setup, then the setup for your machine:

```bash
~/dotfiles-linux/main
~/dotfiles-arch/main    # Arch Linux
# or
~/dotfiles-pi/main      # Raspberry Pi
```

Run `~/dotfiles-linux/auth` for interactive login and pairing steps.
The `main` scripts run module setup and can install packages or request input.
The `auth` scripts handle services such as Bitwarden, Git, calendars, and Dropbox.

## Windows installation

The Windows initializer is in the base repository at `dotfiles/initialize.ps1`.
Run it in PowerShell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/BartSte/dotfiles/master/dotfiles/initialize.ps1'))
```

If the initializer did not create `$HOME/dotfiles-config.ps1`, copy the template:

```powershell
Copy-Item "$HOME/dotfiles-windows/default_config.ps1" "$HOME/dotfiles-config.ps1"
```

Edit the values in `$HOME/dotfiles-config.ps1`, then run:

```powershell
& "$HOME/dotfiles-windows/main.ps1"
```

The Windows setup uses the base and Windows repositories.
It needs `$HOME/dotfiles-config.ps1` before `main.ps1` runs.

## Repository contents

### Base: `dotfiles`

`dotfiles/nvim` contains the Neovim configuration.
Its Lua configuration uses `lua/before`, `lua/config`, `lua/helpers`, `lua/plugins`, and `lua/after`.
The `vim` and `queries` directories contain Vim configuration and Tree-sitter queries.
The base repository also contains qutebrowser files and the two initialization scripts.

### Linux: `dotfiles-linux`

This layer contains Zsh, tmux, Git, NeoMutt, isync, vdirsyncer, khal, khalorg, khard, Codex, and command-line scripts.
Mail configuration is under `dotfiles-linux/mutt`.
Calendar configuration is under `dotfiles-linux/vdirsyncer`, `khal`, and `khalorg`.
The `MICROSOFT_ACCOUNT` value selects the NeoMutt account.
The configuration reads credentials with `bw-cli-get` or `rbw`.

### Arch: `dotfiles-arch`

This layer contains package lists and setup for Sway, Waybar, DNS, firewall rules, qutebrowser, and systemd units.
The `dropboxsync.timer` unit belongs to this layer.

### Raspberry Pi: `dotfiles-pi`

This layer contains apt, network, Tailscale, UFW, pipx, and systemd setup.
It also contains setup modules for Summit, Hermes, and the grocery agent.
The Hermes module runs the separate private workspace when that workspace exists.

### Windows: `dotfiles-windows`

`main.ps1` configures PowerShell, dependencies, Windows settings, Git, Neovim, Alacritty, KMonad, Caps Lock, and qutebrowser.
Its `default_config.ps1` is a template for the local `dotfiles-config.ps1` file.

### Private configuration

`dotfiles-secret` holds versioned private configuration, including Codex configuration and qutebrowser URLs.
Keep passwords and API tokens in a credential store such as `rbw`.
Do not commit them to the dotfiles repositories.

## Dropbox files

`~/dropbox/org` contains personal Org notes and their archives.
`~/dropbox/generated` contains files that scheduled jobs replace.
Do not edit the files in `generated` as personal notes.

| Files in `~/dropbox/generated` | Publisher on the Raspberry Pi |
| --- | --- |
| `outlook_personal.org`, `outlook_work.org` | `calsync.timer` runs `dotfiles-linux/bin/mycalsync` |
| `activities.org` | `garmin-activities.timer` runs Summit |
| `personal_records.org` | `garmin-update.timer` runs Summit |
| `training-schedule.org`, `recent-training.csv` | The Hermes training schedule publisher |

The Pi service definitions live in `dotfiles-pi/systemd/user`.
The Pi publishes generated files to Dropbox.
Its `dropboxpull.timer` copies remote files to `~/dropbox`.
That pull excludes `activities.org` and `personal_records.org` because Summit writes them locally.

On Arch Linux, `dropboxsync.timer` runs `rclone bisync` between Dropbox and `~/dropbox`.
It syncs both `org` and `generated`.
The Dropbox remote is named `dropbox` in the rclone configuration.

## Bare Git repositories

`dotfiles-linux/zsh/git.zsh` defines these commands:

| Repository | Git command | Status command |
| --- | --- | --- |
| Base | `base` | `bases` |
| Linux | `lin` | `lins` |
| Arch | `linarch` | `linarchs` |
| Raspberry Pi | `linpi` | `linpis` |
| Private configuration | `secret` | `secrets` |

`dot` runs a Git command across the available repositories.
`dots` shows their status.
`dotc` commits changes in the available repositories, and `dotu` commits, pulls, and pushes them.
`dotc` stages the layer directories, but it does not stage this root README.
Stage this README separately in each repository that must receive the update.
