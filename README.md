[RU] | [EN]

[RU]: https://github.com/larionit/opera-proxy-install/blob/dev/ru/README.md
[EN]: https://github.com/larionit/opera-proxy-install/blob/dev/README.md

# opera-proxy-install

Script for installing [opera-proxy](https://github.com/Snawoot/opera-proxy).

Kudos to [Snawoot](https://github.com/Snawoot) for his amazing work!

## Android

### Install & Upgrade

Open Termux and run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/larionit/opera-proxy-install/main/opera-proxy-install-android.sh)
```

<details>
  <summary>Click to see a detailed step-by-step guide</summary>

### 1. Preparation

1. Install [Termux](https://termux.dev/) from [Google play](https://play.google.com/store/apps/details?id=com.termux), [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases)

2. Install [Adguard](https://adguard.com/en/adguard-android/overview.html) from [Google Play](https://play.google.com/store/apps/details?id=com.adguard.android.contentblocker) or [GitHub](https://github.com/AdguardTeam/AdguardForAndroid/releases)


### 2. Installing and running opera-proxy

1. Open Termux and run this command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/larionit/opera-proxy-install/main/opera-proxy-install-android.sh)
```

***Hint:*** *copy, paste and press enter*

2. After successful installation, start the proxy using this command:

```bash
opera-proxy
```

### 3. Setting up routing

1. Open the Adguard app, accept the terms and conditions

2. Go to: *Setings -> Filtering -> Network -> Proxy -> Proxy server ->* ***Add proxy server***

    * Proxy name: `opera-proxy`
    * Proxy type: `HTTP` 
    * Proxy host: `127.0.0.1`
    * Proxy port: `18080`
    * Use FakeDNS: `TRUE`

    Click `Save` and go back to the "**Proxy**" page.

3. In the section: *Setings -> Filtering -> Network -> Proxy ->* ***Apps operating through proxy***

    * Type "*Termux*" in the search box
    * Move the switch to the `OFF` position

4. Go back to: *Setings -> Filtering -> Network ->* ***Proxy***
    
    * Set the switch next to Proxy to `ON`

5. Open the main page of the application and click on the `BIG BUTTON` in the center

Done! You can check the result by going to the website [showmyip.com](https://showmyip.com/)

</details>