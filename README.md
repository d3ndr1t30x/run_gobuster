# Gobuster Automation Script

## Overview

This Bash script automates running `gobuster` against a list of domains using a specified wordlist. It reads a list of domains, executes `gobuster` for each one, and saves the results to individual files. This tool is ideal for security researchers participating in bug bounty programs or performing security assessments.

## Features

- **Domain List Input:** Reads domains from a specified file.
- **Wordlist Input:** Uses a specified wordlist for fuzzing.
- **Output Organization:** Saves results in a dedicated directory with filenames based on domain names.
- **Interactive and Argument-Based:** Accepts input via command-line arguments or interactive prompts.
- **Tab Completion:** Supports tab completion for file paths when arguments are used.
- **Single Sudo Password Prompt:** Prompts for sudo password once and uses it for the entire execution.

## Requirements

- Kali Linux or a similar Linux distribution
- `gobuster` installed
- A wordlist file for fuzzing (e.g., from `/usr/share/seclists/`)

## Installation

1. **Clone the Repository:**
   ```git clone https://github.com/d3ndr1t30x/run_gobuster.git
   cd run_gobuster``` 

2. Make the Script Executable:
   ```chmod +x run_gobuster.sh```

Install Gobuster:
Ensure gobuster is installed on your system. If not, install it using:

bash

    sudo apt-get update
    sudo apt-get install gobuster

Usage
Running the Script

You can run the script in two ways: with command-line arguments or interactively.

With Command-Line Arguments:

Provide the domain list and wordlist directly when running the script:

```./run_gobuster.sh /path/to/live_subdomains.txt /path/to/wordlist.txt```

Interactively:

If you don’t provide arguments, the script will prompt you for the necessary inputs:

```./run_gobuster.sh```

You will be asked to enter the paths for the domain list and the wordlist.
Example

```./run_gobuster.sh ~/bugbounty/live_subdomains.txt /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt```

Output

Results are saved in the gobuster_results directory. Each domain’s output is stored in a file named <domain>.gobuster.out, where <domain> is the sanitized domain name.
Directory Structure


Customization
Change Output Directory

To change the output directory, modify the OUTPUT_DIR variable in the script:

```OUTPUT_DIR="custom_output_directory```

Adjust Wordlist

To use a different wordlist, specify the path during the prompt or as an argument when running the script:

```./run_gobuster.sh /path/to/domains.txt /path/to/your_custom_wordlist.txt```

Troubleshooting

    Domain List File Not Found: If the domain list file is not found, ensure the file path is correct and the file exists.
    Wordlist File Not Found: If the wordlist file is not found, verify the file path and that the file is accessible.
    Gobuster Not Installed: Ensure gobuster is installed on your system. Refer to the installation instructions if needed.
