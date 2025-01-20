#!/bin/bash

# Function to check if a program is installed
is_installed() {
    command -v "$1" &>/dev/null
}

# Function to install Go
install_go() {
    if is_installed go; then
        echo "Go is already installed."
    else
        echo "Installing Go..."
        sudo apt update
        sudo apt install -y golang-go
        echo "Go installed successfully."
    fi
}

# Function to install Nmap
install_nmap() {
    if is_installed nmap; then
        echo "Nmap is already installed."
    else
        echo "Installing Nmap..."
        sudo apt update
        sudo apt install -y nmap
        echo "Nmap installed successfully."
    fi
}

# Function to install Gobuster
install_gobuster() {
    if is_installed gobuster; then
        echo "Gobuster is already installed."
    else
        echo "Installing Gobuster..."
        go install github.com/OJ/gobuster@latest
        sudo ln -s "$HOME/go/bin/gobuster" /usr/local/bin/gobuster
        echo "Gobuster installed successfully."
    fi
}

# Function to install Amass
install_amass() {
    if is_installed amass; then
        echo "Amass is already installed."
    else
        echo "Installing Amass..."
        go install github.com/OWASP/Amass/v3@latest
        sudo ln -s "$HOME/go/bin/amass" /usr/local/bin/amass
        echo "Amass installed successfully."
    fi
}

# Function to install Dirsearch
install_dirsearch() {
    if is_installed dirsearch; then
        echo "Dirsearch is already installed."
    else
        echo "Installing Dirsearch..."
        git clone https://github.com/maurosoria/dirsearch.git
        sudo ln -s "$(pwd)/dirsearch/dirsearch.py" /usr/local/bin/dirsearch
        echo "Dirsearch installed successfully."
    fi
}

# Function to install Subfinder
install_subfinder() {
    if is_installed subfinder; then
        echo "Subfinder is already installed."
    else
        echo "Installing Subfinder..."
        go install github.com/projectdiscovery/subfinder/v2@latest
        sudo ln -s "$HOME/go/bin/subfinder" /usr/local/bin/subfinder
        echo "Subfinder installed successfully."
    fi
}

# Function to install Httpx
install_httpx() {
    if is_installed httpx; then
        echo "Httpx is already installed."
    else
        echo "Installing Httpx..."
        go install github.com/projectdiscovery/httpx/cmd/httpx@latest
        sudo ln -s "$HOME/go/bin/httpx" /usr/local/bin/httpx
        echo "Httpx installed successfully."
    fi
}

# Function to install Dalfox
install_dalfox() {
    if is_installed dalfox; then
        echo "Dalfox is already installed."
    else
        echo "Installing Dalfox..."
        go install github.com/hahwul/dalfox/v2@latest
        sudo ln -s "$HOME/go/bin/dalfox" /usr/local/bin/dalfox
        echo "Dalfox installed successfully."
    fi
}

# Function to install Feroxbuster
install_feroxbuster() {
    if is_installed feroxbuster; then
        echo "Feroxbuster is already installed."
    else
        echo "Installing Feroxbuster..."
        sudo apt update
        sudo apt install -y feroxbuster
        echo "Feroxbuster installed successfully."
    fi
}

# Function to install XSSStrike
install_xssstrike() {
    if is_installed xssstrike; then
        echo "XSSStrike is already installed."
    else
        echo "Installing XSSStrike..."
        git clone https://github.com/s0md3v/XSStrike.git
        cd XSStrike
        pip3 install -r requirements.txt
        sudo ln -s "$(pwd)/xssstrike.py" /usr/local/bin/xssstrike
        cd ..
        echo "XSSStrike installed successfully."
    fi
}

# Execute the installation functions
install_go
install_nmap
install_gobuster
install_amass
install_dirsearch
install_subfinder
install_httpx
install_dalfox
install_feroxbuster
install_xssstrike

echo "All programs installed and configured successfully."
