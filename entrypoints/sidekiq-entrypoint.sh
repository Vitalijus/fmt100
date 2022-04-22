#!/bin/sh

set -e

# Script checks that tmp/pids/server.pid is not present to
# ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Start sidekiq
bundle exec sidekiq
