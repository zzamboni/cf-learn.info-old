---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/configfiles6.cf.html
posttitle: Code > Chapter 5 > configfiles6.cf
navsection: code
---

[(download this file)](/src/ch05/configfiles6.cf)
{% highlight cf3 %}
bundle agent configfiles
{
 vars:  
   # Files to edit
   "files[sysctlconf]" string => "/etc/sysctl.conf";
   "files[sshdconfig]" string => "/etc/ssh/sshd_config";
   "files[inittab]"    string => "/etc/inittab";
   

 methods:
   "backup"  usebundle => backup_files("configfiles.files");
   "sysctl"  usebundle => edit_sysctl;
   "sshd"    usebundle => edit_sshd;
   "inittab" usebundle => edit_inittab;
   "users"   usebundle => manage_users("configfiles.users");
}

bundle agent backup_files(id)
{
 vars:
   "allfiles"  slist => getindices("$(id)");
   "backupdst" string => "/mnt/fileserver/cfenginebackups-$(sys.cdate)";

 files:
   "$(backupst)/."
     create => "true";

   "$(backupdst)/$(allfiles)"
     comment => "Ensure we have a backup of previous versions of $(allfiles)",
     copy_from => local_cp("$(allfiles)");
}

{% endhighlight %}

{% include codeindex.markdown %}
