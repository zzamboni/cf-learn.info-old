---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/pkg1.cf.html
posttitle: Code > Chapter 4 > pkg1.cf
navsection: code
---

[(download this file)](/src/ch04/pkg1.cf)
{% highlight cf3 %}
bundle agent software
{
vars:
  "pkgs" slist => {
		   "subversion",
		   "tcpdump"
		 };
packages:
  "$(pkgs)" 
    package_policy => "addupdate",
    package_method => apt;   # For Debian and Ubuntu

}

{% endhighlight %}

{% include codeindex.markdown %}
