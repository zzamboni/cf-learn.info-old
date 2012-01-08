---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/pkg1.cf.html
posttitle: Code > Chapter 4 > pkg1.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/pkg1.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">software</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">pkgs</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span>
		   <span class="s">&quot;subversion&quot;</span><span class="p">,</span>
		   <span class="s">&quot;tcpdump&quot;</span>
		 <span class="p">};</span>
<span class="kd">packages</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(pkgs)</span><span class="s">&quot;</span> 
    <span class="kr">package_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;addupdate&quot;</span><span class="p">,</span>
    <span class="kr">package_method</span> <span class="o">=&gt;</span> <span class="nf">apt</span><span class="p">;</span>   <span class="c"># For Debian and Ubuntu</span>

<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
