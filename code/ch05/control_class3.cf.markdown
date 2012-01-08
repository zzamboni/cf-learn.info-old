---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/control_class3.cf.html
posttitle: Code > Chapter 5 > control_class3.cf
navsection: code
---

[(download this file)](/src/ch05/control_class3.cf)
{% highlight cf3 %}
body common control
{
      bundlesequence => { "test" };
}

bundle common g
{
  vars:
    testrun::
      "class_file" string => "/tmp/classes.txt";
    !testrun::
      "class_file" string => "/var/cfengine/site/classes.txt";
    any::
      "class_strs" slist => readstringlist("$(class_file)", "#.*?\n", "\s+", "inf", "inf");
  classes:
      "$(class_strs)"  expression => "any";
}

bundle agent test
{
  reports:
    no_restarts::
      "no_restarts is defined";
    foobar::
      "foobar is defined";
}
{% endhighlight %}

{% include codeindex.markdown %}
