---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/executor_control.cf.html
posttitle: Code > Chapter 3 > executor_control.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/executor_control.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">executor</span> <span class="k">control</span>
<span class="p">{</span>
 <span class="nc">any</span><span class="p">::</span>

  <span class="kr">splaytime</span>  <span class="o">=&gt;</span> <span class="s">&quot;10&quot;</span><span class="p">;</span>
  <span class="kr">mailto</span>     <span class="o">=&gt;</span> <span class="s">&quot;cfengine@example.org&quot;</span><span class="p">;</span>
  <span class="kr">mailfrom</span>   <span class="o">=&gt;</span> <span class="s">&quot;cfengine@</span><span class="si">$(sys.host)</span><span class="s">.example.org&quot;</span><span class="p">;</span>
  <span class="kr">smtpserver</span> <span class="o">=&gt;</span> <span class="s">&quot;mail.example.org&quot;</span><span class="p">;</span>

  <span class="kr">schedule</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;Min00_05&quot;</span><span class="p">,</span> <span class="s">&quot;Min30_35&quot;</span> <span class="p">};</span>

<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
