---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/pkg3.cf.html
posttitle: Code > Chapter 4 > pkg3.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/pkg3.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">verify_packages</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">allpkgoutput</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">execresult</span><span class="p">(</span><span class="s">&quot;/usr/bin/rpm -qa --queryformat </span><span class="se">\&quot;</span><span class="s">%{name}</span><span class="se">\n\&quot;</span><span class="s">&quot;</span><span class="p">);</span>
      <span class="p">&quot;</span><span class="nv">allpkgs</span><span class="p">&quot;</span>      <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">splitstring</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(allpkgoutput)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\s</span><span class="s">+&quot;</span><span class="p">,</span> <span class="mi">999999</span><span class="p">);</span>

  <span class="kd">packages</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">$(allpkgs)</span><span class="p">&quot;</span> 
        <span class="kt">package_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;verify&quot;</span><span class="p">,</span>
        <span class="kr">package_method</span> <span class="o">=&gt;</span> <span class="nf">rpm</span><span class="p">,</span>
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_notkept</span><span class="p">(</span><span class="s">&quot;incorrect_</span><span class="si">$(allpkgs)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">Problem: package $(allpkgs) is not installed correctly.</span><span class="p">&quot;</span>
        <span class="kt">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;incorrect_</span><span class="si">$(allpkgs)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
