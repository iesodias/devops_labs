criando outro playbook

vi playbook-lab-02.yaml

adicionando configuracao de apt-get update e apt-get upgrade

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

abrindo porta 80 para acesso a 

```bash
az vm open-port --resource-group mdc-rg --name mdc-02 --port 80 --priority 1001
```

Instalando docker
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

verificando se a instalação esta ok e funcionando

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

abrindo porta 8080 para acesso a 

```bash
az vm open-port --resource-group mdc-rg --name mdc-02 --port 8080 --priority 1001
```

baixar container e executar

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


