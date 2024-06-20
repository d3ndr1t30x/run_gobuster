# Gobuster Automation Script

## Overview

This Bash script automates running `gobuster` against a list of domains using a specified wordlist. It reads a list of domains, executes `gobuster` for each one, and saves the results to individual files. This tool is ideal for security researchers participating in bug bounty programs or performing security assessments.

## Features

- **Domain List Input:** Reads domains from a specified file.
- **Wordlist Input:** Uses a specified wordlist for fuzzing.
- **Output Organization:** Saves results in a dedicated directory with filenames based on domain names.
- **Interactive and Argument-Based:** Accepts input via command-line arguments or interactive prompts.
- **Tab Completion:** Supports tab completion for file paths when arguments are used.

## Requirements

- Kali Linux or a similar Linux distribution
- `gobuster` installed
- A wordlist file for fuzzing (e.g., from `/usr/share/seclists/`)

## Installation

1. **Clone the Repository:**
   Clone this repository to your local machine.

   ```bash
   git clone https://github.com/d3ndr1t30x/run_gobuster.git
   cd run_gobuster
