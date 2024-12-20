# Tor Portable

Универсальная утилита для повседневного обхода цензуры (оптимизировалась под Ютуб и Дискорд) и совместного использования с PAC Антизапрет. Одобрено автором расширения Обход блокировок рунета.
Возможно, единственное в мире средство, инициализирующее сразу три метода обхода блокировок (резистентная сеть PAC прокси серверов, VPN и DPI обход по UDP) для одновременного использования.
В наличии exe с тихим запуском, лёгкая установка и удаление службы, новейший (2024 год) протокол противодействия цензуре, полное раздельное туннелирование и многое другое, полностью бесплатно.

Без внимательного чтения инструкции у вас НАСТРОИТЬ НИЧЕГО НЕ ПОЛУЧИТСЯ!

Read the English instructions below.

Support us:

5536 9141 8416 7645 — Verity Freedom (портативный Tor)

4377 7237 7311 4255 — ilyaigpetrov (расширение Runet censorship bypass)

***https://antizapret.prostovpn.org/donate.html — ValdikSS (прокси Antizapret, ВАЖНО в ноябре и декабре каждого года)***

Разработано при поддержке сообщества (в особенности отмечу помощь от DesuIsALie и bananakid).
Основной автор портативного Тора — Verity Freedom.
Автор прокси Антизапрет — ValdikSS.
Автор расширения Обход блокировок рунета — ilyaigpetrov.
Tor Expert Bundle от Tor Project.
SwitchyOmega от FelisCatus, ZeroOmega от zero-top.
Discord-drover от hdrover.

# Инструкция

