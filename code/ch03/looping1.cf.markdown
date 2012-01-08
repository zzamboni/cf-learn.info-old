---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/looping1.cf.html
posttitle: Code > Chapter 3 > looping1.cf
navsection: code
---

[(download this file)](/src/ch03/looping1.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "test" };
}

bundle agent test
{
vars:
  "colors" slist => { "red", "green", "blue" };
reports:
  cfengine::
    "$(colors)";
}

{% endhighlight %}

{% include codeindex.markdown %}
