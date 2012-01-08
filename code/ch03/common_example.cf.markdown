---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/common_example.cf.html
posttitle: Code > Chapter 3 > common_example.cf
navsection: code
---

[(download this file)](/src/ch03/common_example.cf)
{% highlight cf3 %}
bundle common g
{
  vars:
    "localdir"    string => "/usr/local";
    "confdir"     string => "/etc";
  classes:
    "testhost"    or => { "testhost1", "testhost2" };
}

bundle common test
{
  reports:
    testhost::
      "confdir: $(confdir)";
}

{% endhighlight %}

{% include codeindex.markdown %}
