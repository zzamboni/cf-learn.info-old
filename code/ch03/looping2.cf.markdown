---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/looping2.cf.html
posttitle: Code > Chapter 3 > looping2.cf
navsection: code
---

[(download this file)](/src/ch03/looping2.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "test" };
}

bundle agent test
{
vars:
  "colors" slist => { "red", "green", "blue" };
  "tone"   slist => { "dark", "light" };
reports:
  cfengine_3::
    "$(tone) $(colors)";
}

{% endhighlight %}

{% include codeindex.markdown %}
