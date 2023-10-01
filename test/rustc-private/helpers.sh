#!/bin/bash
set -e

# Asserts that the provided Rust toolchain component is installed.
# Returns a non-zero exit code if the check fails.
# Usage: is_rust_component_installed <component>
# Example: is_rust_component_installed "rustc-dev"
is_rust_component_installed() {
    local expected="$1"
    rustup component list | grep -Po '([a-zA-Z0-9\-_]*)(?= \(installed\))' | grep $expected
    return $?
}