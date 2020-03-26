#!/bin/sh

set -eu

cd "$HOME"
mkdir -p .ssh
chmod 700 .ssh
echo "${SSH_KEY}" >.ssh/id_rsa
chmod 400 .ssh/id_rsa

exec ssh \
  -4N \
  -o StrictHostKeyChecking=no -o IdentitiesOnly=yes \
  -o ServerAliveInterval="${SERVER_ALIVE_INTERVAL:-10}" \
  ${SSH_EXTRA_OPTS:-} \
  -L "0.0.0.0:10000:${TARGET_HOST}:${TARGET_PORT}" \
  -i .ssh/id_rsa \
  "${SSH_HOST}"
