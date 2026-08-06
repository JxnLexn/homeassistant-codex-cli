#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -euo pipefail

if ! bashio::config.has_value 'authorized_keys' \
    || [[ "$(bashio::config 'authorized_keys' | jq 'length')" -eq 0 ]]; then
    bashio::exit.nok 'Mindestens ein öffentlicher SSH-Schlüssel ist erforderlich.'
fi

install -d -m 0700 /data/ssh
install -d -m 0700 /data/codex
install -d -m 0755 /workspace

rm -f /data/ssh/authorized_keys
while IFS= read -r key; do
    printf '%s\n' "${key}" >> /data/ssh/authorized_keys
done <<< "$(bashio::config 'authorized_keys')"
chmod 0600 /data/ssh/authorized_keys

if [[ ! -e /root/.ssh ]]; then
    ln -s /data/ssh /root/.ssh
fi
if [[ ! -e /root/.codex ]]; then
    ln -s /data/codex /root/.codex
fi

ln -sfn /homeassistant /config
ln -sfn /homeassistant /workspace/homeassistant
ln -sfn /backup /workspace/backup
ln -sfn /share /workspace/share

password="$(head -c 48 /dev/urandom | base64 | tr -d '\n')"
printf 'root:%s\n' "${password}" | chpasswd
unset password

mcp_url="$(bashio::config 'ha_mcp_url')"
python3 /usr/local/bin/configure-codex.py "${mcp_url}"

tcp_forwarding='no'
if bashio::config.true 'allow_tcp_forwarding'; then
    tcp_forwarding='yes'
fi

sed "s/@ALLOW_TCP_FORWARDING@/${tcp_forwarding}/" \
    /etc/ssh/sshd_config.template > /etc/ssh/sshd_config
chmod 0600 /etc/ssh/sshd_config

bashio::log.info 'Codex-Arbeitsbereich ist unter /workspace vorbereitet.'
if [[ -n "${mcp_url}" ]]; then
    bashio::log.info 'HA-MCP ist in der Codex-Konfiguration aktiviert.'
else
    bashio::log.warning 'HA-MCP ist noch nicht konfiguriert.'
fi
