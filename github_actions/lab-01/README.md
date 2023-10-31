# GitHub Actions Lab - Introduction

## Step 1: Create a Repository on GitHub

1. Go to [github.com](https://github.com/).
2. Log in to your account.
3. In the top-right corner, click on the `+` icon and select `New repository`.
4. Name your repository `ga-lab-mdc`.
5. Set the repository to `Public`.
6. (Optional) Initialize this repository with a README.
7. Click `Create repository`.

---

## Step 2: Clone the Repository to Your Local Machine

1. In the newly created repository, click on the `Code` button.
2. Copy the provided URL.
3. Open your terminal or command prompt.
4. Clone the repo:

```bash
git clone https://github.com/your_username/ga-lab-mdc.git
```

5. Navigate to the repository directory:

```bash
cd ga-lab-mdc
```

---

## Step 3: Create the GitHub Action

1. Create the directory structure for the Action:

```bash
mkdir -p .github/workflows
```

2. Use your favorite editor to create and edit the workflow file:

```bash
nano .github/workflows/ci_cd_pipeline.yml
```

3. Paste the GitHub Action manifest into the file and save it.

---

## Step 4: Commit and Push Changes to GitHub

1. Add your changes:

```bash
git add .
```

2. Commit your changes:

```bash
git commit -m "Adding CI/CD pipeline"
```

3. Push the changes:

```bash
git push origin main
```

---

**Note:** After pushing, your GitHub Action will trigger based on the defined events in the manifest.

Remember, this is just a basic example. In real-world scenarios, you would use specific commands and scripts tailored to each stage of your CI/CD pipeline.

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).


