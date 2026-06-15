#!/usr/bin/env bash
# This script runs the Helm chart unit tests (helm-unittest) locally using Docker.
# It mirrors the "unittest" job in .github/workflows/lint-and-test.yml so failures
# can be reproduced before pushing. Run this without any errors before pushing.
# Reference: https://github.com/helm-unittest/helm-unittest
set -eux

SRCROOT="$(cd "$(dirname "$0")/.." && pwd)"

docker run \
     --rm \
     -v "$SRCROOT:/apps" \
     helmunittest/helm-unittest:3.18.4-0.8.2 \
     charts/argo-cd
