#!/bin/bash

set -euxo pipefail

export BUILDKITE_K8S_JOB_UID
BUILDKITE_K8S_JOB_UID=$(kubectl get job -n "${BUILDKITE_NAMESPACE}" "${BUILDKITE_K8S_JOB_NAME}" -o jsonpath="{.metadata.uid}")

mkdir dbs

envsubst < .buildkite/steps/manifests/memcached.yaml > dist/memcached.yaml
envsubst < .buildkite/steps/manifests/redis.yaml > dist/redis.yaml
envsubst < .buildkite/steps/manifests/postgres.yaml > dist/postgres.yaml