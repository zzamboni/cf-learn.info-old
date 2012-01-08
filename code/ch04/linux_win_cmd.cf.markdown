---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/linux_win_cmd.cf.html
posttitle: Code > Chapter 4 > linux_win_cmd.cf
navsection: code
---

[(download this file)](/src/ch04/linux_win_cmd.cf)
{% highlight cf3 %}
bundle agent reboot
{
commands:
  linux::
    "/sbin/shutdown -r now";
  windows::
    "c:/Windows/system32/shutdown.exe /r /t 01";
}

{% endhighlight %}

{% include codeindex.markdown %}
