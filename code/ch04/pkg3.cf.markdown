---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/pkg3.cf.html
posttitle: Code > Chapter 4 > pkg3.cf
navsection: code
---

[(download this file)](/src/ch04/pkg3.cf)
{% highlight cf3 %}
bundle agent verify_packages
{
vars:
  "allpkgoutput" string => execresult("/usr/bin/rpm -qa --queryformat \"%{name}\n\"");
  "allpkgs" slist => splitstring("$(allpkgoutput)", "\s+", 999999);

packages:
  "$(allpkgs)" 
    package_policy => "verify",
    package_method => rpm,
    classes => if_notkept("incorrect_$(allpkgs)");

reports:
  "Problem: package $(allpkgs) is not installed correctly."
    ifvarclass => "incorrect_$(allpkgs)";
}

{% endhighlight %}

{% include codeindex.markdown %}
