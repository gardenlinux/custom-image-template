#!/bin/bash
set -euo pipefail

git submodule add https://github.com/gardenlinux/gardenlinux
pushd gardenlinux
git fetch --all
git switch rel-1592
popd
FILES=( bin build get_commit get_repo get_timestamp get_version keyring.gpg)
for f in "${FILES[@]}"; do
    ln -s gardenlinux/"$f" "$f"
done
FEATURES=( _iso _secureboot bluefield cisSshd firewall nodejs sssd _bfpxe _nopkg _selinux chost cisSysctl gardener openstack stig _boot _oci _slim cis clamav gcp openstackbaremetal stigDev _build _oras aide cisAudit cloud gdch python vhost _curl _persistence ali cisModprobe container khost sap vmware _debug _prod aws cisOS example kvm sapmachine _dev _pxe azure cisPackages fedramp log server _ignite _readonly base cisPartition firecracker metal ssh)
mkdir features
pushd features
for f in "${FEATURES[@]}"; do
    ln -s ../gardenlinux/features/"$f" "$f"
done
popd
