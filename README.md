# Security Tools Auto-Installer 🛡️

## Overview

This powerful bash script automates the installation and verification of 25 essential security tools for penetration testing, reconnaissance, and security assessments. It eliminates the tedious process of manually installing each tool and managing dependencies.

## Features ✨

- Automatic dependency resolution (Go, Python, required packages)
- Smart installation checks (only installs missing tools)
- Error handling and validation
- Root privilege verification
- Support for both Go and Python-based tools
- Clean output logging

## Tools Included 🔧

### Reconnaissance
- Amass - Attack surface mapping
- Subfinder - Subdomain discovery
- ReconFTW - Comprehensive recon framework
- DNSx/PureDNS - DNS toolkit
- DNSvalidator - DNS validation

### Network Scanning
- Naabu - Port scanning
- Nmap - Network mapper
- Masscan - Mass IP port scanner
- Httpx - HTTP probe

### Visual Reconnaissance
- Aquatone - Domain screenshots
- Gowitness - Web screenshotting

### Content Discovery
- Waybackurls - Historical URL finder
- Gau - Get All URLs
- Waymore - Enhanced wayback machine
- Katana - Web crawler
- Ffuf/Dirsearch/Gobuster/Feroxbuster - Directory brute forcing

### Analysis
- Whatweb - Web scanner
- Trufflehog - Secret finder
- Nuclei - Vulnerability scanner

## Installation 🚀

1. Clone the repository:
```bash
git clone https://github.com/raymondnes/recon_tools.git
cd recon_tools
```

2. Make the script executable:
```bash
chmod +x install.sh
```

3. Run the script with root privileges:
```bash
sudo ./install.sh
```

## Requirements 📋

- Ubuntu/Debian-based system
- Root privileges
- Internet connection
- Minimum 5GB free disk space

## Usage Examples 💡

Basic installation:
```bash
sudo ./install.sh
```

Check tool versions:
```bash
for tool in amass subfinder nuclei; do
    $tool -version
done
```

## Troubleshooting 🔍

Common issues and solutions:

1. Go installation fails:
```bash
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
```

2. Permission denied:
```bash
sudo chmod +x install.sh
```

3. Tool not found after installation:
```bash
hash -r
source ~/.bashrc
```

## Contributing 🤝

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to branch
5. Open a Pull Request

## Security Notice ⚠️

These tools are meant for authorized security testing only. Always:
- Obtain proper authorization before testing
- Follow responsible disclosure guidelines
- Comply with local laws and regulations
- Use in controlled environments first

## License 📄

MIT License - See LICENSE file for details

## Acknowledgments 🙏

Thanks to all the original tool creators and the security community.

---

Made with ❤️ by [Your Name]

Remember to ⭐ if you find this useful!
