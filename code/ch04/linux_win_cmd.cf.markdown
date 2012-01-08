---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/linux_win_cmd.cf.html
posttitle: Code > Chapter 4 > linux_win_cmd.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/linux_win_cmd.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">reboot</span>
<span class="p">{</span>
<span class="kd">commands</span><span class="p">:</span>
  <span class="nc">linux</span><span class="p">::</span>
    <span class="s">&quot;/sbin/shutdown -r now&quot;</span><span class="p">;</span>
  <span class="nc">windows</span><span class="p">::</span>
    <span class="s">&quot;c:/Windows/system32/shutdown.exe /r /t 01&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
