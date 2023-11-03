# Lab: Setting up Ingress in Kubernetes with Kind

## Prerequisites:
- You must have Docker and Kind (Kubernetes in Docker) installed on your system.

## Step 1: Create a Directory for the Lab

Create a dedicated directory for the lab and navigate to it:

```bash
mkdir mdc-kind-lab
cd mdc-kind-lab
```

## Step 2: Configure Hosts

In your operating system (Windows or Linux), add an entry to the `/etc/hosts` file with the IP address that looks like:

- Windows:
```bash
  C:\Windows\System32\drivers\etc\hosts
```

- Linux:
```bash
  /etc/hosts
```

Add the following entry:

```bash
127.0.0.1 kubernetes.docker.internal
```

## Step 3: Create a Kind Cluster

Create a Kind cluster using a configuration file (assuming you have a file named `kind.yaml` with the cluster configuration):

```bash
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    kubeadmConfigPatches:
      - |
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"
                
    extraPortMappings:
      - containerPort: 80
        hostPort: 80
        protocol: TCP
      - containerPort: 443
        hostPort: 443
        protocol: TCP
```

Execute the following command to create the Kind cluster:

```bash
kind create cluster --config=kind.yaml
```

## Step 4: Create an Ingress Namespace

Create a namespace named `ingress-nginx`:

```bash
kubectl create ns ingress-nginx
```

## Step 5: Helm Upgrade

Use Helm to upgrade ingress-nginx with the necessary configurations:

```bash
helm upgrade -i ingress-nginx ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
--set controller.metrics.enabled=true \
--set controller.podAnnotations."prometheus\.io/scrape"=true \
--set controller.podAnnotations."prometheus\.io/port"=10254
```

## Step 6: Deploy the nginx-ingress Controller

Deploy the nginx-ingress controller to your Kind cluster using the following command:

```bash
kubectl apply --filename https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
```

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).