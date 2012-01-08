---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/sshd_config1.cf.html
posttitle: Code > Chapter 3 > sshd_config1.cf
navsection: code
---

[(download this file)](/src/ch03/sshd_config1.cf)
{% highlight cf3 %}
files:
  "/etc/ssh/sshd_config"
    comment => "Ensure root login is disallowed",
    edit_line => append_if_no_line("AllowRoot no");

{% endhighlight %}

{% include codeindex.markdown %}
