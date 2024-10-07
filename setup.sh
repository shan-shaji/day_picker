#!/usr/bin/env bash

# Setup pre-commit hooks
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit

