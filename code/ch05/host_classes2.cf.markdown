---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/host_classes2.cf.html
posttitle: Code > Chapter 5 > host_classes2.cf
navsection: code
---

[(download this file)](/src/ch05/host_classes2.cf)
{% highlight cf3 %}
bundle agent config
{
  classes:
      "websrv"    expression => classmatch("websrv.*");
      "dnssrv"    expression => classmatch("dnssrv.*");
      
  methods:
    websrv::
      "config_websrv"   usebundle => config_websrv;
    dnssrv::
      "config_dnssrv"   usebundle => conig_dnssrv;
}
{% endhighlight %}

{% include codeindex.markdown %}
