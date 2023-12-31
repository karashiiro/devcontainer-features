#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'all' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
source helpers.sh

check "Environment has ilasm" bash -c "which ilasm"
check "Environment has ildasm" bash -c "which ildasm"

check "Rust toolchain has component rust-src" \
is_rust_component_installed "rust-src"
check "Rust toolchain has component rustc-dev" \
is_rust_component_installed "rustc-dev"
check "Rust toolchain has component llvm-tools" \
is_rust_component_installed "llvm-tools"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults