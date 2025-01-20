#!/bin/bash

source ./scan.lib

while getopts "m:ih" OPTION; do
  case $OPTION in
    m)
      MODE=$OPTARG
      ;;
    i)
      INTERACTIVE=true
      ;;
    h)
      # Display all available modes
      echo "Available modes with -m :"
      echo "-m crt        : Perform a crt.sh scan"
      echo "-m subs       : Perform a subdomain scan"
      echo "-m alive_subs : Perform an alive subdomain scan"
      echo "-m dir        : Perform a directory scan"
      echo "-m xss        : Perform an XSS scan"
      exit 0
      ;;
    *)
      echo "Invalid option"
      exit 1
      ;;
  esac
done

scan_domain(){
  domain=$1
  if [[ "$domain" =~ ^https?:// ]]; then
    # Remove https:// and http://
    domain=${domain#https://}
    domain=${domain#http://}
    echo "[-] Removing https:// or http:// from $domain"
  fi

  # Check if it does not end with a /
  if [[ "$domain" != */ ]]; then
    echo "Domain : $domain"
  else
    # Remove trailing /
    domain=${domain%/}
    echo "[-] Removing / from $domain"
  fi
  directory=${domain}_recon
  echo "[+] Creating directory $directory and $directory/Extra"
  rm -rf $directory
  mkdir $directory
  mkdir $directory/Extra
  case $MODE in
    crt)
      crt_scan
      ;;
    subs)
      subdomain_scan
      ;;
    alive_subs)
      alive_subdomain_scan
      ;;
    dir)
      directory_scan
      ;;
    xss)
      xss_scan
      ;;
    *)
      crt_scan
      subdomain_scan
      alive_subdomain_scan
      directory_scan
      ;;
  esac
}

report_domain(){
  domain=$1
  if [[ "$domain" =~ ^https?:// ]]; then
    # Remove https:// and http://
    domain=${domain#https://}
    domain=${domain#http://}
    echo "[-] Removing https:// or http:// from $domain"
  fi
  # Check if it does not end with a /
  if [[ "$domain" != */ ]]; then
    echo "Domain : $domain"
  else
    # Remove trailing /
    domain=${domain%/}
    echo "[-] Removing / from $domain"
  fi
  directory=${domain}_recon
  echo "[+] Generating recon report for $domain..."
  today=$(date)
  echo "[+] This scan was created on $today" > $directory/report
  if [ -f $directory/crt ];then
    echo "[+] Results for crt.sh:" >> $directory/report
    jq -r ".[] | .name_value" $directory/crt >> $directory/report
  fi
  if [ -f $directory/subdomain.txt ];then
    echo "[+] Results for subdomain scan:" >> $directory/report
    cat $directory/subdomain.txt >> $directory/report
  fi
  if [ -f $directory/alive_subdomains.txt ];then
    echo "[+] Results for alive subdomain scan:" >> $directory/report
    cat $directory/alive_subdomains.txt >> $directory/report
  fi
  if [ -f $directory/allurls.txt ];then
    echo "[+] Results for directory scan:" >> $directory/report
    cat $directory/allurls.txt >> $directory/report
  fi
  if [ -f $directory/param.txt ];then
    echo "[+] Results for parameters scan:" >> $directory/report
    cat $directory/param.txt >> $directory/report
  fi
  if [ -f $directory/xss_report.txt ];then
    echo "[+] Results for XSS scan:" >> $directory/report
    cat $directory/xss_report.txt >> $directory/report
  fi
}

if [ $INTERACTIVE ];then
  input="BLANK"
  while [ $input != "exit" ];do
    echo "Please enter a domain > "
    read input
    if [ $input != "exit" ];then
      scan_domain $input
      report_domain $input
    fi
  done
else
  for i in "${@:$OPTIND:$#}";do
    scan_domain $i
    report_domain $i
  done
fi
