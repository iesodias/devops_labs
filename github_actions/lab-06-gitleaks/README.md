# Lab: Integrating Gitleaks with GitHub Actions

## Objective:
Create a GitHub Actions workflow that utilizes Gitleaks to scan your repository for secrets on every push and pull request.

## Prerequisites:
- A GitHub account
- A repository on GitHub to work with
- Basic understanding of YAML and GitHub Actions

## Steps to Configure Gitleaks with GitHub Actions:

### Step 1: Access Your GitHub Repository
- Navigate to your GitHub repository where you want to integrate Gitleaks.

### Step 2: Create a New Workflow
- Go to the `Actions` tab in your GitHub repository.
- Click on `New workflow`.
- Skip the starter workflows and choose to set up a workflow yourself.

### Step 3: Configure the Workflow File
- GitHub will create a new file `.github/workflows/main.yml`. Replace the content of the file with the following:

```yaml
name: Gitleaks

on: [push, pull_request]

jobs:
  gitleaks:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Gitleaks Action with Config
      uses: gitleaks/gitleaks-action@v2
      env:
        GITHUB_TOKEN: \${{ secrets.GITHUB_TOKEN }}
```

- This code defines a job named `gitleaks` that runs on the latest version of Ubuntu and performs two steps: checks out the code and runs the Gitleaks action.

### Step 4: Commit the Workflow File
- Commit the new file to the `.github/workflows/` directory. This directory is where GitHub looks for workflow files.
- Name the file `gitleaks.yml`.
- Commit the file directly to the `main` branch, or create a new branch and open a pull request if you prefer.

### Step 5: Verify the Action
- Make a push to your repository or create a pull request to trigger the workflow.
- Go to the `Actions` tab again to see if the workflow runs successfully.

### Step 6: Test the Gitleaks Action
- To ensure that Gitleaks is properly set up, we can create a test by adding a file with fake secrets.
- Add a new file named `secrets.txt` to your repository with the following content:

```t
# Fake AWS Access Key (example)
AKIAIOSFODNN7EXAMPLE

# Fake AWS Secret Key (example)
wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

- Commit and push this `secrets.txt` file to your repository.

### Step 7: Observe the Action Trigger
- After pushing, navigate to the `Actions` tab of your GitHub repository.
- You should see the workflow running. It should fail, indicating that Gitleaks has detected the patterns that resemble secrets.

### Step 8: Confirm Leak Detection
- Once the action fails, click on the workflow run to view the details.
- You should be able to see the output from the Gitleaks action, indicating that it has found the contents of `secrets.txt` to be potential secrets.

### Step 9: Cleanup
- After confirming that Gitleaks is working, remove the `secrets.txt` file from your repository and push the changes.
- This will ensure that your test secrets are not left in the history of your main branch.

## Conclusion:
You've now successfully integrated Gitleaks with GitHub Actions to scan your codebase for secrets automatically. This workflow will help ensure that no sensitive information is unintentionally pushed to your repository, enhancing your project's security.
