---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/control_class1.cf.html
posttitle: Code > Chapter 5 > control_class1.cf
navsection: code
---

[(download this file)](/src/ch05/control_class1.cf)
{% highlight cf3 %}
body common control
{
      bundlesequence => { "test" };
}

bundle common g
{
  classes:
      "no_restarts" expression => "!any";
}

bundle agent test
{
  reports:
    no_restarts::
      "no_restarts is defined";
}
{% endhighlight %}

{% include codeindex.markdown %}
