---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/monitor_for_changes2.cf.html
posttitle: Code > Chapter 4 > monitor_for_changes2.cf
navsection: code
---

[(download this file)](/src/ch04/monitor_for_changes2.cf)
{% highlight cf3 %}
body common control
{
  bundlesequence => { "neighborhood_watch", "monitor_for_changes" };
  inputs => { "cfengine_stdlib.cf" };
}

bundle agent monitor_for_changes
{
  vars:
    "dirs" slist => { "/bin", "/usr/bin" };
    "files" slist => { "/etc/passwd", "/etc/motd" };

  files:
    "$(dirs)"
      changes => detect_all_change,
      depth_search => recurse("inf");

    "$(files)"
      changes => detect_all_change;
}

bundle agent neighborhood_watch
{
vars:
  "neighbors" slist => peers("/var/cfengine/inputs/hostlist","#.*",4),   
                       comment => "Get my neighbors from a list of all hosts";

files:

  # Redundant cross monitoring
  "$(sys.workdir)/nw/$(neighbors)_checksum_digests.db"   
    comment => "Watch our peers remote hash tables!",
    copy_from => remote_cp("$(sys.workdir)/checksum_digests.db",$(neighbors)),   
    action => neighbor_report("File changes observed on $(neighbors)"),   
    depends_on => { "grant_hash_tables" };   
}

body action neighbor_report(msg)
{
  ifelapsed => "30";
  log_string => "$(msg)";
}

bundle server access_rules()
{
vars:
  # List here the IP masks that we grant access to on the server
  "acl" slist => { 
                  "$(sys.ipv4)/24",
                  "128.39.89.233", 
                  "2001:700:700:3.*"
                 },
        comment => "Define an acl for the machines to be granted accesses",
        handle => "common_def_vars_acl"; 

access:
  "/var/cfengine/checksum_digests.tcdb"
    handle => "grant_hash_tables",
    admit   => { @(acl) },
    maproot => { @(acl) };
 }

{% endhighlight %}

{% include codeindex.markdown %}
