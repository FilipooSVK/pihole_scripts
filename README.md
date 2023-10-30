# Pi-hole Utility Scripts

A collection of Bash scripts for automating common tasks in Pi-hole, including Gravity updates, Pi-hole software updates, and backups using the Teleporter tool.

## Table of Contents

- [Scripts](#scripts)
- [Usage](#usage)
- [Script Descriptions](#script-descriptions)
- [License](#license)

## Scripts

1. [**pihole-gravity-update.sh**](pihole-gravity-update.sh)
   - A script to update Pi-hole's Gravity list and blocklists.
   - Can be scheduled with cron for automated updates.
```bash
    https://raw.githubusercontent.com/FilipooSVK/pihole_scripts/main/scripts/pihole-backup.sh
```

2. [**pihole-update-automation.sh**](pihole-update-automation.sh)
   - A script to update Pi-hole software and create a weekly cron job for updates.
  
```bash
    https://raw.githubusercontent.com/FilipooSVK/pihole_scripts/main/scripts/pihole-gravity-update.sh
```

3. [**pihole-teleporter-backup.sh**](pihole-teleporter-backup.sh)
   - A script for creating backups of your Pi-hole configuration using the Teleporter tool.

```bash
    https://raw.githubusercontent.com/FilipooSVK/pihole_scripts/main/scripts/pihole-backup.sh
```

## Usage

Clone the repository and execute the desired script using the terminal. Each script includes comments with instructions on how to use it effectively. Make sure to customize the script paths and permissions as needed to match your setup.

## Script Descriptions

- **pihole-gravity-update.sh**
  - Updates Pi-hole's Gravity list.
  - Schedules a weekly update using cron.
  
- **pihole-update-automation.sh**
  - Updates the Pi-hole software and creates a weekly update cron job.
  
- **pihole-teleporter-backup.sh**
  - Creates backups of Pi-hole settings using the Teleporter tool.
  - Specify your preferred backup directory in the script.

## License

These scripts are provided under the [MIT License](LICENSE). Feel free to use, modify, and distribute them as needed.

---

**Disclaimer:** These scripts are provided as-is. Please use them responsibly and ensure they are suitable for your environment. Be cautious when scheduling automated tasks, as they may impact your Pi-hole setup.
