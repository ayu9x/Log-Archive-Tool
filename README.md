# Log Archive Tool

A simple CLI tool to archive logs by compressing them into timestamped `.tar.gz` files and logging the activity.

## Requirements

- **Shell**: Bash-compatible shell (Git Bash, WSL, or Linux/Unix).
- **Tools**: `tar`, `date`, `mkdir`.

## Installation

No installation required. Just download `log-archive.sh` and ensure it has execution permissions.

```bash
chmod +x log-archive.sh
```

## Usage

Run the script by providing the path to the directory you want to archive:

```bash
./log-archive.sh <log-directory>
```

### Example

```bash
./log-archive.sh /var/log
```

## How it Works

1.  **Validation**: Checks if a directory was provided and if it exists.
2.  **Compression**: Uses `tar` to create a `.tar.gz` file of the specified directory.
3.  **Naming**: Archives are named using the format `logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
4.  **Storage**: Archives are stored in a local `./archives` directory.
5.  **Logging**: Every successful archive is recorded in `./archives/archive_log.txt` with a timestamp.

## Project Structure

```text
.
├── log-archive.sh    # The CLI tool
├── README.md         # Documentation
└── archives/         # Created on first run
    ├── logs_archive_...tar.gz
    └── archive_log.txt
```
