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

# Function to install Subfinder
install_subfinder() {
    if is_installed subfinder; then
        echo "Subfinder is already installed."
    else
        echo "Installing Subfinder..."
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
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
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
        sudo ln -s "$HOME/go/bin/httpx" /usr/local/bin/httpx
        echo "Httpx installed successfully."
    fi
}

# Function to install Nuclei
install_nuclei() {
    if is_installed nuclei; then
        echo "Nuclei is already installed."
    else
        echo "Installing Nuclei..."
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
        sudo ln -s "$HOME/go/bin/nuclei" /usr/local/bin/nuclei
        echo "Nuclei installed successfully."
    fi
}

# Function to install Assetfinder
install_assetfinder() {
    if is_installed assetfinder; then
        echo "Assetfinder is already installed."
    else
        echo "Installing Assetfinder..."
        go install github.com/tomnomnom/assetfinder@latest
        sudo ln -s "$HOME/go/bin/assetfinder" /usr/local/bin/assetfinder
        echo "Assetfinder installed successfully."
    fi
}

# Function to install Eyewitness
install_eyewitness() {
    if is_installed eyewitness; then
        echo "Eyewitness is already installed."
    else
        echo "Installing Eyewitness..."
        sudo apt install -y eyewitness
        echo "Eyewitness installed successfully."
    fi
}

# Function to install Katana
install_katana() {
    if is_installed katana; then
        echo "Katana is already installed."
    else
        echo "Installing Katana..."
        go install github.com/projectdiscovery/katana/cmd/katana@latest
        sudo ln -s "$HOME/go/bin/katana" /usr/local/bin/katana
        echo "Katana installed successfully."
    fi
}

# Function to install Waybackurls
install_waybackurls() {
    if is_installed waybackurls; then
        echo "Waybackurls is already installed."
    else
        echo "Installing Waybackurls..."
        go install github.com/tomnomnom/waybackurls@latest
        sudo ln -s "$HOME/go/bin/waybackurls" /usr/local/bin/waybackurls
        echo "Waybackurls installed successfully."
    fi
}

# Function to install Gau
install_gau() {
    if is_installed gau; then
        echo "Gau is already installed."
    else
        echo "Installing Gau..."
        go install github.com/lc/gau/v2/cmd/gau@latest
        sudo ln -s "$HOME/go/bin/gau" /usr/local/bin/gau
        echo "Gau installed successfully."
    fi
}

# Function to install JSFinder
install_jsfinder() {
    if is_installed jsfinder; then
        echo "JSFinder is already installed."
    else
        echo "Installing JSFinder..."
        git clone https://github.com/Threezh1/JSFinder.git
        cd JSFinder
        pip3 install -r requirements.txt
        sudo ln -s "$(pwd)/jsfinder.py" /usr/local/bin/jsfinder
        cd ..
        echo "JSFinder installed successfully."
    fi
}

# Execute the installation functions
install_go
install_nmap
install_subfinder
install_httpx
install_nuclei
install_assetfinder
install_eyewitness
install_katana
install_waybackurls
install_gau
install_jsfinder

echo "All programs installed and configured successfully."
