---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_num_examples.cf.html
posttitle: Code > Chapter 3 > vars_num_examples.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/vars_num_examples.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">i1</span><span class="p">&quot;</span> <span class="kt">int</span> <span class="o">=&gt;</span> <span class="s">&quot;25&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">i2</span><span class="p">&quot;</span> <span class="kt">int</span> <span class="o">=&gt;</span> <span class="s">&quot;10k&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">i3</span><span class="p">&quot;</span> <span class="kt">int</span> <span class="o">=&gt;</span> <span class="s">&quot;10K&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">r1</span><span class="p">&quot;</span> <span class="kt">real</span> <span class="o">=&gt;</span> <span class="s">&quot;1.2&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">r2</span><span class="p">&quot;</span> <span class="kt">real</span> <span class="o">=&gt;</span> <span class="s">&quot;10e-5&quot;</span><span class="p">;</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;i1 = </span><span class="si">$(i1)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;i2 = </span><span class="si">$(i2)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;i3 = </span><span class="si">$(i3)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;r1 = </span><span class="si">$(r1)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;r2 = </span><span class="si">$(r2)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
