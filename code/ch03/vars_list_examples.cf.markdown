---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_list_examples.cf.html
posttitle: Code > Chapter 3 > vars_list_examples.cf
navsection: code
---

[(download this file)](/src/ch03/vars_list_examples.cf)
{% highlight cf3 %}
body common control {
  bundlesequence => { "test" };
}

bundle agent test
{
  vars:
    "l1" ilist => { "1", "2", "3" };
    "l2" rlist => { "1.0", "2.0", "3.0" };
    "l3" slist => { "one", "two", "three", @(l1), @(l2) };

  reports:
    cfengine::
      "l3 = $(l3)";
}

{% endhighlight %}

{% include codeindex.markdown %}
