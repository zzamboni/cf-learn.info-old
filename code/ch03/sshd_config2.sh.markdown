---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config2.sh.html
posttitle: Code > Chapter 3 > sshd_config2.sh
navsection: code
---

[(download this file)](/src/ch03/sshd_config2.sh)
{% highlight bash %}
(grep -iq AllowRoot /etc/ssh/sshd_config ||
 echo "AllowRoot no" >> /etc/ssh/sshd_config) &&
 sed -i 's/^.*AllowRoot .*$/AllowRoot no/;' /etc/ssh/sshd_config

{% endhighlight %}

{% include codeindex.markdown %}
