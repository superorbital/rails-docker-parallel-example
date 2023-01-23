#!/bin/bash

set -euxo pipefail

kubectl apply -f dist/

kubectl wait pods -n buildkite -l job=${BUILDKITE_JOB_ID} --for condition=Ready --timeout=60s