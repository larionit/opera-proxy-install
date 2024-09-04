[EN] | [RU]

[EN]: https://github.com/larionit/opera-proxy-install/blob/dev/README.md
[RU]: https://github.com/larionit/opera-proxy-install/blob/dev/ru/README.md

# opera-proxy-install

Скрипт для установки [opera-proxy](https://github.com/Snawoot/opera-proxy).

Честь и хвала [Snawoot](https://github.com/Snawoot) за его потрясающую работу!

## Android

### Установка и обновление

Выполните в Termux:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/larionit/opera-proxy-install/dev/ru/opera-proxy-install-android.sh)
```

<details>
  <summary>Нажмите, чтобы увидеть подробное пошаговое руководство.</summary>

### 1. Подготовка

1. Установите [Termux](https://termux.dev/) из [Google play](https://play.google.com/store/apps/details?id=com.termux), [F-Droid](https://f-droid.org/en/packages/com.termux/) или [GitHub](https://github.com/termux/termux-app/releases)

2. Установите [Adguard](https://adguard.com/en/adguard-android/overview.html) из  [GitHub](https://github.com/AdguardTeam/AdguardForAndroid/releases) или [Google Play *](https://play.google.com/store/apps/details?id=com.adguard.android.contentblocker)

    *Примечание: недоступен для установки, если в google-аккаунте выбран регион Россия*

### 2. Установка и запуск opera-proxy

1. Откройте Termux и выполните эту команду:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/larionit/opera-proxy-install/dev/ru/opera-proxy-install-android.sh)
```

***Подсказка:*** *скопируйте, вставьте и нажмите Enter*

2. После успешной установки запустите opera-proxy с помощью этой команды:

```bash
opera-proxy
```

### 3. Настройка маршрутизации

1. Откройте приложение Adguard, примите условия и положения

2. Перейдите в: *Настройки -> Фильтрация -> Сеть -> Прокси -> Прокси-сервер ->* ***Добавить прокси-сервер***

    * Имя прокси: `opera-proxy`
    * Тип прокси: `HTTP` 
    * Хост: `127.0.0.1`
    * Порт: `18080`
    * Использовать FakeDNS: `ВКЛ`

    Нажмите `Сохранить и выбрать`, вернитесь на страницу "**Прокси**".

3. В разделе: *Настройки -> Фильтрация -> Сеть -> Прокси ->* ***Приложения, работающие через прокси***

    * Наберите "*Termux*" в поле для поиска
    * Переведите переключатель в положение `ВЫКЛ`

4. Вернитесь в: *Настройки -> Фильтрация -> Сеть ->* ***Прокси***
    
    * Установите переключатель рядом с Proxy в положение `ВКЛ`.

5. Откройте главную страницу приложения и нажмите на `БОЛЬШУЮ КНОПКУ` в центре 

Готово! Проверить результат можно перейдя на сайт [showmyip.com](https://showmyip.com/)