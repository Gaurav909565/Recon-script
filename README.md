# Reconnaissance script

This toolkit is a Bash script designed to automate various stages of reconnaissance for cybersecurity purposes. It performs subdomain enumeration, directory scanning, XSS detection, and more, using popular tools and APIs.

---

## Features

- **Subdomain Enumeration**: Combines results from Subfinder and Amass.
- **Alive Subdomain Detection**: Identifies live subdomains using HTTPX.
- **Directory Crawling**: Gathers directories using Katana and Waybackurls.
- **XSS Detection**: Scans for Cross-Site Scripting vulnerabilities using Dalfox.
- **CRT.sh Integration**: Retrieves certificate transparency logs for domains.

---

## Prerequisites

Ensure the following tools are installed:
- `subfinder`
- `amass`
- `httpx`
- `katana`
- `waybackurls`
- `dalfox`
- `jq`
- `curl`

Install missing tools using their respective package managers.

---

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/recon-toolkit.git
cd recon-toolkit
```

2. Set Up Permissions and make the script is an executable:
```
chmod +x recon.sh
```

4. Run the Script
Example Commands:
Help Menu:
```
./recon.sh -h
```
Interactive Mode:
```
./recon.sh -i
```
This mode allows you to enter domains one by one interactively.

Run a Specific Mode:
```
./recon.sh -m subs example.com
```
Replace subs with your desired mode:

- subs: Subdomain enumeration
- alive_subs: Alive subdomains detection
- dir: Directory scanning
- xss: XSS vulnerability scanning
- crt: Certificate transparency scan

Run All Modes:
```
./recon.sh example.com
```
Output:
- All results are saved in a directory named <domain>_recon.
- A comprehensive report is generated in <domain>_recon/report.


Disclaimer:

This script is intended for ethical hacking and educational purposes only. Use it exclusively on domains you own or have explicit permission to test. Unauthorized use of this script against third-party systems may violate laws and result in legal consequences. The author assumes no responsibility for misuse or damage caused by this tool.


Contributing:

Contributions are welcome! Feel free to submit issues or pull requests to improve this script.
