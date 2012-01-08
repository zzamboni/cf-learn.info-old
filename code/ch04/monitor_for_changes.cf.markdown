---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/monitor_for_changes.cf.html
posttitle: Code > Chapter 4 > monitor_for_changes.cf
navsection: code
---

[(download this file)](/src/ch04/monitor_for_changes.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "monitor_for_changes" };
  inputs => { "cfengine_stdlib.cf" };
}

bundle agent monitor_for_changes
{
  vars:
    "files_dirs" slist => { "/bin", "/etc/passwd", "/etc/motd" };

  files:
    "$(files_dirs)"
      changes => detect_all_change,
      depth_search => recurse("inf");
}

{% endhighlight %}

{% include codeindex.markdown %}
