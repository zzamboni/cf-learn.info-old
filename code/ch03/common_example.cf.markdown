---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/common_example.cf.html
posttitle: Code > Chapter 3 > common_example.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/common_example.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">common</span> <span class="nf">g</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">localdir</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/local&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">confdir</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/etc&quot;</span><span class="p">;</span>
  <span class="kd">classes</span><span class="p">:</span>
    <span class="s">&quot;testhost&quot;</span>    <span class="kr">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;testhost1&quot;</span><span class="p">,</span> <span class="s">&quot;testhost2&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">testhost</span><span class="p">::</span>
      <span class="s">&quot;confdir: </span><span class="si">$(confdir)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
