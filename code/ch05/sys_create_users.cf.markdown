---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/sys_create_users.cf.html
posttitle: Code > Chapter 5 > sys_create_users.cf
navsection: code
---

[(download this file)](/src/ch05/sys_create_users.cf)
{% highlight cf3 %}
bundle agent create_users(info)
{
vars:
  "user"        slist => getindices("$(info)"); 

classes:
  "add_$(user)" not => userexists("$(user)"); 

commands: 
  linux::
    "/usr/sbin/useradd $($(info)[$(user)][flags]) -u $($(info)[$(user)][uid]) 
     -g $($(info)[$(user)][gid]) -d $($(info)[$(user)][home]) 
     -s $($(info)[$(user)][shell]) -c '$($(info)[$(user)][fullname])' $(user)"
       ifvarclass => "add_$(user)";
  windows::
    "c:/Windows/system32/net user $(user) $($(info)[$(user)][password]) /add 
     \"/fullname:$($(info)[$(user)][fullname])\" \"/homedir:$($(info)[$(user)][home])\""
       ifvarclass => "add_$(user)";
    ### On Windows we use a command to set the password inconditionally in case it has changed.
    "c:/Windows/system32/net user $(user) $($(info)[$(user)][password])"; 

files:
  ### This is not conditioned to the add_* classes to always check and reset the passwords if needed.
  linux::
    "/etc/shadow" 
      edit_line => set_user_field("$(user)", 2, "$($(info)[$(user)][password])");

reports: 
  !linux.!windows::
    "I only know how to create users under Linux and Windows.";
  verbose::
    "Created user $(user)"
      ifvarclass => "add_$(user)";
}

{% endhighlight %}

{% include codeindex.markdown %}
