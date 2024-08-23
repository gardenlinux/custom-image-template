#!/bin/bash
set -euo pipefail

git submodule add https://github.com/gardenlinux/gardenlinux
FILES=( bin build get_commit get_repo get_timestamp get_version keyring.gpg)
for f in "${FILES[@]}"; do
    ln -s gardenlinux/"$f" "$f"
done
FEATURES=( _boot _ignite _selinux _slim base cloud firewall log sap server ssh sssd kvm _dev)
mkdir features
pushd features
for f in "${FEATURES[@]}"; do
    ln -s ../gardenlinux/features/"$f" "$f"
done
popd
