🌟 dotfiles 🌟
========

This repository contains configuration files (dotfiles) and various scripts managed using [`chezmoi`](https://www.chezmoi.io/). It automates the setup of a personalized environment across multiple machines. 

## 🔐 Secrets management
All secrets are stored and retrieved from the [`Bitwarden Secrets Manager`](https://bitwarden.com/products/secrets-manager/), which can be used for free, is open source, and can be locally hosted. The [`Secrets Manager CLI`](https://bitwarden.com/help/secrets-manager-cli/) is installed by [`web_binaries.sh`](.chezmoiscripts/run_once_before_15_web_binaries.sh.tmpl). Web binaries are defined in [`web_binaries.yaml`](.chezmoidata/web_binaries.yaml).

## 💾 Backup backed in

[`Restic`](https://restic.net/) backup is backed into my home directory. Restic will automatically create, prune, and check encrypted backups. The Restic environment is set up by [`restic_setup.sh`](.chezmoiscripts/run_after_20_restic_setup.sh.tmpl). This script also installs or upgrades the Restic and Rclone binaries.

Backups are created:
- 🌐 Locally towards a [`Restic rest-server`](https://github.com/restic/rest-server).
- ☁️ Towards the cloud using [`Rclone`](https://github.com/restic/rest-server) and [`pCloud`](https://www.pcloud.com/eu). Cloud backups are double encrypted, once by Restic and once by Rclone.

Backup, forget/prune, and check scripts are randomly scheduled by cron (avoids all hosts backing up at the same time):
- 🕒 Restic Backup runs randomly between 0:00 and 7:00.
- 🕒 Restic Forget/prune jobs run between 8:00 and 15:00.
- 🕒 Restic checks run between 16:00 and 23:00.

⚠️ Any error messages are sent towards [`ntfy`](https://ntfy.sh/).

Defines a [`restic wrapper`](./private_dot_local/private_bin/private_executable_restic.sh.tmpl) for error handling, logging, and Restic [`aliases`](private_dot_bash_aliases) for easy usage of Restic with local or cloud targets.

Some directories receive the [`.CACHEDIR.TAG`](https://bford.info/cachedir/) files for excluding them from Restic backup.

## 🛠️ Git
Creation of [`.gitconfig`](dot_gitconfig) and distribution of the [`git-crypt`](https://github.com/AGWA/git-crypt) key, which is stored in `.config/git-crypt directory` and base64 decoded by [`git_crypt_key.sh`](.chezmoiscripts/run_after_30_git_crypt_key.sh) for usage within Git (link from `.git/git-crypt/keys/default`). Install GitHub key [`id_ed25519_github`](private_dot_ssh/private_id_ed25519_github.tmpl).

## Usage

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

### 📜 License
This repository is intended for personal use. Feel free to adapt it for your own needs.




