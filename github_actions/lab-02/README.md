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

on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - name: Set env
      run: echo "ENVIRONMENT=${GITHUB_REF#refs/heads/}" >> $GITHUB_ENV

    - name: Deploy
      run: |
        if [ "${ENVIRONMENT}" == "dev" ]; then
          echo "Deploying to Development..."
        elif [ "${ENVIRONMENT}" == "qa" ]; then
          echo "Deploying to QA..."
        elif [ "${ENVIRONMENT}" == "hml" ]; then
          echo "Deploying to HML..."
        elif [ "${ENVIRONMENT}" == "prd" ]; then
          echo "Deploying to Production..."
        else
          echo "No environment found!"
        fi
```