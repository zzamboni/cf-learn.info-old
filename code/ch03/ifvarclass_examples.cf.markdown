---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/ifvarclass_examples.cf.html
posttitle: Code > Chapter 3 > ifvarclass_examples.cf
navsection: code
---

[(download this file)](/src/ch03/ifvarclass_examples.cf)
{% highlight cf3 %}
body common control {
  bundlesequence => { "test" };
}

bundle agent test
{
  vars:
    "words" slist => { "apple", "darwin", "table", "linux" };
  reports:
    cfengine::
      "Class $(words) is defined"
        ifvarclass => "$(words)";
      "Class $(words) is not defined"
        ifvarclass => "!$(words)";
}

{% endhighlight %}

{% include codeindex.markdown %}
