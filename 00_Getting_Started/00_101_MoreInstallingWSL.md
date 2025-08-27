# 00.101 Installing WSL

Microsoft instructions for setting up Windows Subsystem for Linux (WSL) are at [https://learn.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)

Linux has different distributions.  Microsoft uses the Ubuntu distribution by default.  Ubuntu will work fine for this course.  You can install another distribution later if you want to play around.  I suggest that you go to the Microsoft instructions and then come back here to customize the install for your specific purposes.

## Start WSL

After the install is complete, go to the start menu and start "Ubuntu."  You will need to set up a username and password. 

The first thing you should do after installing Linux is to update to the latest version of the software.  This is usually quick with WSL, but I recommend doing it anyway.

In the terminal, do an update by typing 

```text
sudo apt update
sudo apt upgrade
```    
If there are upgrades, you will need to hit "y" for yes to complete the upgrade.

## Is the `as` Assembler Installed?


Check to see if the as assembler is already installed (it probably is not)  Check by typing the command 

```
as -version
```

If the as assembler is not available, you should be able to install it by typing 

```
sudo apt install binutils 
```

You will need to hit "y" to complete the install.

If that does not work, try 

```
sudo apt install build-essential
```

### What's up with `sudo`

Putting "sudo" in front of another command makes you a temporary administrator.  When you install almost any distribution of Linux, the first user you create will be an administrator who is authorized to use sudo.

Linux is a version of Unix.  Under Unix, the administrator was named "root"  So you will see sudo referred to as the "root user."  I am not sure, but this may also be how MacOS works because MacOS is a form of BSD Unix.

## Editor and Other Software

I suggest that you add the Kate editor, the terminator program, and the vim editor.   These can all be installed with the command 

```
sudo apt install kate vim terminator
```

Finally, install the three most important commands in Linux:  

```
sudo apt install cowsay lolcat figlet
```

## Try out the software

Try the assembler again.  You should also try your editor.