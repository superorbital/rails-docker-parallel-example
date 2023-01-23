#!/bin/bash

set -euo pipefail

export PGHOST=postgres-buildkite-${BUILDKITE_JOB_ID}
export PGUSER=postgres
export REDIS_URL=redis://redis-buildkite-${BUILDKITE_JOB_ID}
export MEMCACHE_SERVERS=memcache-buildkite-${BUILDKITE_JOB_ID}

sleep 300

rake db:reset

rake knapsack:rspec
