#!/bin/bash
set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
source helpers.sh

check "Rust toolchain has component rust-src" bash -c "is_rust_component_installed rust-src"
check "Rust toolchain has component rustc-dev" bash -c "is_rust_component_installed rustc-dev"
check "Rust toolchain has component llvm-tools-preview" bash -c "is_rust_component_installed llvm-tools-preview"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults