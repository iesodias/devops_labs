# Zsh and Oh My Zsh Installation Guide on Ubuntu

## Prerequisites:
- An Ubuntu machine or a Debian-based Linux distribution.
- Superuser privileges (either `root` user or ability to use `sudo`).

## Step 1: Install Zsh
First, install Zsh, a powerful shell that improves upon Bash with features like themes and plugins.
```bash
sudo apt update
sudo apt install zsh -y
```

## Step 2: Make Zsh Your Default Shell
After installation, make Zsh your default shell with the following command:
```bash
chsh -s \$(which zsh)
```
Log out and log back in (or restart) for the change to take effect.

## Step 3: Install Oh My Zsh
Oh My Zsh is a framework for managing Zsh configuration with lots of themes and plugins for ease of use.
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Step 4: Configure Oh My Zsh
You can change the default theme by editing the \`~/.zshrc\` configuration file.
```bash
nano ~/.zshrc
```
Inside the file, find the following line:
```zsh
ZSH_THEME="robbyrussell"
```
Change "robbyrussell" to any theme of your choice, which can be found on the [Oh My Zsh Themes page](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

## Step 5: Install Oh My Zsh Plugins (Optional)
Oh My Zsh has an extensive plugin system. To install a plugin, clone the plugin repository into `~/.oh-my-zsh/custom/plugins/` and add the plugin to the plugins list in your `~/.zshrc`.
For example, to install `zsh-syntax-highlighting` plugin:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
And then add `zsh-syntax-highlighting` to the list of plugins in the `~/.zshrc`.
```zsh
plugins=(... zsh-syntax-highlighting)
```
Save and close the file, then restart the terminal or type `source ~/.zshrc` to apply the changes.

## Set the Spaceship Prompt as Default Theme for Oh My Zsh!
Spaceship Prompt is a Zsh theme focused on the information you need while you work, with a sleek and modern design.

## Step 6: Install Git (if not already installed):
```bash
sudo apt-get install git
```

## Step 7: Clone the Spaceship Prompt repository:
```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```

## Step 8: Create a symlink for the Spaceship theme:
```bash
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

## Step 9: Edit your `.zshrc` file to set the theme:
If you have Visual Studio Code installed, you can open the `.zshrc` file using the command below:
```bash
code ~/.zshrc
```
Or, you can use `vi` or any other text editor of your choice:
```bash
vi ~/.zshrc
```

## Step 10: Configure Spaceship theme settings:
Add the following lines to the end of your `.zshrc` file:
```zsh
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
```
