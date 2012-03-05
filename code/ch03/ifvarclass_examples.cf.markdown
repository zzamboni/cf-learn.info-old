---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/ifvarclass_examples.cf.html
posttitle: Code > Chapter 3 > ifvarclass_examples.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/ifvarclass_examples.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">words</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;apple&quot;</span><span class="p">,</span> <span class="s">&quot;darwin&quot;</span><span class="p">,</span> <span class="s">&quot;table&quot;</span><span class="p">,</span> <span class="s">&quot;linux&quot;</span> <span class="p">};</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;Class </span><span class="si">$(words)</span><span class="s"> is defined&quot;</span>
        <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(words)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;Class </span><span class="si">$(words)</span><span class="s"> is not defined&quot;</span>
        <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;!</span><span class="si">$(words)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
