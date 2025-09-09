# 02.030 Debugging with kdbg

kdbg is technically optional for the course.  I will use it for demos in the lectures.  Whether you use it for debugging is up to you.


`kdbg` is a graphical user interface for `gdb`, the GNU Debugger. It helps visualize program execution, set breakpoints, inspect variables, and step through code.

## Will it Gnome?

Try the following to see if you can install kdbg:

On Ubuntu/Debian:
```bash
sudo apt-get install kdbg
```

If it works, great.  Move on and skip the following.


kdbg is part of the KDE software system.  Some sources say that the kdbg program only works on the KDE Plasma desktop.  Google's AI says it runs under Gnome as well.  

I could not install kdbg under in my Ubuntu Virtual Machine.  Some sources say kdbg only works if hooks for it are compiled into the kernel.  That implies that just installing the KDE Plasma desktop might not even be enough to get it to work.  

You should try it with whatever setup you are using.  I suspect that Kali may have the hooks in its kernel because it has the option to install KDE Plasma at boot.  

Most people are running VMs or WSL.  We may need to work together to find options.

## Virtual Machines

### Virtual Machine + Kali

If kgdb does not work for you in Kali, I suggest that you install a 2nd copy of Kali.  Do not do an "unattended install."  If you do a regular install, Kali will give you the option to use the KDE Plasma desktop.

Chose the `SDDM` desktop manager when you are asked to chose.

### Virtual Machine + Ubuntu

Ubuntu has a spin called Kubuntu that uses the KDE Plasma desktop.  However, there is a system update happening in October, and I had a bad experience after the update.  The update replace Plasma with Gnome.  

I strongly suggest that you go to Fedora and install the [KDE Plasma version of Fedora](https://fedoraproject.org/kde/).  The desktop will look like an older version of Windows, such as Windows 7 or XP.  To update or install software, use `dnf` instead of `apt` or `apt-get.`



## Basic Usage

You should have the -g option in your code for compiling.

1. **Start kdbg**  
    Open a terminal and run:
    ```bash
    kdbg ./your_program
    ```

2. **Set Breakpoints**  
    Click on the left margin next to the line number in the source code view.

3. **Run and Step Through Code**  
    Use the toolbar buttons to run, step over, step into, or continue execution.

4. **Inspect Variables**  
    View and expand variables in the variable pane to see their current values.

## Tips

- Use the "Watches" pane to monitor specific variables.
- Double-click on a variable to see its detailed value.
- Right-click in the source view for more options.

## Resources

- [kdbg Documentation](https://www.kdbg.org/)
- [GDB Manual](https://www.gnu.org/software/gdb/documentation/)
