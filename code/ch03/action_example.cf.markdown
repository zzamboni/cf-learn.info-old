---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/action_example.cf.html
posttitle: Code > Chapter 3 > action_example.cf
navsection: code
---

[(download this file)](/src/ch03/action_example.cf)
{% highlight cf3 %}
body common control {
     bundlesequence => { "test" };
     inputs => { "cfengine_stdlib.cf" };
}

bundle agent test
{
  files:
    "/etc/motd"
      edit_lines => insert_lines("Unauthorized access will be prosecuted."),
      action => warn_hourly;
}

body action warn_hourly
{
  action_policy => "warn";
  ifelapsed => "60";
}

{% endhighlight %}

{% include codeindex.markdown %}