Скачиваем архив из [релизов](https://github.com/Verity-Freedom/Tor-Portable/releases), распаковываем и заходим в полученную папку. Тор запускается через AntiTor.exe, сворачиваясь в панель задач, что делает его совместимым с автозагрузкой (shell:startup). Чтобы убрать окно Тора, но сохранить его работоспособность, вы можете запустить его как службу через antitor-service.cmd (не забудьте предварительно закрыть его). Обратите повышенное внимание, для какой версии Windows вы ставите программу, ибо ранее несколько человек запутались в этом (слава нашим героям, без их вмешательства в жизни бы не добавил это уточнение). Откройте drover, запустите файл drover.exe и нажмите install. Это разблокирует клиентское приложение Дискорда вместе с голосовыми чатами без всякого пинга, но Тор должен работать или службой, или быть запущен.

![2](https://github.com/user-attachments/assets/106686fa-9d38-4a15-86f1-f7d44b0c7726)

Нам необходимо поставить расширения. Начнём с [Обхода блокировок рунета](https://chromewebstore.google.com/detail/обход-блокировок-рунета/npgcnondjocldhldegnakemclmfkngch) — используем его как чекер, будет выводить нам домёны страницы при наведении на него мышкой, которые затем можно ввести в проксируемые Тором исключения. Ссылки приведены на магазин Хром, если у вас иной браузер, вы можете отыскать расширения в вашем магазине самостоятельно или поставить из папки в релизах.

![0](https://github.com/user-attachments/assets/b9cde27a-bdde-41b8-ab60-fca56455f989)
![1](https://github.com/user-attachments/assets/ae4e09f5-aa22-45ac-ae1a-24e9205e3d7c)

Поставили его и сразу отключили. Даже отключённым он сможет исполнять свою единственную нужную нам функцию. Обязательно закрепите и его, и Омегу в панель расширений. Чекер будет работать корректно только в режиме TOR, про режимы будет рассказано позднее. Если чекер внезапно перестал работать, это могло произойти из-за использования стороннего VPN. Для возобновления его работоспособности я ПОЛНОСТЬЮ отключаю его (не как пункт в меню, а как расширение для браузера) и включаю вновь. Для меня это проблема, ибо иногда я использую сторонние VPN.

Дальше нам необходимо поставить расширение [SwitchyOmega](https://chromewebstore.google.com/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif) или же [ZeroOmega](https://chromewebstore.google.com/detail/proxy-switchyomega-3-zero/pfnededegaaopdmhkdmcofjmoldfiped). Разница между ними в том, что ZeroOmega не грозит отключение в Google Chrome, ибо он написан на более новом языке программирования и активно развивается. До 08.12.2024 я использовал SwitchyOmega, но [очередное обновление](https://github.com/zero-peak/ZeroOmega/releases/tag/3.3.16) привнесло в ZeroOmega слишком значительный функционал, чтобы оставаться на старой версии чисто из принципа. Файлы расширений находятся в папке, не пытайтесь установить SwitchyOmega на Файрфокс из магазина — он слишком стар там и не будет работать корректно, запустится только из файла. Ставить ZeroOmega крайне рекомендуется всем, а SwitchyOmega только в очень старые браузеры. Если вам нужно поставить именно SwitchyOmega, вам дорога [в старую версию инструкции](https://github.com/Verity-Freedom/Tor-Portable/tree/277f1733691334222552cb7336071d6cca4f0f7c), ибо дальше я буду говорить о ZeroOmega.

Опционально, но рекомендуется поставить лучший, народный адблок — [uBlock Origin](https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm), чтобы вас не беспокоила реклама разблокированного без всяких региональных ограничений Ютуба. Его уважают и разработчики, и простые пользователи, как самый лучший блокировщик рекламы.

Для Омеги вам необходимо синхронизировать все настройки с моими, чтобы не настраивать их вручную. Это поставит вам и всё необходимое, и красивую тему xcode-dusk. Используйте ссылку <pre>https://raw.githubusercontent.com/Verity-Freedom/Tor-Portable/refs/heads/main/ZeroOmegaOptions.bak</pre> для мгновенной синхронизации, куда именно нужно вставить её показано на изображении.

![3](https://github.com/user-attachments/assets/f8854f37-bc4d-4b26-acab-71b2733b9e45)

Если у вас уже были поставлены свои сайты в исключения в режиме AUTO, перед синхронизацией скопируйте их заранее, потом сможете легко вернуть их через редактирование исходного кода.

Режимы вы можете переключать нажатием кнопкой мыши по расширению. Режимов три — system, AUTO и TOR. System используется для совместимости со сторонними VPN, полностью отключая проксирование. Выглядит как чёрный кружок с белым центром. Режим AUTO — фиолетовый круг с чёрным центром, вам необходимо рассматривать как основной для работы расширения. По умолчанию он использует устойчивую сеть PAC прокси-серверов Антизапрет для полного раздельного туннелирования только заблокированных сайтов, однако при смене режима на Антицензорити возможно использование собственного сервера по тому же принципу раздельного туннелирования. Антизапрет работает только для россиян, так как содержит список сайтов, заблокированных в России.

![4](https://github.com/user-attachments/assets/c0672119-4316-4c03-b147-428862b7b4de)

Единственным средством обхода блокировок, которое может работать параллельно с Тором и совместимо с ним в режиме AUTO, является Zapret, при желании вы можете установить его самостоятельно (например Zapret разблокировывает Дискорд и способен разблокировать Ютуб на российском ip, не требуя блокировщика рекламы, однако он может не вовремя сломаться, не сможет снять региональные ограничения и является сторонней независимой от Тора разработкой; тем не менее в некоторых ситуациях подобное совместное использование может быть довольно удобным и он многократно обновлялся). Никогда не ставьте Zapret в сборке от peekbot, в нём содержится очень хорошо замаскированный майнер.

В режиме TOR мы можем снимать блокировки со всяких спотифаев и чатжпт ценой отключения доступа к российским сайтам по типу госуслуг и некоторых других, которые блокируют Тор на стороне. Не забудьте, что только в режиме TOR будет корректно работать чекер, который мы настроили в самом начале. Это режим проксирования Тором всего браузерного трафика, выглядит как фиолетовый круг с белым центром.

В этом режиме возможно измерить скорость подключения через сайт по типу speedcheck.org, а оптимизацию скорости можно провести через редактирование файла torrc.txt (я не могу пустить всех на один и тот же скоростной ip во избежание перегрузки и защиты от ботов, а потому пускаю людей на диапазон, скорость которого может быть чуть более лимитирована, ибо многие ip Тора уже частично заблокированы на Ютубе). Вашей скорости должно хватать на 2К 60 или как минимум 1080 60 в любом случае, так что оптимизация скорости это чисто опциональное решение.

Вы можете проявить креативный подход, поменяв тему расширения и цвета режимов, однако в этом случае я не гарантирую, что вы сможете однозначно трактовать их и отличать друг от друга. Для переключения между режимами используется quick switch, вы можете отключить его в любой момент, кликнув правой кнопкой мыши по расширению.

![5](https://github.com/user-attachments/assets/122299fc-d61a-487d-9976-839961c80530)

Также вам необходимо заменять мосты в случае, если один из них откажет, или брать их у меня в новейших релизах (далеко не факт, что я заменю их, ибо это довольно рутинная и бесполезная работа). Несколько мостов уже есть в файле torrc.txt, все остальные содержатся в bridges-webtunnel-list.txt. В случае, если в логах появляется множество уведомлений о невозможности связаться с мостом, то упал мост, а если программа зависает на 45% и уведомления о невозможности связаться с мостом не шлёт, то упали или миддл, или экзит. Я подобное всегда способен увидеть, но вам стоит учиться обслуживать Тор самостоятельно через работу с torrc. Лог работы программы содержится по адресу AntiTor\tor\info-notice.log, также именно этот лог выдаётся вам в командной строке. Можете писать мне в [Новости и фидбэк](https://github.com/Verity-Freedom/Tor-Portable/issues/8) на любую тему.

# Разблокировываем ВЕСЬ ИНТЕРНЕТ играючи!

1) Самое простое задание — доступ к даркнету, если вы всё сделали правильно. Перейдите на http://flibustaongezhld6dibs2dps6vm4nvqg2kp7vgowbu76tzopgnhazqd.onion/ и у вас откроется onion версия Флибусты. Даркнет теперь будет всегда рядом.
2) Мы разблокировали доступ к статьям о VPN на habr.com — перейдите по https://habr.com/ru/articles/849092/, в ином случае эта статья бы не открылась. Можете перейти в режим system proxy, чтобы подметить разницу, для чего нужно перезагрузить страницу.
3) Примеры геозаблокированных видео на Ютуб — https://www.youtube.com/watch?v=OqPl4QrczTk и https://www.youtube.com/watch?v=-kcOpyM9cBg. Без Тора к ним доступа не будет даже через Запрет, способный разблокировать Ютуб в целом. Ютуб часто блочит видео только для Тора, но таких немного, и блокировки лишь на некоторых торовских ip, они доступны даже в России. Знайте, что если что-то пойдёт не так, у вас перестанет проигрываться это видео https://www.youtube.com/watch?v=O_ItSLCZWb0.
4) gosuslugi.ru откроются только в режиме AUTO и system.
5) !*! Первое задание повышенной сложности — доступ на сайт pixiv.net у вас будет только в режиме AUTO. Насколько мне известно, только в режиме AUTO также прогружаются аватарки на chess.com.
6) !*! Сайт chatgpt.com откроется, напротив, только в режиме TOR.
7) !*! Клиентский Discord запустится только если у вас был установлен drover. В браузере он запустится только в режиме TOR без голосовых чатов. Для разблокировки Дискорда в режимах AUTO и system в браузере вместе с голосовым чатом может понадобиться установка Запрета.
8) !**! Сложное задание для вас — проиграть данное видео https://www.youtube.com/watch?v=LXb3EKWsInQ в 4К без единой прогрузки. По умолчанию вы используете диапазон, на котором находятся ip с разной и далеко не рекордной пропускной способностью. Вероятно, чтобы выполнить это задание, вам потребуется отредактировать файл torrc.txt и заменить используемую строчку ExitNodes на скоростную ExitNodes. Для этого вам нужно убрать символ # со скоростного ExitNodes и добавить его в предыдущий ExitNodes. Возможно вам повезёт и у вас получится проиграть данное видео без дополнительных модификаций. Вам стоит измерить скорость на speedcheck.org и убедиться, что ваша средняя скорость превышает 30 mb/s, чтобы заранее понять, есть ли у вас шансы.
9) !***! Самое сложное задание — доступ к hdrezka.ag. По дефолту хдрезке не нравится используемый хорватский диапазон, ибо Тор использует одновременно несколько ip для доступа к ней. Однако у Антизапрета не хватает скорости для комфортного проксирования хдрезки в фуллхд, поэтому она проксируется Тором в обоих режимах. При этом основной используемый скоростной ip хдрезке тоже не подойдёт, ибо у неё есть геоблокировка как на Германию, так и на Люксембург. Чтобы комфортно смотреть хдрезку, возьмите ip, начинающийся на 45., из ExitNodesList в torrc.txt, и замените им используемый вами ExitNodes. Простое убирание хдрезки из проксирования Тором чтобы она начала проксироваться Антизапретом на никакой скорости в качестве выполнения задания засчитано не будет.

После выполнения всех заданий вы можете знать, что овладели Тором в совершенстве.

На некоторых сайтах по типу polymarket.com могут быть сложности с регистрацией даже в режиме TOR, так как у него много защит, а у Тора очень грязные ip. Лично я использую доставшийся бесплатно VLESS на Некорэе для доступа к polymarket.com и не знаю, возможен ли доступ к нему через какой-либо обскурный торовский ip. Поэтому задания по регистрации на polymarket.com через Тор нет, и я считаю его невозможным, как какую-нибудь теорему Ферма. Возможно умельцы когда-нибудь и справятся, но я сильно сомневаюсь. Важно знать, что даже Тор не всесилен, хотя обеспечивает свободный доступ к 99% интернета.

Для проксирования отдельных приложений Тором некоторые используют инструменты по типу [proxifyre](https://github.com/wiresock/proxifyre).

# English instructions

Developed with the support of the community (especially the help from DesuIsALie and bananakid). The main author of the portable Tor is Verity Freedom. Tor Expert Bundle from Tor Project.
SwitchyOmega from FelisCatus, ZeroOmega from zero-top. Runet Censorship Bypass from ilyaigpetrov. Discord-drover from hdrover.

Run the program via AntiTor.exe, let it work in the background. Preferably put a label leading to AntiTor.exe to startup (startup is called by the shell:startup command in the win+r menu), it also can be pinned to the taskbar.
To proxy browser traffic through Tor use ZeroOmega extension, read more about it in readme-visual. Previously, an older SwitchyOmega extension was used, but it's obsolete now. SwitchyOmega recommended only for old browsers.
In Russia we also use Runet Censorship Bypass extension, but only to know more about proxified domains, so anyone can use it this way too.
Switch between modes using the mouse button: TOR (everything is proxified), AUTO (only some sites are proxified), system (nothing is proxified, you can use a third-party VPN). PAC Antizapret only for Russians.
We are using Drover to proxify Discord through Tor and bypass UDP block.

Bridges use four completely different connection types: obfs4, snowflake, conjure and webtunnel (default, it is optimal to use only it because of the greater stability).
Replace the bridges by editing the torrc file, receive new ones via a bridge request in the tor browser or send an empty email to bridges@torproject.org.
The new webtunnel bridge can be obtained at https://bridges.torproject.org/bridges/?transport=webtunnel and https://github.com/scriptzteam/Tor-Bridges-Collector/blob/main/bridges-webtunnel, there is also a large list of webtunnel bridges inside.
Bridges may disappear gradually, as the program informs you that one of the bridges has failed, which negatively affects the quality of the connection and can lead to its complete breakdown.
I recommend reading torrc.txt, because in addition to the code for the correct operation of the program, it contains many important technical details and even has settings to increase speed (language English).

Use the antitor-service file if you want to install or uninstall Tor as service.

Ready!
