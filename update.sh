#!/usr/bin/env sh
cargo vet aggregate sources.list > audits.toml

git status
