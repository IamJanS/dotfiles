# 🌟 Dotfiles Repository 🌟

This repository contains configuration files (dotfiles) and various scripts managed using [`chezmoi`](https://www.chezmoi.io/). It automates the setup of a personalized environment across multiple machines.

## 🔐 Secrets Management
All secrets are stored and retrieved from the [`Bitwarden Secrets Manager`](https://bitwarden.com/products/secrets-manager/), which is free, open source, and can be locally hosted. The [`Secrets Manager CLI`](https://bitwarden.com/help/secrets-manager-cli/) is installed by [`web_binaries.sh`](.chezmoiscripts/run_once_before_15_web_binaries.sh.tmpl). Web binaries are defined in [`web_binaries.yaml`](.chezmoidata/web_binaries.yaml).

## 💾 Backup System
[`Restic`](https://restic.net/) is used for encrypted backups. Backups are created locally and in the cloud using [`Rclone`](https://rclone.org/) and [`pCloud`](https://www.pcloud.com/eu). The Restic environment is set up by [`restic_setup.sh`](.chezmoiscripts/run_after_20_restic_setup.sh.tmpl), which also installs or upgrades Restic and Rclone binaries.

### ⏰ Backup Schedule
- **🕒 Backup**: Randomly between 0:00 and 7:00.
- **🕒 Forget/Prune**: Randomly between 8:00 and 15:00.
- **🕒 Check**: Randomly between 16:00 and 23:00.

⚠️ Error messages are sent to [`ntfy`](https://ntfy.sh/). Directories with [`.CACHEDIR.TAG`](https://bford.info/cachedir/) are excluded from backups.

## 🛠️ Git Configuration
- Creates [`.gitconfig`](dot_gitconfig).
- Distributes the [`git-crypt`](https://github.com/AGWA/git-crypt) key stored in `.config/git-crypt`.
- Installs GitHub SSH key [`id_ed25519_github`](private_dot_ssh/private_id_ed25519_github.tmpl).

## 🚀 Usage

### 🏁 Initialization
To initialize the dotfiles on a new machine:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/IamJanS/dotfiles
```

### 🔄 Updating
To pull the latest changes:
```bash
chezmoi update
```

## 📜 License
This repository is intended for personal use. Feel free to adapt it for your own needs.




