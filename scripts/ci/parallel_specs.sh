#!/bin/bash

set -euo pipefail

export PGHOST=postgres-${BUILDKITE_JOB_ID}
export PGUSER=postgres
export REDIS_URL=redis://redis-${BUILDKITE_JOB_ID}
export MEMCACHE_SERVERS=memcache-${BUILDKITE_JOB_ID}

sleep 300

rake db:reset

rake knapsack:rspec
