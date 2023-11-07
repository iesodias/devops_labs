# Lab: Installing and Verifying kubectl

## Prerequisites:
- You must have command-line access to a Linux-based operating system.
- You must have `curl` installed to download `kubectl`.
- You need `sudo` privileges to move the binary to a directory within your PATH.

## Step 1: Download kubectl

Download the latest stable version of the `kubectl` binary using curl:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

## Step 2: Make kubectl Executable

Change the permissions of the downloaded binary to make it executable:

```bash
chmod +x ./kubectl
```

## Step 3: Move the Binary to PATH

Move the `kubectl` binary to `/usr/local/bin/` which is usually included in the system's PATH:

```bash
sudo mv ./kubectl /usr/local/bin/kubectl
```

## Step 4: Verify Installation

Ensure `kubectl` is properly installed by checking its version:

```bash
kubectl version --client
```

If the version information is displayed correctly, `kubectl` is successfully installed and ready to interact with your Kubernetes cluster.

**Note:** The path to the kubeconfig may differ based on how your Kubernetes cluster is set up.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).