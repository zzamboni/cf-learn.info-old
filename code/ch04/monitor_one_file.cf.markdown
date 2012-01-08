---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/monitor_one_file.cf.html
posttitle: Code > Chapter 4 > monitor_one_file.cf
navsection: code
---

[(download this file)](/src/ch04/monitor_one_file.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "monitor_files" };
  inputs => { "cfengine_stdlib.cf" };
}

bundle agent monitor_files
{
  vars:
    "files" slist => { "/bin/ls", "/etc/passwd", "/etc/motd" };

  files:
    "$(files)"
      changes => detect_all_change;
}

{% endhighlight %}

{% include codeindex.markdown %}
