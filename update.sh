#!/usr/bin/env bash

# bail on `cargo-vet` error
set -e

cargo vet aggregate sources.list > audits.toml

# continue, capturing exit code
set +e

git diff --exit-code audits.toml >/dev/null; rv=$?

if [ $rv -eq 0 ]; then
  echo "Up to date"
else
  echo "Recommended actions:"
  echo "    git add -p"
  echo "    git commit -m \"update from sources\""
fi
