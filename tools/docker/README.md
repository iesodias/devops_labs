# Lab: Installing Docker on Ubuntu

In this lab, you will learn how to install Docker on Ubuntu. Follow the steps below:

## Step 1: Add Docker's Official GPG Key

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

This command adds Docker's official GPG key to ensure the authenticity of Docker packages during installation.

## Step 2: Configure the Docker Repository

```bash
echo \
  "deb [arch=\"\$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  \$(. /etc/os-release && echo \"\$VERSION_CODENAME\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

This command configures the official Docker repository on your system, allowing the `apt` system to fetch Docker packages.

## Step 3: Install Docker Engine, containerd, and Docker Compose

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

This updates your system packages and installs Docker Engine, containerd, and Docker Compose. Docker Engine is the core of Docker, while Docker Compose allows you to define multi-image Docker applications.

## Step 4: Add User to the Docker Group

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

This adds your current user to the "docker" group, allowing you to run Docker commands without needing to use "sudo" every time.

## Step 5: Reboot the System

```bash
sudo reboot
```

Restart your system to apply the changes.

## Step 6: Test Docker Installation

```bash
docker run hello-world
```

Run this command to verify if Docker has been successfully installed. You should see a greeting message indicating a successful installation.

You have now successfully installed Docker on Ubuntu and are ready to start using Docker to create and run containers. Be sure to check the [Docker documentation](https://docs.docker.com/) for further information on using Docker.

# Lab: Installing Docker on Windows

In this lab, you will learn how to install Docker on Windows. Follow the steps below:

## Step 1: Install Docker Desktop

1. Download Docker Desktop for Windows from the official Docker website: [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop).

2. Run the installer and follow the installation instructions.

3. Once Docker Desktop is installed, launch it from the Start menu.

## Step 2: Test Docker Installation

1. Open a command prompt or PowerShell window.

2. Run the following command to verify if Docker has been successfully installed:

```powershell
docker --version
```

You should see the Docker version displayed in the output, indicating a successful installation.

## Step 3: Run a Docker Container

1. Open a command prompt or PowerShell window.

2. Run the following command to pull and run a Docker container:

```powershell
docker run hello-world
```

This command will download and run a simple Docker container. You should see a greeting message indicating a successful Docker installation.

You have now successfully installed Docker on Windows and are ready to start using Docker to create and run containers. Be sure to check the [Docker documentation](https://docs.docker.com/) for further information on using Docker.

# Lab: Installing Docker on macOS

In this lab, you will learn how to install Docker on macOS. Follow the steps below:

## Step 1: Install Docker Desktop for Mac

1. Download Docker Desktop for Mac from the official Docker website: [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop).

2. Open the downloaded disk image (DMG) file.

3. Drag the Docker icon to the Applications folder to install Docker Desktop.

4. Launch Docker Desktop from the Applications folder.

## Step 2: Test Docker Installation

1. Open a terminal window.

2. Run the following command to verify if Docker has been successfully installed:

```bash
docker --version
```

You should see the Docker version displayed in the output, indicating a successful installation.

## Step 3: Run a Docker Container

1. Open a terminal window.

2. Run the following command to pull and run a Docker container:

```bash
docker run hello-world
```

This command will download and run a simple Docker container. You should see a greeting message indicating a successful Docker installation.

You have now successfully installed Docker on macOS and are ready to start using Docker to create and run containers. Be sure to check the [Docker documentation](https://docs.docker.com/) for further information on using Docker.
