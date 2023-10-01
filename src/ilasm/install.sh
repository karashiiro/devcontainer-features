#!/bin/bash
set -e

echo "Downloading ilasm/ildasm ${VERSION}"

cd /tmp

apt-get update -y
apt-get -y install --no-install-recommends wget ca-certificates unzip

mkdir -p $ILASM_ROOT/tools

# Download tools from Nuget
wget https://globalcdn.nuget.org/packages/runtime.linux-x64.microsoft.netcore.ilasm.${VERSION}.nupkg
wget https://globalcdn.nuget.org/packages/runtime.linux-x64.microsoft.netcore.ildasm.${VERSION}.nupkg

unzip runtime.linux-x64.microsoft.netcore.ilasm.${VERSION}.nupkg -d $ILASM_ROOT/tools/ilasm
unzip runtime.linux-x64.microsoft.netcore.ildasm.${VERSION}.nupkg -d $ILASM_ROOT/tools/ildasm

chmod +x $ILASM_ROOT/tools/ilasm/runtimes/linux-x64/native/ilasm
chmod +x $ILASM_ROOT/tools/ildasm/runtimes/linux-x64/native/ildasm

# Symlink tools into $ILASM_ROOT
ln -s $ILASM_ROOT/tools/ilasm/runtimes/linux-x64/native/ilasm $ILASM_ROOT/ilasm
ln -s $ILASM_ROOT/tools/ildasm/runtimes/linux-x64/native/ildasm $ILASM_ROOT/ildasm
