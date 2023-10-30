#!/bin/bash

# Pi-hole Update Script

# Update Pi-hole
echo "Updating Pi-hole..."
pihole -up

# Path to the weekly update script
WEEKLY_UPDATE_SCRIPT="/home/usr/scripts/pihole-weekly-update.sh" # Modify followed path where you saved script

# Create the weekly update script if it doesn't exist
if [ ! -f "$WEEKLY_UPDATE_SCRIPT" ]; then
  echo '#!/bin/bash' > "$WEEKLY_UPDATE_SCRIPT"
  echo 'pihole -up' >> "$WEEKLY_UPDATE_SCRIPT"
  chmod +x "$WEEKLY_UPDATE_SCRIPT"
  echo "Weekly update script created."
else
  echo "Weekly update script already exists."
fi

# Define the schedule for the weekly update in the cron format (Friday at 3 AM)
CRON_SCHEDULE="0 3 * * 5"

# Check if the cron job already exists
if (crontab -l 2>/dev/null | grep -q "$WEEKLY_UPDATE_SCRIPT"); then
  echo "Cron job already exists."
else
  # Add the cron job
  (crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $WEEKLY_UPDATE_SCRIPT") | crontab -
  echo "Cron job has been added."
fi

# Inform the user
echo "Pi-hole has been updated, and a weekly update script and cron job have been managed."

