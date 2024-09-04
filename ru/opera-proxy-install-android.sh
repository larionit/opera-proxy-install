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
        echo "Пакет '$package' не найден. Установка..."
        pkg install -y "$package" &> /dev/null 
            if [[ $? -eq 0 ]]; then
                echo "Установка '$package' успешно завершена."
            else
                echo "Ошибка установки '$package'."
            fi
    else
        echo "Пакет '$package' уже установлен."
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
        if [[ "$current_version" = "$install_release" ]]; then
            clear
            echo
            echo "~> opera-proxy-install-android.sh"
            echo
            echo "Нечего делать!"
            echo
            echo "Уже установленна версия: $current_version"
            echo
            echo "Команда для запуска прокси: $opera_proxy_bin"
            echo
            echo "Остановить прокси: CTRL + C"
            echo
            exit 0
        else
            rm $target_dir/$opera_proxy_bin
            echo "Загрузка релиза: $install_release"
            curl -fsSL $download_link -o $target_dir/$opera_proxy_bin  
            chmod +x $target_dir/$opera_proxy_bin
            clear
            echo
            echo "~> opera-proxy-install-android.sh"
            echo
            echo "Найденая версия: $current_version"
            echo
            echo "Обновлена до: $install_release"
            echo
            echo "Команда для запуска прокси: $opera_proxy_bin"
            echo
            echo "Остановить прокси: CTRL + C"
            echo
        fi
else
    echo "Загрузка релиза: $install_release"
    curl -fsSL $download_link -o $target_dir/$opera_proxy_bin  
    chmod +x $target_dir/$opera_proxy_bin
    clear
    echo
    echo "~> opera-proxy-install-android.sh"
    echo
    echo "Установленна версия: $install_release"
    echo
    echo "Команда для запуска прокси: $opera_proxy_bin"
    echo
    echo "Остановить прокси: CTRL + C"
    echo
fi