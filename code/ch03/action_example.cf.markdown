---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/action_example.cf.html
posttitle: Code > Chapter 3 > action_example.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/action_example.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span> <span class="p">{</span>
     <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
     <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span>
    <span class="s">&quot;/etc/motd&quot;</span>
      <span class="kr">edit_lines</span> <span class="o">=&gt;</span> <span class="nf">insert_lines</span><span class="p">(</span><span class="s">&quot;Unauthorized access will be prosecuted.&quot;</span><span class="p">),</span>
      <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">warn_hourly</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">warn_hourly</span>
<span class="p">{</span>
  <span class="kr">action_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;warn&quot;</span><span class="p">;</span>
  <span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;60&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
