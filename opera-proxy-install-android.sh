#!/bin/bash

repo=opera-proxy
repo_owner=Snawoot
target_dir="${PATH}"

# Define the directory where this script is located
script_dir="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# For testing
if [[ ! "$script_dir" = "/data/data/com.termux/files/home" ]]; then
    echo $script_dir
fi

# Getting information about the kernel
uname_output=$(uname -a)

# Determine the processor architecture based on information about the current kernel
if [[ "$uname_output" = *aarch64* ]]; then
    target_file=opera-proxy.android-arm64
else
    target_file=opera-proxy.android-arm
fi

# Remove platform information from the executable file name
opera_proxy_bin="${target_file%%.*android*}"

# Determine the latest release
latest_release=$(curl -s https://api.github.com/repos/$repo_owner/$repo/releases | jq -r 'first(.[].tag_name | select(test("^v[0-9]")))')

# Specify the version to be installed
install_release="${latest_release}"

# Set the link to download the target file
download_link=https://github.com/$repo_owner/$repo/releases/download/$install_release/$target_file

# Search for the executable file on the device and check its version
if [[ -f $target_dir/$opera_proxy_bin ]]; then
    current_version=$($opera_proxy_bin --version)
    echo "Version found on the device: $current_version"
fi

if [[ ! "$current_version" = "$install_release" ]]; then
    echo "Loading Release: $install_release"
    # Downloading specified release
    curl -fsSL $download_link -o $target_dir/$opera_proxy_bin

    # Grant execute permission
    chmod +x $target_dir/$opera_proxy_bin
    
    echo
    echo "Installed version: $current_version"
    echo
    echo "Command to start proxy: $opera_proxy_bin"
    echo
else
    echo
    echo "Latest release on github: $latest_release"
    echo
    echo "Installed version: $install_release"
    echo
    echo "Command to start proxy: $opera_proxy_bin"
    echo
fi

