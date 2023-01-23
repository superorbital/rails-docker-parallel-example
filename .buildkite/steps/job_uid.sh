#!/bin/bash

set -euxo pipefail

kubectl get job -n "${BUILDKITE_NAMESPACE}" "${BUILDKITE_K8S_JOB_NAME}" -o jsonpath="{.metadata.uid}" > .buildkite/job.uid