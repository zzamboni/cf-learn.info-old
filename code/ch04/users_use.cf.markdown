---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/users_use.cf.html
posttitle: Code > Chapter 4 > users_use.cf
navsection: code
---

[(download this file)](/src/ch04/users_use.cf)
{% highlight cf3 %}
bundle agent manage_users
{
vars:
  ### Users to create
  "users[root][fullname]"  string => "System administrator";
  "users[root][uid]"       string => "0";
  "users[root][gid]"       string => "0";
  "users[root][home]"      string => "/root";
  "users[root][shell]"     string => "/bin/bash";
  "users[root][flags]"     string => "-o -m";
  "users[root][password]"  string => "FkDMzhB1WnOp2";

  "users[zamboni][fullname]"  string => "Diego Zamboni";
  "users[zamboni][uid]"       string => "501";
  "users[zamboni][gid]"       string => "users";
  "users[zamboni][home]"      string => "/home/zamboni";
  "users[zamboni][shell]"     string => "/bin/bash";
  "users[zamboni][flags]"     string => "-m";
  "users[zamboni][password]"  string => "dk52ia209rfuh";

methods:
  "users"   usebundle => create_users("manage_users.users");
}

{% endhighlight %}

{% include codeindex.markdown %}
