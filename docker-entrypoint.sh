#!/bin/sh
set -e

# Substitute env vars into nginx config template
envsubst '${CHAT_ADMIN_URL} ${CHAT_URL} ${IM_API_URL} ${IM_WS_URL}' \
  < /etc/nginx/templates/nginx.conf.template \
  > /etc/nginx/conf.d/default.conf

echo "openim-admin: nginx config generated"
echo "  CHAT_ADMIN_URL=${CHAT_ADMIN_URL}"
echo "  CHAT_URL=${CHAT_URL}"
echo "  IM_API_URL=${IM_API_URL}"
echo "  IM_WS_URL=${IM_WS_URL}"

exec nginx -g "daemon off;"
