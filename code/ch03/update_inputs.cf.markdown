---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/update_inputs.cf.html
posttitle: Code > Chapter 3 > update_inputs.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/update_inputs.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">update_inputs</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">server</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;10.1.1.1&quot;</span><span class="p">;</span>
  <span class="p">&quot;</span><span class="nv">inputs</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/cfengine/masterfiles/inputs&quot;</span><span class="p">;</span>
<span class="kd">files</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">${sys.workdir}</span><span class="s">/inputs&quot;</span>
    <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">remote_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(inputs)</span><span class="s">&quot;</span><span class="p">),</span>
    <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">recurse_ignore</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">,</span> <span class="p">{</span> <span class="s">&quot;_.*&quot;</span> <span class="p">});</span>
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
