---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/executor_control.cf.html
posttitle: Code > Chapter 3 > executor_control.cf
navsection: code
---

[(download this file)](/src/ch03/executor_control.cf)
{% highlight cf3 %}
body executor control
{
 any::

  splaytime  => "10";
  mailto     => "cfengine@example.org";
  mailfrom   => "cfengine@$(sys.host).example.org";
  smtpserver => "mail.example.org";

  schedule => { "Min00_05", "Min30_35" };

}

{% endhighlight %}

{% include codeindex.markdown %}
