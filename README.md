# dev-laptop

Scripts for a Developer Laptop. 

At the moment it's setup for an Ubuntu LTS (18.04) Image. 

This script uses Ansible to setup the tools needed for the DevOps Premium Stream

## Running the script. 

Run the following command to install all tools and Visual Studio Code Extensions:

```
./setup-laptop.sh -e
```

## Switches
The setup script has the following switches available


- `-e` *Install Visual Studio Code Extensions*  
- `-f` *Force Update of Ansible Galaxy Packages*  
- `-s` *Skip running Ansible Playbook, using `./setup-laptop.sh -s` will essentially do nothing* 