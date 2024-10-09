# Tor-Portable

Easy to learn, one-button utility for everyday bypass of censorship (optimized for YouTube). Approved by the author of Bypassing Runet blocking, there is compatibility (shared use) with Anti-Ban via an extension. There is an exe with silent startup, easy installation/removal of services and revolutionary new methods for bypassing blocks with impressive speed (Webtunnel bridges) released in 2024.

Download the latest version in releases! (releases)

---
Support us:

5536 9141 8416 7645 — Verity Freedom

4377 7237 7311 4255 — ilyaigpetrov

---
Using portable Tor through the extension SwitchyOmega. With the support of the community (especially from DesuIsALie and bananakid). The main author of the portable Tor is Verity Freedom. Tor Expert Bundle from Tor Project.The main author of the portable Tor is Verity Freedom. Tor Expert Bundle from Tor Project.

1) Make sure that the extension has the following flags: consider exceptions (in the "Exceptions" section), Use PAC script proxy, Use YOUR local Tor, YOUR OWN proxy only for YOUR sites, Proxy .onion (in the "Custom proxies" section). Use either anti-ban mode or anti-censorship mode (compatible with both). In the "anti-ban" mode, only exception sites will be proxied through Tor (proxy - yes), and the rest will be picked up by the anti-ban; in the “anti-censorship” mode, all sites limited by Russian censorship will be proxied through it. I recommend using anti-ban mode whenever possible due to its greater versatility and compatibility with some sites, and switching to anti-censorship otherwise.
2) To proxy all browser traffic through Tor (can be useful for diagnosing and avoiding geolocation, see https://github.com/anticensority/runet-censorship-bypass/issues/313) use the SwitchyOmega extension. To proxy YouTube, copy a short (preferably) or long list and add these addresses to exceptions, making sure that you have an adblock to counteract YouTube advertising (the recognized best one is in the archive).
3) Run the program via AntiTor.exe and let it run in the background. It is advisable to place the shortcut leading to AntiTor.exe in startup (startup is called by the shell:startup command in the win+r menu), it can also be pinned to the taskbar.
4) Bridges use five completely different connection types: obfs4, meek_lite, snowflake, conjure and webtunnel (by default, it is optimal to use only this due to its higher speed). Replace bridges by editing the torrc file, get new ones by requesting a bridge in the tor browser or by sending an empty email to bridges@torproject.org. The new webtunnel can be obtained at https://bridges.torproject.org/bridges/?transport=webtunnel. Bridges may disappear gradually, which the program reports by saying that one of the bridges has failed, which negatively affects the quality of the connection and can lead to its complete rupture.
5) Use the antitor-service file if you want to install or remove Tor as a service.

Done!