---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/unit_method_var2.cf.html
posttitle: Code > Chapter 5 > unit_method_var2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/unit_method_var2.cf)

<div class="highlight"><pre><span class="c">#</span>
<span class="c"># Demonstrates the use of polymorphism to call bundles.</span>
<span class="c">#</span>

<span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;test&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">test</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">m</span><span class="p">&quot;</span> <span class="kt">slist</span>  <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;login&quot;</span><span class="p">,</span> <span class="s">&quot;ssh_keys&quot;</span><span class="p">,</span> <span class="s">&quot;environment&quot;</span> <span class="p">};</span>
      <span class="p">&quot;</span><span class="nv">user</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;diego&quot;</span><span class="p">,</span> <span class="s">&quot;mark&quot;</span><span class="p">,</span> <span class="s">&quot;neil&quot;</span> <span class="p">};</span>

  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;set of </span><span class="si">$(m)</span><span class="s">&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="err">$</span><span class="p">(</span><span class="nf">m</span><span class="p">)(</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">);</span>

      
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">login</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;Setup login for </span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">ssh_keys</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;Setup ssh keys for </span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###########################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">environment</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;Setup login environment for </span><span class="si">$(x)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
