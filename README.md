# Reconnaissance script

This toolkit is a Bash script designed to automate various stages of reconnaissance for cybersecurity purposes. It performs subdomain enumeration, directory scanning, XSS detection, and more, using popular tools and APIs.

---

## Features

- **Subdomain Enumeration**: Combines results from Subfinder and Assetfinder.
- **Live Subdomain Detection**: Identifies live subdomains using HTTPX.
- **Web Screenshotting**: Captures screenshots of live subdomains using Eyewitness.
- **Subdomain Categorization**: Groups subdomains by potential interest (e.g., admin panels, APIs).
- **URL Gathering**: Crawls live sites for URLs using Katana, Waybackurls and Gau.
- **URL Categorization**: Separates URLs by file extension (JS, backups) and potential impact (IDOR, redirects).
- **Secret Scanning**: Searches JavaScript files for API keys and other secrets using JSFinder.
- **Vulnerability Scanning (Optional)**: Performs scans with Nmap and Nuclei when the `-v` flag is used.

---

## Prerequisites

Ensure the following tools are installed:
- `subfinder`
- `assetfinder`
- `httpx`
- `eyewitness`
- `katana`
- `waybackurls`
- `gau`
- `jsfinder`
- `nmap`
- `nuclei`
- `go`
- `jq`
- `curl`

You can use the `install.sh` script to install all the required tools.

---

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/recon-toolkit.git
cd recon-toolkit
```

### 2. Set Up Permissions
Make the scripts executable:
```bash
chmod +x recon.sh install.sh
```

### 3. Install the required tools
```bash
./install.sh
```

### 4. Run the Script

**Default Scan:**
Runs the full reconnaissance workflow, from subdomain enumeration to URL analysis.
```bash
./recon.sh example.com
```

**Scan with Vulnerability Scanning:**
Adds Nmap and Nuclei scans to the workflow.
```bash
./recon.sh -v example.com
```

**Interactive Mode:**
Allows you to enter domains one by one.
```bash
./recon.sh -i
```
To run a vulnerability scan in interactive mode, use the `-v` flag:
```bash
./recon.sh -i -v
```

### Output
- All results are saved in a directory named `<domain>_recon`.
- The directory includes categorized subdomains, URLs, screenshots, and scan results.

---

## Disclaimer

This script is intended for ethical hacking and educational purposes only. Use it exclusively on domains you own or have explicit permission to test. Unauthorized use of this script against third-party systems may violate laws and result in legal consequences. The author assumes no responsibility for misuse or damage caused by this tool.

---

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this script.
