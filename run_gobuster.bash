#!/bin/bash

# Function to prompt user if arguments are not provided
function prompt_for_file() {
    local prompt_message="$1"
    local default_value="$2"
    local input_var

    read -rp "$prompt_message" input_var
    echo "${input_var:-$default_value}"
}

# Prompt for sudo password
read -rsp "Enter your sudo password: " SUDO_PASSWORD
echo

# Check if domain list is provided as argument or prompt
DOMAIN_LIST="${1:-$(prompt_for_file 'Enter the path to your domain list file: ')}"

# Check if the domain list file exists
if [[ ! -f "$DOMAIN_LIST" ]]; then
    echo "Domain list file '$DOMAIN_LIST' not found!"
    exit 1
fi

# Check if wordlist is provided as argument or prompt
WORDLIST="${2:-$(prompt_for_file 'Enter the path to your wordlist file: ')}"

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

    # Run gobuster with sudo, passing the password
    echo "$SUDO_PASSWORD" | sudo -S gobuster dir -w "$WORDLIST" -u "$domain" -o "$OUTPUT_FILE"

    echo "Gobuster results saved to: $OUTPUT_FILE"
    echo

done < "$DOMAIN_LIST"
