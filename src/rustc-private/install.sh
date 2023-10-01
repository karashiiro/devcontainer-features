#!/bin/bash
set -e

echo "Installing rustc-private toolchain components"

if !(which rustup > /dev/null && which cargo > /dev/null); then
    which curl > /dev/null || (apt update && apt install curl -y -qq)
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
fi

rustup component add rust-src rustc-dev llvm-tools-preview