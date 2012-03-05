---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/vars_array_examples2.cf.html
posttitle: Code > Chapter 3 > vars_array_examples2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/vars_array_examples2.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">user[name]</span><span class="p">&quot;</span>              <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;zamboni&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">user[fullname][first]</span><span class="p">&quot;</span>   <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;Diego&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">user[fullname][last]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;Zamboni&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">user[dirs]</span><span class="p">&quot;</span>              <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;/home/zamboni&quot;</span><span class="p">,</span>
                                           <span class="s">&quot;/tmp/zamboni&quot;</span><span class="p">,</span>
                                           <span class="s">&quot;/export/home/zamboni&quot;</span> <span class="p">};</span>

      <span class="p">&quot;</span><span class="nv">fields</span><span class="p">&quot;</span>     <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;user&quot;</span><span class="p">);</span>
      <span class="p">&quot;</span><span class="nv">userfields</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;user[fullname]&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine</span><span class="p">::</span>
      <span class="s">&quot;user fields = </span><span class="si">$(fields)</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;account name = </span><span class="si">$(user[name])</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;</span><span class="si">$(userfields)</span><span class="s"> name = </span><span class="si">$(user[fullname][$(userfields)])</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="s">&quot;user dir = </span><span class="si">$(user[dirs])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
