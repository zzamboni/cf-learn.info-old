---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles7.cf.html
posttitle: Code > Chapter 5 > configfiles7.cf
navsection: code
---

[(download this file)](/src/ch05/configfiles7.cf)
{% highlight cf3 %}
body common control
{
      bundlesequence => { "configfiles" };
}

bundle agent configfiles
{
  vars:  
      # Files to edit
      "files[sysctl]" string => "/etc/sysctl.conf";
      "files[sshd]" string => "/etc/ssh/sshd_config";
      "files[inittab]"    string => "/etc/inittab";
      

      "file_id" slist => getindices("files");

  methods:
      "backup"  usebundle => backup_files("configfiles.files");
      "$(file_id)"  usebundle => "edit_$(file_id)";
      "users"   usebundle => manage_users("configfiles.users");
}

bundle agent backup_files(param)
{
  reports:
    cfengine::
      "backup_files";
}

bundle agent edit_sysctl
{
  reports:
    cfengine::
      "edit_sysctlconf: $(configfiles.files[sysctl])";
}

bundle agent edit_sshd
{
  reports:
    cfengine::
      "edit_sshdconfig: $(configfiles.files[sshd])";
}

bundle agent edit_inittab
{
  reports:
    cfengine::
      "edit_inittab: $(configfiles.files[inittab])";
}

bundle agent manage_users(param)
{
  reports:
    cfengine::
      "manage_users";
}
{% endhighlight %}

{% include codeindex.markdown %}
