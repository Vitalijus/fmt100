#!/bin/bash
set -e

# Script checks that tmp/pids/server.pid is not present to
# ensure that there won’t be server conflicts when we start the application
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# We use the -b option with this command to bind the server to all IP addresses rather than to the default, localhost.
# This invocation makes the Rails server route incoming requests to the container IP rather than to the default localhost.
bundle exec rails s -b 0.0.0.0
