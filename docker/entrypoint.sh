#!/usr/bin/env bash
set -Eeuo pipefail

mkdir -p /run/sshd /var/run/sshd
ssh-keygen -A

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
