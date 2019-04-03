# dev-laptop

Scripts for a Developer Laptop.

At the moment it's setup for an Ubuntu LTS (18.04) Image.

## Install Git

To install Git on your Ubuntu laptop, run the following command:

```bash
sudo apt install git
```

## Clone this repository

In the Terminal, navigate to the location of your choice using the command:

```bash
cd <path-of-your-choice>
```

You can now clone this repository locally using the following command:

```bash
git clone https://github.com/CSPS-EFPC-DAAN/dev-laptop.git dev-laptop
```

## Running the script

This script uses Ansible to setup the tools needed for the DevOps Premium Stream

Run the following command to install all tools and Visual Studio Code Extensions:

```bash
./setup-laptop.sh -e
```

## Switches

The setup script has the following switches available

- `-e` *Install Visual Studio Code Extensions*  
- `-f` *Force Update of Ansible Galaxy Packages*  
- `-s` *Skip running Ansible Playbook, using `./setup-laptop.sh -s` will essentially do nothing* 