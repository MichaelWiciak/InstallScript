
Doing Rocky-10.2-x86_64-minimal.iso for asus ux434F notebook PC. 

It has simulaneos ultithreading enabled so thats a consideration.

SSH into it.
Setup a static IP address by running
sudo nmcli con mod "Wired connection 1" ipv4.addresses 192.168.1.179/24 ipv4.gateway 192.168.1.1 ipv4.dns "192.168.1.1 8.8.8.8" ipv4.method manual
but that depends on output of commands (lets programatically calcualte this and sutomatically set this.)

Then make sure turning down the lid will not turn off the box by running. 
sudo vi /etc/systemd/logind.conf
[Login]
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore

And adding that. 
sudo systemctl restart systemd-logind
to restart

then add package updates of 
# 1. Update packages and enable EPEL (Extra Packages for Enterprise Linux)
sudo dnf update -y
sudo dnf install -y epel-release

# 2. Install essential compilers, build tools, and modern C++ support
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y gcc-c++ clang cmake ninja-build gdb git

# 3. Install low-level profiling & system performance tools
sudo dnf install -y perf valgrind htop numactl

# 4. Install Neovim & Tmux for persistent terminal sessions
sudo dnf install -y neovim tmux

then configure tmux to run every time one ssh into the server so connection never Install

then setting up cloudflare tunnel to connect while outside the network?

then automatic setup of git + ssh setup?

+ then lazy vim / seeing how thtat works on the server

