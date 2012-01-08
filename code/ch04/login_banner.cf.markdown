---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/login_banner.cf.html
posttitle: Code > Chapter 4 > login_banner.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/login_banner.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span> 
<span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;login_banner&quot;</span> <span class="p">};</span>
  <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span> 
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">login_banner</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">template_file</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/cfengine/templates/motd_template.txt&quot;</span><span class="p">;</span>   
    <span class="p">&quot;</span><span class="nv">motd_file</span><span class="p">&quot;</span>     <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/tmp/motd&quot;</span><span class="p">;</span> 
		
  <span class="kd">files</span><span class="p">:</span>
  <span class="s">&quot;</span><span class="si">$(motd_file)</span><span class="s">&quot;</span>   
    <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;set_login_banner&quot;</span><span class="p">,</span>
    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure the login banner is set to the authorized text&quot;</span><span class="p">,</span>
    <span class="kr">create</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">,</span>
    <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">m</span><span class="p">(</span><span class="s">&quot;744&quot;</span><span class="p">),</span>
    <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">empty</span><span class="p">,</span>
    <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">expand_template</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(template_file)</span><span class="s">&quot;</span><span class="p">);</span> 
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
