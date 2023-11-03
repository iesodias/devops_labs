# Docker Introduction

Docker is an open-source platform that automates the deployment, scaling, and management of applications and services inside containers.

A container is a lightweight, stand-alone, and executable package of software that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files. Containers allow developers to package their applications and dependencies into a single unit, making it easy to move from development to production and run consistently across different environments.

Docker uses a client-server architecture where the client communicates with the Docker daemon, which does the heavy lifting of building, running, and managing containers. The Docker client and daemon communicate using REST APIs, or through a command-line interface (CLI).

Docker also provides tools and services for managing containers, such as Docker Compose for defining and running multi-container applications, and Docker Swarm for orchestration and management of large-scale Docker deployments.

Overall, Docker makes it easier to develop, test, and deploy applications and services, reducing the friction between different stages of the software development lifecycle.

## Docker Introduction
- What problems we have with Traditional Infra?
- Why do we need to use Docker? 
- What are advantages of using Docker?
-  For introduction slides refer the [presentation slides](/otherfiles/presentation/Docker-Fundamentals-v1.pdf). 


# Docker Architecture

Docker's architecture consists of several components, including the Docker client, Docker daemon, Docker registry, and Docker containers.

The Docker client is the command-line tool that communicates with the Docker daemon to build, run, and manage containers. When you run a command like "docker run" or "docker build," it's sent from the client to the daemon.

The Docker daemon is responsible for building, running, and managing containers. It listens for requests from the Docker client, and communicates with the Docker registry to download images needed for containers.

The Docker registry is a place where Docker images are stored and distributed to others. There are public registries like Docker Hub, as well as private registries that organizations can use to store their own images.

Docker containers are the units of software that Docker runs. They include all the files, libraries, and environment variables necessary to run an application. Containers are isolated from each other, ensuring that applications don't interfere with each other.

A common way to represent Docker's architecture is through the following diagram:

Docker architecture diagram

In the diagram, the user interacts with the Docker client, which communicates with the Docker daemon. The Docker daemon communicates with the Docker registry to download images, and with the host operating system to manage containers. The containers run on the host and are isolated from each other, but share the host's kernel.

## Understand Docker Architecture & Docker Terminology
- What is Docker Daemon? 
- What is Docker Client?
- What are Docker Images?
- What are Docker Containers?
- What is Docker Registry or Docker Hub?
-  Refer the [presentation slides](/otherfiles/presentation/Docker-Fundamentals-v1.pdf). 
