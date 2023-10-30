#!/bin/bash

# Pi-hole Update Script

# Update Pi-hole
echo "Updating Pi-hole..."
pihole -up

# Path to the weekly update script
WEEKLY_UPDATE_SCRIPT="/usr/local/bin/pihole-weekly-update.sh"

# Create the weekly update script
echo '#!/bin/bash' > "$WEEKLY_UPDATE_SCRIPT"
echo 'pihole -up' >> "$WEEKLY_UPDATE_SCRIPT"
chmod +x "$WEEKLY_UPDATE_SCRIPT"

# Define the schedule for the weekly update in the cron format (Friday at 3 AM)
CRON_SCHEDULE="0 3 * * 5"

# Add the cron job
(crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $WEEKLY_UPDATE_SCRIPT") | crontab -

# Inform the user
echo "Pi-hole has been updated, and a weekly update script and cron job have been created."

