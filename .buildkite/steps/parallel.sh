#!/bin/bash

set -euxo pipefail

export BUILT_IMAGE

BUILT_IMAGE=$(buildkite-agent meta-data get "image")

buildkite-agent pipeline upload .buildkite/parallel.yml