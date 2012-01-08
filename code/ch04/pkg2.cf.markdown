---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/pkg2.cf.html
posttitle: Code > Chapter 4 > pkg2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/pkg2.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">software</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">version[openssl]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;0.9.8k-7ubuntu8&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">version[ssl-cert]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1.0.23ubuntu2&quot;</span><span class="p">;</span>

  <span class="p">&quot;</span><span class="nv">architectures</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;x86_64&quot;</span> <span class="p">};</span>
  <span class="p">&quot;</span><span class="nv">allpkgs</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;version&quot;</span><span class="p">);</span>

<span class="kd">packages</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(allpkgs)</span><span class="s">&quot;</span> 
    <span class="kr">package_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;add&quot;</span><span class="p">,</span>
    <span class="kr">package_select</span> <span class="o">=&gt;</span> <span class="s">&quot;==&quot;</span><span class="p">;</span>
    <span class="kr">package_version</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(version[$(allpkgs)]&quot;;</span>
<span class="si">    package_architectures =&gt; @</span><span class="err">(</span><span class="si">architectures)</span><span class="s">;</span>
<span class="s">    package_method =&gt; apt;   # For Debian and Ubuntu</span>
<span class="s">}</span>
</pre></div>


{% include codeindex.markdown %}
