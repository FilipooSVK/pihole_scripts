#!/bin/bash

# Script to update Pi-hole's Gravity list and create a weekly cron job

# Path to the Pi-hole Gravity update script
PIHOLE_UPDATE_SCRIPT="/usr/local/bin/pihole-gravity-update.sh" # Modify path where you saved the script

# Check if the cron job already exists
if (crontab -l 2>/dev/null | grep -q "$PIHOLE_UPDATE_SCRIPT"); then
  echo "Cron job already exists."
else
  # Create the Gravity update script
  echo '#!/bin/bash' > "$PIHOLE_UPDATE_SCRIPT"
  echo 'pihole -g' >> "$PIHOLE_UPDATE_SCRIPT"
  chmod +x "$PIHOLE_UPDATE_SCRIPT"
  
  # Define the schedule for the weekly update in the cron format (Friday at 3 AM)
  CRON_SCHEDULE="0 3 * * 5"
  
  # Add the cron job
  (crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $PIHOLE_UPDATE_SCRIPT") | crontab -
  
  echo "Pi-hole Gravity update script and weekly cron job have been created."
fi
