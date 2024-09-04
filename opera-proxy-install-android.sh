#!/bin/bash

repo=opera-proxy
repo_owner=Snawoot
target_dir="${PATH}"

# Array with required packages names
dependency_packages=(
  "curl"
  "jq"
)

clear
echo
echo "~> opera-proxy-install-android.sh"
echo

# Installing the required packages
for package in "${dependency_packages[@]}"
do
    if [[ ! -f "$target_dir/$package" ]]; then
        echo "Package '$package' was not found. Installation..."
        pkg install -y "$package" &> /dev/null 
            if [[ $? -eq 0 ]]; then
                echo "Installation of '$package' completed successfully."
            else
                echo "Error installing '$package'."
            fi
    else
        echo "Package '$package' is already installed."
    fi
done

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

# Checking if an opera-proxy is already installed
if [[ -f $target_dir/$opera_proxy_bin ]]; then
    current_version=$($opera_proxy_bin --version)
    echo "Version found on the device: $current_version"
        if [[ "$current_version" = "$install_release" ]]; then
                clear
                echo
                echo "~> opera-proxy-install-android.sh"
                echo
                echo "Nothing to do!"
                echo
                echo "The target version is already installed: $current_version"
                echo
                echo "Command to start proxy: $opera_proxy_bin"
                echo
                exit 0
        else
            rm $target_dir/$opera_proxy_bin
        fi
fi

# Download and install
echo "Loading Release: $install_release"
curl -fsSL $download_link -o $target_dir/$opera_proxy_bin  
chmod +x $target_dir/$opera_proxy_bin
clear
echo
echo "~> opera-proxy-install-android.sh"
echo
echo "Installed version: $install_release"
echo
echo "Command to start proxy: $opera_proxy_bin"
echo