#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Install Go if not present
if ! command -v go &> /dev/null; then
    echo "Installing Go..."
    wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    rm go1.21.0.linux-amd64.tar.gz
fi

# Required packages
apt update
apt install -y python3-pip git wget make gcc

# Function to install Go tools
install_go_tool() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        go install $2@latest
    else
        echo "$1 already installed"
    fi
}

# Function to install Python tools
install_python_tool() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        pip3 install $1
    else
        echo "$1 already installed"
    fi
}

# Install tools
install_go_tool amass github.com/owasp-amass/amass/v3/...
install_go_tool subfinder github.com/projectdiscovery/subfinder/v2/cmd/subfinder
install_go_tool reconftw github.com/six2dez/reconftw
install_go_tool dnsx github.com/projectdiscovery/dnsx/cmd/dnsx
install_go_tool puredns github.com/d3mondev/puredns
install_go_tool dnsvalidator github.com/vortexau/dnsvalidator
install_go_tool naabu github.com/projectdiscovery/naabu/v2/cmd/naabu
install_go_tool masscan github.com/robertdavidgraham/masscan
install_go_tool httpx github.com/projectdiscovery/httpx/cmd/httpx
install_go_tool aquatone github.com/michenriksen/aquatone
install_go_tool gowitness github.com/sensepost/gowitness
install_go_tool waybackurls github.com/tomnomnom/waybackurls
install_go_tool gau github.com/lc/gau/v2/cmd/gau
install_go_tool waymore github.com/xnl-h4ck3r/waymore
install_go_tool katana github.com/projectdiscovery/katana/cmd/katana
install_go_tool ffuf github.com/ffuf/ffuf
install_go_tool gobuster github.com/OJ/gobuster/v3
install_go_tool feroxbuster github.com/epi052/feroxbuster
install_go_tool whatweb github.com/urbanadventurer/WhatWeb
install_go_tool trufflehog github.com/trufflesecurity/trufflehog
install_go_tool gotator github.com/Josue87/gotator
install_go_tool dnsgen github.com/ProjectAnte/dnsgen
install_go_tool nuclei github.com/projectdiscovery/nuclei/v2/cmd/nuclei

# Install dirsearch (Python tool)
if ! command -v dirsearch &> /dev/null; then
    git clone https://github.com/maurosoria/dirsearch.git
    cd dirsearch
    pip3 install -r requirements.txt
    ln -s $(pwd)/dirsearch.py /usr/local/bin/dirsearch
    cd ..
fi

echo "Installation complete!"
