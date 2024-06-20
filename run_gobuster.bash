#!/bin/bash

# Prompt the user for the domain list file with tab completion
read -e -rp "Enter the path to your domain list file: " DOMAIN_LIST

# Check if the domain list file exists
if [[ ! -f "$DOMAIN_LIST" ]]; then
    echo "Domain list file '$DOMAIN_LIST' not found!"
    exit 1
fi

# Prompt the user for the wordlist path with tab completion
read -e -rp "Enter the path to your wordlist file: " WORDLIST

# Check if the wordlist file exists
if [[ ! -f "$WORDLIST" ]]; then
    echo "Wordlist file '$WORDLIST' not found!"
    exit 1
fi

# Create a directory for the output if it doesn't exist
OUTPUT_DIR="gobuster_results"
mkdir -p "$OUTPUT_DIR"

# Iterate over each domain in the list
while IFS= read -r domain; do
    # Skip empty lines and comments
    [[ -z "$domain" || "$domain" =~ ^# ]] && continue

    # Create a valid filename for the output
    safe_domain=$(echo "$domain" | sed 's/[^a-zA-Z0-9._-]/_/g')
    OUTPUT_FILE="$OUTPUT_DIR/${safe_domain}.gobuster.out"

    echo "Running gobuster for: $domain"

    # Run gobuster
    sudo gobuster dir -w "$WORDLIST" -u "$domain" -o "$OUTPUT_FILE"

    echo "Gobuster results saved to: $OUTPUT_FILE"
    echo

done < "$DOMAIN_LIST"
