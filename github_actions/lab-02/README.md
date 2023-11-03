# GitHub Actions Lab - Creating Your First Action

## Objective
Learn to create a basic GitHub Action that simulates deployments to `dev`, `qa`, `hml`, and `prd` environments.

## Step 1: Setup the GitHub Repository

1. Sign in to GitHub and create a new repository named `ga-lab-mdc`.
2. Clone the repository locally: `git clone https://github.com/your-username/ga-lab-mdc.git`
3. Navigate into the repository: `cd ga-lab-mdc`
4. Create the directory for GitHub Actions: `mkdir -p .github/workflows`

## Step 2: Create the Workflow

1. Inside the directory `.github/workflows`, create a file named `ci_cd_pipeline.yml`.
2. Paste the following content into the file:

```yaml
name: CI/CD Pipeline

on: push

jobs:
  build_dev:
    runs-on: ubuntu-latest
    env:
      ENVIRONMENT: 'dev'
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up environment
      run: echo "Setting up $ENVIRONMENT environment"

    - name: Install dependencies
      run: echo "Installing dependencies for $ENVIRONMENT"

    - name: Build App
      run: echo "Building app for $ENVIRONMENT environment"

    - name: Test App
      run: echo "Testing app for $ENVIRONMENT environment"

    - name: Deploy App
      run: echo "Deploying app to $ENVIRONMENT environment"

  build_qa:
    needs: build_dev
    runs-on: ubuntu-latest
    env:
      ENVIRONMENT: 'qa'
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up environment
      run: echo "Setting up $ENVIRONMENT environment"

    - name: Install dependencies
      run: echo "Installing dependencies for $ENVIRONMENT"

    - name: Build App
      run: echo "Building app for $ENVIRONMENT environment"

    - name: Test App
      run: echo "Testing app for $ENVIRONMENT environment"

    - name: Deploy App
      run: echo "Deploying app to $ENVIRONMENT environment"

  build_hml:
    needs: build_qa
    runs-on: ubuntu-latest
    env:
      ENVIRONMENT: 'hml'
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up environment
      run: echo "Setting up $ENVIRONMENT environment"

    - name: Install dependencies
      run: echo "Installing dependencies for $ENVIRONMENT"

    - name: Build App
      run: echo "Building app for $ENVIRONMENT environment"

    - name: Test App
      run: echo "Testing app for $ENVIRONMENT environment"

    - name: Deploy App
      run: echo "Deploying app to $ENVIRONMENT environment"

  build_prd:
    needs: build_hml
    runs-on: ubuntu-latest
    env:
      ENVIRONMENT: 'prd'
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up environment
      run: echo "Setting up $ENVIRONMENT environment"

    - name: Install dependencies
      run: echo "Installing dependencies for $ENVIRONMENT"

    - name: Build App
      run: echo "Building app for $ENVIRONMENT environment"

    - name: Deploy App
      run: echo "Deploying app to $ENVIRONMENT environment"
```

Remember, this is just a basic example. In real-world scenarios, you would use specific commands and scripts tailored to each stage of your CI/CD pipeline.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).