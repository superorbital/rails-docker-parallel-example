#!/bin/sh

set -e

export BUILDKITE_K8S_JOB_UID
BUILDKITE_K8S_JOB_UID=$(cat .buildkite/job.uid)

mkdir dbs

envsubst < .buildkite/steps/manifests/memcached.yaml > dist/memcached.yaml
envsubst < .buildkite/steps/manifests/redis.yaml > dist/redis.yaml
envsubst < .buildkite/steps/manifests/postgres.yaml > dist/postgres.yaml