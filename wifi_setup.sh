#!/bin/bash

# To use this script, follow these steps:

# Create a new file, e.g., add_wifi_details.sh, and copy the above script into it.
# Open a terminal and navigate to the directory where the script is located.
# Make the script executable by running the command: chmod +x add_wifi_details.sh.
# Run the script with root privileges: sudo ./add_wifi_details.sh.
# Follow the prompts to enter the SSID (network name) and password for your WiFi network.

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Set the default SSID
ssid="UniOfCam-IoT"

# Prompt for the password
read -p "Enter the password: " password

# Escape special characters in password
password=$(echo "$password" | sed 's/[\*\.&]/\\&/g')

# Generate the wpa_supplicant.conf file
cat <<EOF >> /etc/wpa_supplicant/wpa_supplicant.conf
network={
    ssid="$ssid"
    psk="$password"
}
EOF

# Restart the networking service
systemctl restart networking

echo "WiFi details added successfully."
