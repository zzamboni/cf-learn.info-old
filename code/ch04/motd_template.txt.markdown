---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/motd_template.txt.html
posttitle: Code > Chapter 4 > motd_template.txt
navsection: code
---

[(download this file)](/src/ch04/motd_template.txt)
{% highlight cf3 %}
This system may be accessed by authorized users only.
Use of this system implies acceptance of authorized use policies.
Misuse may be subject to prosecution.

Host: $(sys.fqhost) ($(sys.ipv4))
This system is managed by CFEngine v$(sys.cf_version)
This file was generated from $(login_banner.template_file)

{% endhighlight %}

{% include codeindex.markdown %}
