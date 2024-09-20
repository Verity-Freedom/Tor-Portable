# Tor-Portable

Support us:

5536 9141 8416 7645 — Verity Freedom (портативный Тор)

4377 7237 7311 4255 — ilyaigpetrov (расширение Обход блокировок рунета)

---
Использование портативного Тора через расширение Обход блокировок рунета совместно с прокси Антизапрет. При поддержке сообщества (в особенности отмечу помощь от DesuIsALie и bananakid). Основной автор портативного Тора — Verity Freedom. Автор прокси Антизапрет — ValdikSS. Автор расширения Обход блокировок рунета — ilyaigpetrov. Tor Expert Bundle от Tor Project.

1) Убедитесь, что в расширении стоят флаги: учитывать исключения (в разделе "Исключения"), Использовать прокси PAC-скрипта, Использовать СВОЙ локальный Tor, СВОИ прокси только для СВОИХ сайтов, Проксировать .onion (В разделе "Свои прокси"). Используйте или режим антизапрет, или режим антицензорити (совместимо с обоими). В режиме "антизапрет" через Тор будут проксироваться только сайты-исключения (проксировать — да), а остальные будут подхватываться антизапретом, в режиме "антицензорити" проксироваться через него будут все сайты. Рекомендую использовать режим антизапрет, когда это возможно, и переключиться на антицензорити в противном случае.
2) Запускайте программу через AntiTor.exe, пусть она работает на фоне. Желательно поставьте ярлык, ведущий на AntiTor.exe, в автозагрузку (автозагрузка вызывается командой shell:startup в меню win+r), его также можно закрепить в панель задач.
3) В мостах используется пять совершенно разных типа подключения: obfs4, meek_lite, snowflake, conjure и webtunnel (по умолчанию, оптимально). Заменяйте мосты редактированием файла torrc, получайте новые через запрос моста в tor browser или отправив пустое письмо на адрес bridges@torproject.org. Новый webtunnel можно получить по адресу https://bridges.torproject.org/bridges/?transport=webtunnel. Мосты могут отпадать постепенно, о чём программа сообщает тем, что один из мостов отказал, что негативно влияет на качество подключения и может привести к его полному разрыву.
4) Используйте файл antitor-service, если хотите установить или удалить Тор в качестве службы.

Готово!

---
Using portable Tor through the extension Runet censorship bypass in conjunction with the Antizapret proxy. With the support of the community (especially the help from DesuIsALie and bananakid). The main author of the portable Tor is Verity Freedom. The author of the Antizapret proxy is ValdikSS. The author of the extension Runet censorship bypass is ilyaigpetrov. Tor Expert Bundle from Tor Project.

1) Make sure that there are flags in the extension: consider exceptions (in the "Exceptions" section), Use a PAC script proxy, Use YOUR local Tor, Use YOUR proxies only for YOUR sites, Proxy onion (In the "My proxies" section). Use anticensority mode (if it doesn't allow you to use Russian antizapret). In the "antizapret" mode only exception sites will be proxied through the Tor (proxy — yes), the rest will be picked up by antizapret, in the "anticensority" mode all sites will be proxied through it. The names of the flags may differ slightly because an automatic translator was used.
2) Run the program via AntiTor.exe, let it work in the background. Preferably put a label leading to AntiTor.exe to startup (startup is called by the shell:startup command in the win+r menu), it also can be pinned to the taskbar.
3) Bridges use five completely different connection types: obfs4, meek_lite, snowflake, conjure and webtunnel (default, optimal). Replace the bridges by editing the torrc file, receive new ones via a bridge request in the tor browser or send an empty email to bridges@torproject.org. The new webtunnel bridge can be obtained at https://bridges.torproject.org/bridges/?transport=webtunnel. Bridges may disappear gradually, as the program informs you that one of the bridges has failed, which negatively affects the quality of the connection and can lead to its complete breakdown.
4) Use the antitor-service file if you want to install or uninstall Tor as service.

Ready!
