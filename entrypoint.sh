#!/bin/sh
set -e

# Set correct permissions on log and database directories (necessary for mounted volumes)
chown -R clamav:clamav /var/log/clamav || true
chown -R clamav:clamav /var/lib/clamav || true
# Set correct permissions on socket directory (for clamd socket)
mkdir -p /var/run/clamav
chown -R clamav:clamav /var/run/clamav || true

# Start freshclam as background process (periodic updates)
su -s /bin/sh clamav -c "freshclam -d &"

# Start clamd in the foreground
exec su -s /bin/sh clamav -c "clamd -F"