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
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        environment: ['dev', 'qa', 'hml', 'prd']

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up environment
      run: echo "Setting up ${{ matrix.environment }} environment"

    - name: Install dependencies
      run: echo "Installing dependencies for ${{ matrix.environment }}"

    - name: Build App
      run: echo "Building app for ${{ matrix.environment }} environment"

    - name: Test App
      if: matrix.environment != 'prd'
      run: echo "Testing app for ${{ matrix.environment }} environment"

    - name: Deploy App
      run: echo "Deploying app to ${{ matrix.environment }} environment"
```