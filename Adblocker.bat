@echo off
REM This script blocks ads by modifying the Windows hosts file

:: Make a backup of the current hosts file
echo Backing up the hosts file...
copy C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\etc\hosts.bak

:: Block known ad-serving domains by redirecting them to localhost
echo Blocking ad domains...

(
    echo 127.0.0.1    doubleclick.net
    echo 127.0.0.1    googleads.g.doubleclick.net
    echo 127.0.0.1    ads.youtube.com
    echo 127.0.0.1    pagead2.googlesyndication.com
    echo 127.0.0.1    ad.doubleclick.net
    echo 127.0.0.1    analytics.twitter.com
    echo 127.0.0.1    static.ads-twitter.com
    echo 127.0.0.1    securepubads.g.doubleclick.net
    echo 127.0.0.1    partner.googleadservices.com
    echo 127.0.0.1    bat.bing.com
    echo 127.0.0.1    aax.amazon-adsystem.com
    echo 127.0.0.1    serve.advertising.com
) >> C:\Windows\System32\drivers\etc\hosts

echo Ad domains blocked successfully!

:: Flush DNS cache to apply changes
ipconfig /flushdns

:: Finish
echo Done! Ads should be blocked now.
pause
