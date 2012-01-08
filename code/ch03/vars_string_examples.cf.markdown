---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_string_examples.cf.html
posttitle: Code > Chapter 3 > vars_string_examples.cf
navsection: code
---

[(download this file)](/src/ch03/vars_string_examples.cf)
{% highlight cf3 %}
body common control {
  bundlesequence => { "test" };
}

bundle agent test
{
  vars:
    "s1" string => "one";
    "s2" string => "this
is a
multine string";
    "s3" string => "with \"quotes\"";

  reports:
    cfengine::
      "s1 = $(s1)";
      "s2 = $(s2)";
      "s3 = $(s3)";
}

{% endhighlight %}

{% include codeindex.markdown %}
