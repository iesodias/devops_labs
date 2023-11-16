# Lab: Understanding Bash Functions

## Prerequisites:
- You must have a Linux system or a terminal with Bash.

## Step 1: Create a Directory for the Lab

Create a dedicated directory for the lab and navigate to it:

```bash
mkdir bash-functions-lab
cd bash-functions-lab
```

## Step 2: Create a Basic Function

Create a file named `my_functions.sh`:

```bash
touch my_functions.sh
```

Open `my_functions.sh` and add a basic function:

```bash
vi my_functions.sh
```

Write the following function:

```bash
hello_mdc() {
    echo "Hello, MDC University!"
}
```

## Step 3: Source the Functions File

Source the functions file to make the function available in your session:

```bash
source my_functions.sh
```

## Step 4: Execute the Function

Execute the `hello_world` function:

```bash
hello_mdc
```

## Step 5: Create a Function with Parameters

Edit `my_functions.sh` to add a function that accepts parameters:

```bash
vi my_functions.sh
```

Add the following function:

```bash
greet_person() {
    echo "Hello, $1!"
}
```

Source the file again:

```bash
source my_functions.sh
```

Execute the function with a parameter:

```bash
greet_person "Alice"
```

## Step 6: Implement Help Feature

Modify `greet_person` to include a help feature if no parameters are passed:

```bash
greet_person() {
    if [ $# -eq 0 ]; then
        echo "Usage: greet_person [name]"
        return 1
    fi
    echo "Hello, $1!"
}
```

Source and test the help feature:

```bash
source my_functions.sh
greet_person
```

---

> 🚨 **Off-topic**: Hey there! If you're passionate about DevOps like I am and want to take your skills to the next level, I run a specialized DevOps mentorship. 🧠🛠 Dive deeper into the world of continuous integration, deployment, and best practices with me! 🚀 Oh, and for some cool tech content and behind-the-scenes, make sure to follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/).
> ### 🌐 **Join the DevOps Mentorship!**
> Interested in taking your DevOps journey to the next level? Apply for the specialized mentorship now! [Apply for DevOps Mentorship](https://guilhermemaia.com/mentoria-devops).
