---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/cron_tasks.cf.html
posttitle: Code > Chapter 4 > cron_tasks.cf
navsection: code
---

[(download this file)](/src/ch04/cron_tasks.cf)
{% highlight cf3 %}
bundle agent cron_tasks
{
  commands:
    Min00_05::   ### Commands to run hourly
      "/usr/sbin/updatedb";
    Hr00::       ### Commands to run daily at different times
      "/usr/local/sbin/logrotate";
      "/usr/sbin/tmpclean";
    Hr03::    
      "/usr/local/sbin/run_backups";
    Monday::     ### Commands to run weekly
      "/usr/sbin/usercheck";
    Lcycle_0::   ### Commands to run every four years
      "/usr/sbin/random_catastrophic_failure";
}

{% endhighlight %}

{% include codeindex.markdown %}
