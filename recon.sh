#!/bin/bash

source ./scan.lib

# Default behavior
VULN_SCAN=false
INTERACTIVE=false

# Help menu
show_help() {
    echo "Usage: $0 [options] [domain]"
    echo
    echo "Options:"
    echo "  -i          Interactive mode. Enter domains one by one."
    echo "  -v          Run vulnerability scans (Nmap, Nuclei)."
    echo "  -h          Show this help message."
    echo
    echo "Examples:"
    echo "  $0 example.com"
    echo "  $0 -v example.com"
    echo "  $0 -i"
}

# Parse options
while getopts "ivh" OPTION; do
  case $OPTION in
    i)
      INTERACTIVE=true
      ;;
    v)
      VULN_SCAN=true
      ;;
    h)
      show_help
      exit 0
      ;;
    *)
      show_help
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

# --- Main Functions ---

run_recon() {
    domain=$1
    if [[ -z "$domain" ]]; then
        error "No domain provided."
        return
    fi

    # Sanitize domain input
    domain=$(echo "$domain" | sed -e 's|^https?://||' -e 's|/$||')
    info "Starting reconnaissance for: $domain"
    
    directory="${domain}_recon"
    info "Creating output directory: $directory"
    rm -rf "$directory"
    mkdir -p "$directory/Extra"

    # Execute reconnaissance workflow
    gather_subdomains
    check_live_subdomains
    screenshot_subdomains
    categorize_subdomains
    gather_urls
    categorize_urls_by_extension
    find_secrets
    categorize_urls_by_impact

    # Run vulnerability scan if -v flag is provided
    if [ "$VULN_SCAN" = true ]; then
        run_vulnerability_scan
    fi

    info "Reconnaissance complete for $domain."
}

# --- Execution Logic ---

if [ "$INTERACTIVE" = true ]; then
    while true; do
        read -p "Enter a domain (or 'exit' to quit): " input
        if [[ "$input" == "exit" ]]; then
            break
        fi
        run_recon "$input"
    done
else
    if [ -z "$1" ]; then
        error "No domain provided. Use -h for help."
        exit 1
    fi
    run_recon "$1"
fi
