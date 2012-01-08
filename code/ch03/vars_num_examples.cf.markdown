---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_num_examples.cf.html
posttitle: Code > Chapter 3 > vars_num_examples.cf
navsection: code
---

[(download this file)](/src/ch03/vars_num_examples.cf)
{% highlight cf3 %}
body common control {
  bundlesequence => { "test" };
}

bundle agent test
{
  vars:
    "i1" int => "25";
    "i2" int => "10k";
    "i3" int => "10K";
    "r1" real => "1.2";
    "r2" real => "10e-5";

  reports:
    cfengine::
      "i1 = $(i1)";
      "i2 = $(i2)";
      "i3 = $(i3)";
      "r1 = $(r1)";
      "r2 = $(r2)";
}

{% endhighlight %}

{% include codeindex.markdown %}
