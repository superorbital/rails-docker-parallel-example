#!/bin/bash

set -euxo pipefail

helm template ./.buildkite/steps/db-chart \
  --set buildkite.namespace=${BUILDKITE_NAMESPACE} \
  --set buildkite.pod_uid=${BUILDKITE_K8S_POD_UID} \
  --set buildkite.pod=${BUILDKITE_K8S_POD} \
  --set buildkite.job=${BUILDKITE_K8S_JOB_NAME} | kubectl apply -f -

sleep 180

kubectl wait pods -n ${BUILDKITE_NAMESPACE} -l job=buildkite-${BUILDKITE_JOB_ID} --for condition=Ready --timeout=60s