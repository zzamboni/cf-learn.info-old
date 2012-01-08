---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_examples.cf.html
posttitle: Code > Chapter 3 > vars_examples.cf
navsection: code
---

[(download this file)](/src/ch03/vars_examples.cf)
{% highlight cf3 %}
vars:
  "name"   string => "Diego";
  "year"   int    => 2011;
  "colors" slist  => { "red", "green", "blue" };

{% endhighlight %}

{% include codeindex.markdown %}
