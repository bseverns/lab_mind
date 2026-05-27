#!/bin/bash
# enable_lab_forwarding.sh
# Purpose: Configure this Orin board as a Tailscale Subnet Router for the lab network.
# Source Truth: lab_mind distributed architecture plan.

set -e

# 1. Check for root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# 2. Configure LAN CIDR (Default to 192.168.1.0/24, but should be checked)
LAN_CIDR=${1:-"192.168.1.0/24"}

echo "--- Configuring Lab Forwarding for $LAN_CIDR ---"

# 3. Enable IP Forwarding in sysctl
echo "Enabling IPv4 and IPv6 forwarding..."
echo "net.ipv4.ip_forward = 1" > /etc/sysctl.d/99-tailscale.conf
echo "net.ipv6.conf.all.forwarding = 1" >> /etc/sysctl.d/99-tailscale.conf
sysctl -p /etc/sysctl.d/99-tailscale.conf

# 4. Check Tailscale Installation
if ! command -v tailscale &> /dev/null; then
    echo "Tailscale is not installed. Please install it first."
    exit 1
fi

# 5. Advertise Routes
# Note: This assumes the node is already logged into the Headscale mesh.
# If not, add --login-server and an auth-key if needed.
echo "Advertising routes to Tailnet: $LAN_CIDR"
tailscale up --advertise-routes="$LAN_CIDR" --accept-dns=false

# 6. Verification
echo "--- Verification ---"
tailscale status | grep -E "127.0.0.1|$(hostname)"
echo "Active Routes:"
tailscale status --active-routes | grep "$LAN_CIDR" || echo "No active routes found yet. Remember to approve them in the Headscale UI."

echo "Success: $LAN_CIDR is now being advertised. Ensure you run 'headscale nodes allow-route' on the VPS."
