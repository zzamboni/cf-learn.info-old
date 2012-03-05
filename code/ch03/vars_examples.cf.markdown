---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_examples.cf.html
posttitle: Code > Chapter 3 > vars_examples.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/vars_examples.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wrapper</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">name</span><span class="p">&quot;</span>   <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;Diego&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">year</span><span class="p">&quot;</span>   <span class="kt">int</span>    <span class="o">=&gt;</span> <span class="s">&quot;2011&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">colors</span><span class="p">&quot;</span> <span class="kt">slist</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;red&quot;</span><span class="p">,</span> <span class="s">&quot;green&quot;</span><span class="p">,</span> <span class="s">&quot;blue&quot;</span> <span class="p">};</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
