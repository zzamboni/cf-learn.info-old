---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/order-control.cf.html
posttitle: Code > Chapter 5 > order-control.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/order-control.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span> <span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
                    <span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">var1</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;value 1&quot;</span><span class="p">;</span>
    <span class="nc">foo</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">var2</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;value 2&quot;</span><span class="p">;</span>
  <span class="kd">classes</span><span class="p">:</span>
      <span class="s">&quot;foo&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">isvariable</span><span class="p">(</span><span class="s">&quot;var1&quot;</span><span class="p">);</span>
      <span class="s">&quot;bar&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">isvariable</span><span class="p">(</span><span class="s">&quot;var2&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;var1=</span><span class="si">$(var1)</span><span class="s">&quot;</span>
        <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;bar&quot;</span><span class="p">;</span>
      <span class="s">&quot;var2=</span><span class="si">$(var2)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
