# Lab: Creating Another Ansible Playbook
In this lab, we'll extend our Ansible playbook to include additional configurations. The goal is to update the system, install Nginx, and set up a basic web server on the target machine.

## Step 1: Create the New Playbook
Create a new Ansible playbook file named playbook-lab-02.yaml and add the following content:
```yaml
---
- hosts: mdc-target1
  become: yes
  tasks:
    - name: Atualizar cache de pacotes
      apt:
        update_cache: 'yes'
        autoremove: 'yes'

    - name: Fazer upgrade do sistema
      apt:
        upgrade: 'yes'
        autoremove: 'yes'
```
## Step 2: Add Nginx Installation and Web Server Configuration
Update the playbook to install Nginx and create a simple HTML file:
```yaml
---
- hosts: mdc-target1
  become: yes
  tasks:
    - name: Atualizar cache de pacotes
      apt:
        update_cache: 'yes'
        autoremove: 'yes'

    - name: Fazer upgrade do sistema
      apt:
        upgrade: 'yes'
        autoremove: 'yes'

    - name: Instalar o Nginx
      apt:
        name: nginx
        state: present

    - name: Criar arquivo index.html
      copy:
        content: "Bem Vindos a mentoria devops cloud"
        dest: /var/www/html/index.html
```
## Step 3: Open Port 80 for Web Access
Run the following command to open port 80 for web access:
```bash
az vm open-port --resource-group mdc-rg --name mdc-02 --port 80 --priority 1001
```
## Step 4: Install Docker
Expand the playbook to include Docker installation:
```yaml
- hosts: mdc-target1
  become: yes
  tasks:
    - name: Atualizar cache de pacotes
      apt:
        update_cache: 'yes'
        autoremove: 'yes'

    - name: Fazer upgrade do sistema
      apt:
        upgrade: 'yes'
        autoremove: 'yes'

    - name: Instalar o Nginx
      apt:
        name: nginx
        state: present

    - name: Criar arquivo index.html
      copy:
        content: "Bem Vindos a mentoria devops cloud"
        dest: /var/www/html/index.html

    - name: Instalar o Docker
      apt:
        name: docker.io
        state: present
```
## Step 5: Verify Docker Installation
Include tasks to verify Docker installation:
```yaml
- hosts: mdc-target1
  become: yes
  tasks:
    - name: Atualizar cache de pacotes
      apt:
        update_cache: 'yes'
        autoremove: 'yes'

    - name: Fazer upgrade do sistema
      apt:
        upgrade: 'yes'
        autoremove: 'yes'

    - name: Instalar o Nginx
      apt:
        name: nginx
        state: present

    - name: Criar arquivo index.html
      copy:
        content: "Bem Vindos a mentoria devops cloud"
        dest: /var/www/html/index.html

    - name: Instalar o Docker
      apt:
        name: docker.io
        state: present

    - name: Testar Docker
      command: docker --version

    - name: Testar Docker
      command: docker --version
      register: docker_output

    - debug:
        var: docker_output.stdout_lines

    - name: Testar Docker PS
      command: docker ps
      register: docker_ps_output

    - name: Exibir saída do comando Docker PS
      debug:
        var: docker_ps_output.stdout_lines
```
## Step 6: Open Port 8080 for Docker Container
Run the following command to open port 8080 for Docker container access:
```bash
az vm open-port --resource-group mdc-rg --name mdc-02 --port 8080 --priority 1001
```
## Step 7: Download and Run Docker Container
Extend the playbook to download and run a Docker container:
```yaml
- hosts: mdc-target1
  become: yes
  tasks:
    - name: Atualizar cache de pacotes
      apt:
        update_cache: 'yes'
        autoremove: 'yes'

    - name: Fazer upgrade do sistema
      apt:
        upgrade: 'yes'
        autoremove: 'yes'

    - name: Instalar o Nginx
      apt:
        name: nginx
        state: present

    - name: Criar arquivo index.html
      copy:
        content: "Bem Vindos a mentoria devops cloud"
        dest: /var/www/html/index.html

    - name: Instalar o Docker
      apt:
        name: docker.io
        state: present

    - name: Testar Docker
      command: docker --version

    - name: Testar Docker
      command: docker --version
      register: docker_output

    - debug:
        var: docker_output.stdout_lines

    - name: Testar Docker PS
      command: docker ps
      register: docker_ps_output

    - name: Exibir saída do comando Docker PS
      debug:
        var: docker_ps_output.stdout_lines

    - name: Baixar a imagem do Docker Hub
      command: docker pull iesodias/mdc-api-python:latest

    - name: Iniciar o contêiner
      command: docker run -d -p 8080:5000 iesodias/mdc-api-python:latest
```

This lab enhances our Ansible playbook to include tasks for updating the system, installing Nginx, and setting up a basic web server along with Docker installation and container deployment.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).