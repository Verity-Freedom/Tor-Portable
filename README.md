# Tor-Portable

Лёгкая в освоении, однокнопочная утилита для повседневного обхода цензуры (оптимизировалась под Ютуб) и совместного использования с PAC Антизапрет. Одобрено автором расширения Обход блокировок рунета. В наличии exe с тихим запуском, лёгкая установка/удаление службы и революционные новые методы обхода блокировок с впечатляющей скоростью (мосты Webtunnel) 2024 года выпуска.

Качайте последнюю версию в релизах! (releases)

Download the latest version in releases!

Read the English instructions below.

---
Support us:

5536 9141 8416 7645 — Verity Freedom (портативный Tor)

4377 7237 7311 4255 — ilyaigpetrov (расширение Runet censorship bypass)

https://antizapret.prostovpn.org/donate.html — ValdikSS (прокси Antizapret, ВАЖНО в ноябре и декабре каждого года)

---
Инструкция по использованию портативного Тора. Разработано при поддержке сообщества (в особенности отмечу помощь от DesuIsALie и bananakid). Основной автор портативного Тора — Verity Freedom. Автор прокси Антизапрет — ValdikSS. Автор расширения Обход блокировок рунета — ilyaigpetrov. Tor Expert Bundle от Tor Project.

1) В настоящее время я рекомендую использовать в качестве основного расширение SwitchyOmega, так как оно позволяет пустить через Тор весь браузерный трафик, что полезно для избежания геолокации, а если оно установлено совместно с Обходом, то последний будучи выключенным начинает показывать список всех проксируемых Тором домёнов. Для работы с ним изучите содержимое папки readme-omega. Для проксирования Ютуба скопируйте короткий (предпочтительно) или длинный список из readme-youtube (короткий список также имеется в папке readme-omega) и добавьте эти адреса в исключения, убедившись, что у вас стоит адблок чтобы противодействовать Ютуб-рекламе (признанный самым лучшим из них имеется в архиве).
2) Если вы собираетесь использовать расширение Обход блокировок рунета, то убедитесь, что в нём стоят флаги: учитывать исключения (в разделе "Исключения"), Использовать прокси PAC-скрипта, Использовать СВОЙ локальный Tor, СВОИ прокси только для СВОИХ сайтов, Проксировать .onion (в разделе "Свои прокси"). Используйте или режим антизапрет, или режим антицензорити, или выключайте его (для совместной работы со SwitchyOmega). В режиме "антизапрет" через Тор будут проксироваться только сайты-исключения (проксировать — да), а остальные будут подхватываться антизапретом, в режиме "антицензорити" проксироваться через него будут все сайты, ограниченные средствами российской цензуры, а при совместной работе со SwitchyOmega будучи "спящим" Обход способен исправно докладывать, что именно вы проксируете. Тор сможет зайти не везде, так как иногда сайты блокируют его на стороне, именно поэтому в обоих расширениях необходимо использовать его совместно с PAC Антизапрет, переключаясь только на него лишь в некоторых случаях.
3) Запускайте программу через AntiTor.exe, пусть она работает на фоне. Желательно поставьте ярлык, ведущий на AntiTor.exe, в автозагрузку (автозагрузка вызывается командой shell:startup в меню win+r), его также можно закрепить в панель задач.
4) В мостах используется пять совершенно разных типа подключения: obfs4, meek_lite, snowflake, conjure и webtunnel (по умолчанию, оптимально использовать только его по причине более высокой скорости). Заменяйте мосты редактированием файла torrc, получайте новые через запрос моста в tor browser или отправив пустое письмо на адрес bridges@torproject.org. Новый webtunnel можно получить по адресу https://bridges.torproject.org/bridges/?transport=webtunnel. Мосты могут отпадать постепенно, о чём программа сообщает тем, что один из мостов отказал, что негативно влияет на качество подключения и может привести к его полному разрыву.
5) Используйте файл antitor-service, если хотите установить или удалить Тор в качестве службы.

Готово!

---
Instructions for using Tor Portable. Developed with the support of the community (especially the help from DesuIsALie and bananakid). The main author of the portable Tor is Verity Freedom. Tor Expert Bundle from Tor Project.

1) Run the program via AntiTor.exe, let it work in the background. Preferably put a label leading to AntiTor.exe to startup (startup is called by the shell:startup command in the win+r menu), it also can be pinned to the taskbar. To proxy browser traffic through Tor use SwitchyOmega extension, read how to use it in readme-omega folder.
2) Bridges use five completely different connection types: obfs4, meek_lite, snowflake, conjure and webtunnel (default, it is optimal to use only it because of the higher speed). Replace the bridges by editing the torrc file, receive new ones via a bridge request in the tor browser or send an empty email to bridges@torproject.org. The new webtunnel bridge can be obtained at https://bridges.torproject.org/bridges/?transport=webtunnel. Bridges may disappear gradually, as the program informs you that one of the bridges has failed, which negatively affects the quality of the connection and can lead to its complete breakdown.
3) Use the antitor-service file if you want to install or uninstall Tor as service.

Ready!
