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
nano my_functions.sh
```

Write the following function:

```bash
hello_world() {
    echo "Hello, world!"
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
hello_world
```

## Step 5: Create a Function with Parameters

Edit `my_functions.sh` to add a function that accepts parameters:

```bash
nano my_functions.sh
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

> 🚨 **Extra Resource**: Want to dive deeper into Bash scripting and Linux command-line prowess? Check out my specialized mentorship program where we explore advanced topics in scripting and system automation! 🚀 Follow me on Instagram 📸 [@iesofdias](https://www.instagram.com/iesofdias/) for tech tips and updates. 
> ### 🌐 **Join the Bash Scripting Journey!**
> Ready to master Bash scripting? Apply for my mentorship program now! [Apply for Bash Scripting Mentorship](https://guilhermemaia.com/mentoria-devops).
