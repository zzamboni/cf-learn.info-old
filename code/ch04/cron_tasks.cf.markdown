---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/cron_tasks.cf.html
posttitle: Code > Chapter 4 > cron_tasks.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/cron_tasks.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">cron_tasks</span>
<span class="p">{</span>
  <span class="kd">commands</span><span class="p">:</span>
    <span class="nc">Min00_05</span><span class="p">::</span>   <span class="c">### Commands to run hourly</span>
      <span class="s">&quot;/usr/sbin/updatedb&quot;</span><span class="p">;</span>
    <span class="nc">Hr00</span><span class="p">::</span>       <span class="c">### Commands to run daily at different times</span>
      <span class="s">&quot;/usr/local/sbin/logrotate&quot;</span><span class="p">;</span>
      <span class="s">&quot;/usr/sbin/tmpclean&quot;</span><span class="p">;</span>
    <span class="nc">Hr03</span><span class="p">::</span>    
      <span class="s">&quot;/usr/local/sbin/run_backups&quot;</span><span class="p">;</span>
    <span class="nc">Monday</span><span class="p">::</span>     <span class="c">### Commands to run weekly</span>
      <span class="s">&quot;/usr/sbin/usercheck&quot;</span><span class="p">;</span>
    <span class="nc">Lcycle_0</span><span class="p">::</span>   <span class="c">### Commands to run every four years</span>
      <span class="s">&quot;/usr/sbin/random_catastrophic_failure&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
