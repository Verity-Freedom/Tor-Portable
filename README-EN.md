# Tor Portable

The fine-tuned Tor core for any browser configurations. EN, CN and RU configs. Customly fixed Webtunnel proto. Linux, win 7 and win 8+ support.

Support me: 0xb9569717b5f1ee67a2ace2b999a61e3d8d4cce52 USDT BEP20, https://www.donationalerts.com/r/verity_freedom.

<a href="https://star-history.com/#Verity-Freedom/Tor-Portable&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Verity-Freedom/Tor-Portable&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Verity-Freedom/Tor-Portable&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Verity-Freedom/Tor-Portable&type=Date" />
 </picture>
</a>

Developed with community support (especially thanks to DesuIsALie and bananakid).  
The main author of Tor Portable is Verity Freedom. Concept, configurations, win 7 patch, services by Verity Freedom.  
The author of the Antizapret proxy is ValdikSS.  
Tor Expert Bundle by Tor Project.  
SwitchyOmega by FelisCatus, ZeroOmega by zero-top.  
Discord-drover by hdrover.  
Webtunnel protocol fix by Xunlei.  
Technical help by NoPlagiarism.

## Philosophy

The Tor Project develops breakthrough technologies for bypassing censorship. However, their flexibility is constrained by several factors: 1) excessive dependence on the browser, which always requires a connection to the Tor network 2) the lack of exits hidden from external censorship. By freeing the Tor core from the browser, I return to this technology the freedom that it should retain, and I always say that Tor is not a browser. [Another issue mentioned has been acknowledged by the developers.](https://gitlab.torproject.org/tpo/core/tor/-/issues/41098)

Binding to a browser and slow consideration of every change prevents maintaining support for Windows 7 and quickly applying important fixes to protocol vulnerabilities. In an open source environment, this means that there will be those who will make these fixes faster. Ensuring the popularity of these solutions is achieved by keeping them simple and accessible. Tor Portable is a simple, fully portable core with configuration files for interacting with it. My goal is to provide free access to the Internet for the maximum number of people while living in a country with strict censorship and an authoritarian regime.

To achieve my goal, I freely combine, modify and distribute the available free solution with the most promising future today. My motivation is crystal clear, and I don't pretend to do anything greater than this. It's enough that some of my users like what I do, while I do this because of a deep aversion to authoritarianism and the desire to get some of the popularity for it. The project shares the BSD-3 license common to Tor.

Without further ado, here we go.

## Installation

First of all, if you want an experience similar to Tor Portable on Android, there is a great program from Gedsh. I translated [the guide](https://wiki.malw.link/index.php?title=InviZible_Pro&oldid=445) for you.

Tor Portable is hosted on the IPNS "eternal cloud", which is extremely convenient for independent information distribution, since proprietary clouds are unreliable (for many reasons, and even GitHub has mistakenly removed Tor several times, making it unavailable). For this, pinata.cloud and ipns.ipfs.network were used. I don't recommend anyone to use free proprietary clouds like MEGA with their censorship and lack of features, as dependence on them deprives you of technological sovereignty.

[Download the release from here](https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/).

Select the Tor you need and unpack it. AntiDetect does not have an exe file without a digital signature, so it does not provoke antiviruses. Other options for Windows can provoke a false antivirus reaction, but have an exe. Running AntiTor will open a console with connection information, while running service-manager will open Tor silently. To remove the service, run service-manager again. AntiTor and service-manager are the only two files that will run Tor correctly. On Linux, the service-create file is used instead. Tor will start with all the necessary universal connection settings.

If you are running win 7 version, do not mix up the bitness. If you mixed up the bitness, open the reset-oldwin-patch file and download the version with a different bitness. Win 7x86 currently uses an outdated version of the Webtunnel protocol and may perform worse than others.

If Discord does not work in your country, install Discord Drover. After installing Discord Drover, Tor should be running, and Discord will not work normally without it anymore until proper deinstallation of this mod.
![0](https://github.com/user-attachments/assets/aa520f99-cc6a-45f3-84d5-6da15b587225)

Then install the ZeroOmega extension ([Chrome](https://chromewebstore.google.com/detail/proxy-switchyomega-3-zero/pfnededegaaopdmhkdmcofjmoldfiped), [Firefox](https://addons.mozilla.org/en-US/firefox/addon/zeroomega/), [GitHub](https://github.com/zero-peak/ZeroOmega)). Pin it to your extensions bar. Before using ZeroOmega on Firefox, you need to grant it the "Run in private windows" permission. ZeroOmega is the best platform for mass deployment of browser proxy settings, so you can 5 star it in your store. On Win 7, it may be possible to install an extension only from a local file (it is known that the Google store can lie about incompatibility).

If you use Chrome or similar (Edge, Opera) browser, please also install [WebRTC Control](https://chromewebstore.google.com/detail/webrtc-control/fjkmabmdepjfammlpliljpnbhleegehm). It will significantly protect your privacy [until identical functionality is added to ZeroOmega](https://github.com/zero-peak/ZeroOmega/issues/182).

It's time to sync your settings. Choose between three configs:

https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/ZeroOmegaOptions-CN.bak  
https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/ZeroOmegaOptions-EN.bak  
https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/ZeroOmegaOptions-RU.bak

![1](https://github.com/user-attachments/assets/ba35f792-2e3a-4113-94da-f26a3e9fad26)

All three configs have three main modes: System, AUTO and VIRTUAL. In System there is no proxying, in AUTO only blocked sites are proxied, in VIRTUAL everything is proxied by Tor. The modes are switched by clicking the mouse button on the extension. Black circle - System, purple circle with a black center - AUTO, purple circle - VIRTUAL. VIRTUAL is used to speedcheck (e.g. speedcheck.org) your Tor speed and protect your privacy. Change the mode to the one you need immediately after synchronization.

You are using quick switch to switch between modes, optionally you can disable it at any time by right-clicking on the extension and pressing Enable Quick Switch. Then you will have to select the modes manually in the menu that opens with the left mouse button on the icon. You can be creative by changing the theme of the extension and the colors of the modes. To restore everything as it was, re-sync.

![3](https://github.com/user-attachments/assets/c055ca4c-d531-4680-ba96-d3fe7bf1c64a)

ZeroOmega has a very advanced address parser. It can be used to refill domains in AUTO mode without leaving the extension, or any other things. To open it, right-click on the extension and click Network monitor.

![4](https://github.com/user-attachments/assets/a96c04ae-fa78-4c4a-815e-7aac65ffab2c)

Tor Portable itself has two modes: pro and default, which are switched via the change-mode file. Switching to pro mode is necessary to partially compensate for the lack of hidden Tor exits, since sometimes sites impose restrictions on them, such as the inability to send images in Discord or some inaccessible music videos on YouTube, or inability to talk with Gemini. Pro mode is using only one exit. But the default mode uses completely random exits (so these restrictions are triggered randomly), and should survive much longer, while even having a pro mode won't help you avoid restrictions on some sites.

If you want to try to completely avoid restrictions from sites like Grok.com, you should install [Psiphon TM](https://github.com/Verity-Freedom/Tor-Portable/releases/tag/v1.0), and change VIRTUAL mode from TOR to PROXY. But I'm not recommending this to everyone, since Psiphon TM is not that properly developed (at the time of writing this), and is much slower than Tor. I should try to at least create the Linux version of it, but I use it on my Windows the way it is.

That's all for now. Good luck.
