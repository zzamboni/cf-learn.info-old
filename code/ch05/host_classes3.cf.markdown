---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/host_classes3.cf.html
posttitle: Code > Chapter 5 > host_classes3.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/host_classes3.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">config</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>
      <span class="c"># Functional classes</span>
      <span class="s">&quot;websrv&quot;</span>       <span class="kr">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">classmatch</span><span class="p">(</span><span class="s">&quot;websrv.*&quot;</span><span class="p">),</span>
                             <span class="s">&quot;testsrv_domain_com&quot;</span> <span class="p">};</span>
      <span class="s">&quot;linux_dnssrv&quot;</span> <span class="kr">and</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">classmatch</span><span class="p">(</span><span class="s">&quot;dnssrv.*&quot;</span><span class="p">),</span>
                              <span class="s">&quot;linux&quot;</span> <span class="p">};</span>
      <span class="c"># Geographical classes, using IP ranges</span>
      <span class="s">&quot;location1&quot;</span>    <span class="c"># 10.1.0.0/16, 10.2.0.0/16, also websrv01-10</span>
        <span class="kr">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">iprange</span><span class="p">(</span><span class="s">&quot;10.1.0.0/16&quot;</span><span class="p">),</span> <span class="nf">iprange</span><span class="p">(</span><span class="s">&quot;10.2.0.0/16&quot;</span><span class="p">),</span>
                <span class="nf">hostrange</span><span class="p">(</span><span class="s">&quot;websrv&quot;</span><span class="p">,</span> <span class="s">&quot;01-10&quot;</span><span class="p">)</span> <span class="p">};</span>
      <span class="s">&quot;location2&quot;</span>    <span class="c"># 10.10.0.0/16, also websrv11-20</span>
        <span class="kr">or</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nf">iprange</span><span class="p">(</span><span class="s">&quot;10.10.0.0/16&quot;</span><span class="p">),</span>
                <span class="nf">hostrange</span><span class="p">(</span><span class="s">&quot;websrv&quot;</span><span class="p">,</span> <span class="s">&quot;11-20&quot;</span><span class="p">)</span> <span class="p">};</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
