---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/wordpress_test.cf.html
posttitle: Code > Chapter 4 > wordpress_test.cf
navsection: code
---

[(download this file)](/src/ch04/wordpress_test.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { wp_install("g.wp_config") };
  inputs => { "cfengine_stdlib.cf", "wordpress.cf" };
}

bundle common g
{
vars:
  "wp_config[DB_NAME]"      string => "wordpress";
  "wp_config[DB_USER]"      string => "wordpress";
  "wp_config[DB_PASSWORD]"  string => "lopsa10linux";
  debian::
    "wp_config[_htmlroot]"     string => "/var/www";
  redhat::
    "wp_config[_htmlroot]"     string => "/var/www/html";
  any::
    "wp_config[_wp_dir]"       string => "$(wp_config[_htmlroot])/blog";
}

{% endhighlight %}

{% include codeindex.markdown %}
