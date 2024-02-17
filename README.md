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

### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli](./bin/install_aws_cli.sh)

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

To check if our AWS credentails is configuerd correctly run the following AWS CLI command : 
```sh
aws sts get-caller-identity
```
If it is successful you should see a json payload return that looks like this:

```json
{
    "UserId": "AWRA367QLDCA2DEXAMPLE",
    "Account": "123456789101",
    "Arn": "arn:aws:iam::123456789101:user/exampro-terraform-bootcamp"
}
```

We'll need to generate  AWS CLI credits from IAM User in order to use the AWS CLI

## Terraform Basics

### Terraform Registry
Terraform sources thire providers and modlues from the Terraform registry which located at registry. [terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in terraform
- **Modules** are a way to make large amount of terraform code modular, portable and sharable

### Terraform Console

The follwoing are the basic commands for the terraform workflow

```sh
terraform init #Download the provider exceutable
terraform plan #The channges that will be applied
terraform apply #apply the plan -> make actual chages to your infra
```

- everytime you run `terrafrom apply` you will be asked to confirm the action. You can use `terraform apply --auto-approve` to automatically accpt the changes.

#### Addtional files produced by the commands

```sh
terraform init -> .terraform (provider to be used in the plan) + lock file
terraform plan -> terraform state, the state of your plan
```


## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login` it will launch a bash wiswig view to generate a token.
However it does not work as expected in Gitpod VS Code in the browser.\

The workaround is manually generate a token in Terraform Cloud

```

```

Then create the file manuallt here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json
```

Provide the following coded (reaplce your token in the file):

```json
{
    "credentials": {
        "app.terraform.io" : {
            "token" : "YOUR TERRAFORM CLOUD TOKEN"
        }
    }
}
```