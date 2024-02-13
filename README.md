# Terraform Beginner Bootcamp 2023

## Semantic Versioning! :mage:

This project is going to utilize semantc versioning for its tagging
[sever.org](https://semver.org)

The general format

**MAJOR.MINOR.PATCH** eg. 1.0.1

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via  Terraform Documentation and change the script for install.

- [Installing Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## Considerations for Linux Distribution
This project is buit against Ubuntu.
Please Consider checking your Linux distribution and change accordingly to distribution needs

- [How to check OS Version in Linux]( https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

```sh
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

## Refractoring into Bash Scripts
while fixing the Terraform CLI gpg deprication issues we notice that bash scripts steps were a consirable amount of more code. So we decided to create a bash script to install the Terraform CLI.

- This bash script is located here : [./bin/install_terraform_cli](./bin/install_terraform_cli.sh)

- This will keep the Gitpod Task File ([.gitpod.yml]( .gitpod.yml )) tidy.
- This allow us an easier way to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install Terrafomr CLI

## Shenag Considerations
A shebang (pronounced Sha-bang) tells the bash script what program that will interprete the scripts e.g `#!/bin/bash`

ChatGPT recommended tis format for bash : `#!/usr/bin/env bash`

- For portabiity for different OS distributions
- Will search the user's PATH for the bash executable

- **Shebang** : https://en.wikipedia.org/wiki/Shebang_(Unix)

## Excecution Considerations
When executing the bash script we can use the `./` shorthand tnotation to execute the bash script.

e.g. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it

e.g. `source ./bin/install_terraform_cli`


## Linux Permisssions Considerations

In order to make our bash scripts executable we need to chnage linux permission for the fix to be excecutable at the user mode.

```sh
chmod 744 ./bin/install_terraform_cli
```

- **Linux User permissions** : https://en.wikipedia.org/wiki/Chmod

## GitPod LifeCycle (Before, Init, Command)

We need to be careful when using the Init becuare it will not rerun if we restart an existing worksapce.

- **Gitpod workflow** :  https://www.gitpod.io/docs/configure/workspaces/tasks


### Working with Env Vars
We can list out all Envirioment Vartiables (Env Vars) using `env.` command
We can fillter specific env vars using grep e.g `env | grep AWS_`

#### Setting and Unsetting Env Vars
In the terminal we can set using ` export HELLO='world'`
In the terminal we can unset using  `unset HELLO`
we can set env var temporarilly  when just ruuning a command

