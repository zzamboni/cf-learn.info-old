---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/linux_win_cmd2.cf.html
posttitle: Code > Chapter 4 > linux_win_cmd2.cf
navsection: code
---

[(download this file)](/src/ch04/linux_win_cmd2.cf)
{% highlight cf3 %}
bundle agent reboot
{
commands:
  reboot_needed.linux::
    "/sbin/shutdown -r now";
  reboot_needed.windows::
    "c:/Windows/system32/shutdown.exe /r /t 01";
    
reports:
  reboot_needed.!linux.!windows::
    "I know how to reboot only Linux and Windows machines.";
}

{% endhighlight %}

{% include codeindex.markdown %}
