---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/sysctl.conf.html
posttitle: Code > Chapter 4 > sysctl.conf
navsection: code
---

[(download this file)](/src/ch04/sysctl.conf)
{% highlight ini %}
net.ipv4.tcp_syncookies = 1
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.log_martians = 1

{% endhighlight %}

{% include codeindex.markdown %}
