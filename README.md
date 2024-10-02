# Tor-Portable

Лёгкая в освоении, однокнопочная утилита для повседневного обхода цензуры (оптимизировалась под Ютуб). Одобрено автором Обхода блокировок рунета, имеется совместимость (совместное использование) с Антизапретом через расширение. В наличии exe с тихим запуском, лёгкая установка/удаление службы и революционные новые методы обхода блокировок с впечатляющей скоростью (мосты Webtunnel) 2024 года выпуска.

Качайте последнюю версию в релизах! (releases)

Download the latest version in releases!

---
Support us:

5536 9141 8416 7645 — Verity Freedom (портативный Тор)

4377 7237 7311 4255 — ilyaigpetrov (расширение Обход блокировок рунета)

---
Использование портативного Тора через расширение Обход блокировок рунета совместно с прокси Антизапрет. При поддержке сообщества (в особенности отмечу помощь от DesuIsALie и bananakid). Основной автор портативного Тора — Verity Freedom. Автор прокси Антизапрет — ValdikSS. Автор расширения Обход блокировок рунета — ilyaigpetrov. Tor Expert Bundle от Tor Project.

1) Убедитесь, что в расширении стоят флаги: учитывать исключения (в разделе "Исключения"), Использовать прокси PAC-скрипта, Использовать СВОЙ локальный Tor, СВОИ прокси только для СВОИХ сайтов, Проксировать .onion (В разделе "Свои прокси"). Используйте или режим антизапрет, или режим антицензорити (совместимо с обоими). В режиме "антизапрет" через Тор будут проксироваться только сайты-исключения (проксировать — да), а остальные будут подхватываться антизапретом, в режиме "антицензорити" проксироваться через него будут все сайты. Рекомендую использовать режим антизапрет, когда это возможно, по причине его большей универсальности и совместимости с некоторыми сайтами, и переключиться на антицензорити в противном случае.
2) Для проксирования через Тор всего браузерного трафика (может быть полезно для диагностирования и избежания геолокации, см. https://github.com/anticensority/runet-censorship-bypass/issues/313) используйте расширение SwitchyOmega. Для проксирования Ютуба скопируйте короткий (предпочтительно) или длинный список и добавьте эти адреса в исключения, убедившись, что у вас стоит адблок чтобы противодействовать Ютуб-рекламе (признанный самым лучшим из них имеется в архиве).
3) Запускайте программу через AntiTor.exe, пусть она работает на фоне. Желательно поставьте ярлык, ведущий на AntiTor.exe, в автозагрузку (автозагрузка вызывается командой shell:startup в меню win+r), его также можно закрепить в панель задач.
4) В мостах используется пять совершенно разных типа подключения: obfs4, meek_lite, snowflake, conjure и webtunnel (по умолчанию, оптимально использовать только его по причине более высокой скорости). Заменяйте мосты редактированием файла torrc, получайте новые через запрос моста в tor browser или отправив пустое письмо на адрес bridges@torproject.org. Новый webtunnel можно получить по адресу https://bridges.torproject.org/bridges/?transport=webtunnel. Мосты могут отпадать постепенно, о чём программа сообщает тем, что один из мостов отказал, что негативно влияет на качество подключения и может привести к его полному разрыву.
5) Используйте файл antitor-service, если хотите установить или удалить Тор в качестве службы.

Готово!

---
Using portable Tor through the extension SwitchyOmega. With the support of the community (especially the help from DesuIsALie and bananakid). The main author of the portable Tor is Verity Freedom. Tor Expert Bundle from Tor Project.

1) Run the program via AntiTor.exe, let it work in the background. Preferably put a label leading to AntiTor.exe to startup (startup is called by the shell:startup command in the win+r menu), it also can be pinned to the taskbar. To proxy browser traffic through Tor use SwitchyOmega extension.
2) Bridges use five completely different connection types: obfs4, meek_lite, snowflake, conjure and webtunnel (default, it is optimal to use only it because of the higher speed). Replace the bridges by editing the torrc file, receive new ones via a bridge request in the tor browser or send an empty email to bridges@torproject.org. The new webtunnel bridge can be obtained at https://bridges.torproject.org/bridges/?transport=webtunnel. Bridges may disappear gradually, as the program informs you that one of the bridges has failed, which negatively affects the quality of the connection and can lead to its complete breakdown.
3) Use the antitor-service file if you want to install or uninstall Tor as service.

Ready!
