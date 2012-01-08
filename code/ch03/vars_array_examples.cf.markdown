---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_array_examples.cf.html
posttitle: Code > Chapter 3 > vars_array_examples.cf
navsection: code
---

[(download this file)](/src/ch03/vars_array_examples.cf)
{% highlight cf3 %}
body common control {
  bundlesequence => { "test" };
}

bundle agent test
{
  vars:
    "user[name]"       string => "zamboni";
    "user[fullname]"   string => "Diego Zamboni";
    "user[home]"       string => "/home/zamboni";

    "fields" slist => getindices("user");

  reports:
    cfengine::
      "user[$(fields)] = $(user[$(fields)])";
}

{% endhighlight %}

{% include codeindex.markdown %}
