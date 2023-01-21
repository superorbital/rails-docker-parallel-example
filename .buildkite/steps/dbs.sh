#!/bin/bash

set -euxo pipefail

export BUILDKITE_K8S_JOB_UID
BUILDKITE_K8S_JOB_UID=$(kubectl get job -n "${BUILDKITE_NAMESPACE}" "${BUILDKITE_K8S_JOB_NAME}" -o jsonpath="{.metadata.uid}")

