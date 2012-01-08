---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/control_class1.cf.html
posttitle: Code > Chapter 5 > control_class1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/control_class1.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">g</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>
      <span class="s">&quot;no_restarts&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="s">&quot;!any&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">no_restarts</span><span class="p">::</span>
      <span class="s">&quot;no_restarts is defined&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
