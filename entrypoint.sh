#!/bin/sh
set -e

# Make the script executable:
# chmod +x entrypoint.sh

# Script checks that tmp/pids/server.pid is not present to
# ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Run whatever command we were given under Bundler.
exec bundle exec "$@"
