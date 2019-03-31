#! /bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

echo "Initializing Variables"
# Initialize our own variables:
output_file=""
force=0
extensions=0
skipansible=0

echo "Parsing Options"
while getopts "fes" opt; do
    case "$opt" in
    f) force=1
        ;;
    e) extensions=1
        ;;
    s) skipansible=1 
        ;;
    esac
done


shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift


if [ $skipansible = 0 ]; then

  if ! command -v ansible;  then 
    echo "Ansible not found installing..."

    sudo apt-get update && 
    sudo apt-get install software-properties-common -y &&
    sudo apt-add-repository ppa:ansible/ansible -y &&
    sudo apt-get update && 
    sudo apt-get install ansible -y &&
    ansible-playbook test.yml --connection=local
  fi

  if [ $force = 1 ]; then
    echo "Forcing install of Ansible Galaxy packages"
    sudo ansible-galaxy install -r ./requirements.yml --force
  else
    echo "Installing missing Ansible Galaxy packages"
    sudo ansible-galaxy install -r ./requirements.yml
  fi

  echo "Running Ansible Playbook..."
  sudo ansible-playbook playbook.yml --connection=local
fi

if [ extensions = 1 ]; then
  echo "Cloning VsCode Extensions"
  git clone https://github.com/CSPS-EFPC-DAAN/vscode

  echo "Backing up existing extensions"
  code --list-extensions | sort -o vscode.bak.ext

  echo "Installing extensions"
  ./vscode/install.sh  ./vscode/vscode.ext
fi