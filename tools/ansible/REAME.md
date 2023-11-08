# Lab: Installing Ansible on Ubuntu with pip

## Prerequisites:
- Ubuntu system with Python installed.
- `sudo` privileges or access to the `root` user.

## Step 1: Update the Package List
Update your package list to ensure you can download the latest packages.
```bash
sudo apt update
sudo apt upgrade -y
```

## Step 2: Install pip for Python
Install `pip` if it is not already installed on your system.
```bash
sudo apt install python3-pip -y
```

## Step 3: Install Ansible with pip
Use `pip` to install Ansible.
```bash
sudo pip3 install ansible
```

## Step 4: Verify the Installation
Check that Ansible has been installed successfully.
```bash
ansible --version
```

## Step 5: (Optional) Create a Virtual Environment
For isolation, you can install Ansible within a Python virtual environment.
```bash
sudo apt install python3-venv -y
python3 -m venv my-ansible-env
source my-ansible-env/bin/activate
pip3 install ansible
```
Deactivate the virtual environment when you're done.
```bash
deactivate
```

## Step 6: (Optional) Ansible Configuration
Customize your Ansible setup by editing the configuration file.
```bash
vi ~/my-ansible-env/ansible.cfg
```

This concludes the lab for installing Ansible on Ubuntu using pip.
