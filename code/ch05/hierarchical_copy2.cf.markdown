---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/hierarchical_copy2.cf.html
posttitle: Code > Chapter 5 > hierarchical_copy2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/hierarchical_copy2.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
   <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
   <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;copyfiles&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c"># Use single copy for all files</span>
<span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>
<span class="p">{</span>
   <span class="kr">files_single_copy</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*&quot;</span> <span class="p">};</span> 
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">copyfiles</span>
<span class="p">{</span>
 <span class="kd">vars</span><span class="p">:</span>
   <span class="c"># Suffixes to try, in most-specific to most-general order. This must include the</span>
   <span class="c"># empty suffix at the end, for the most general file.</span>
   <span class="p">&quot;</span><span class="nv">suffixes</span><span class="p">&quot;</span>    <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.</span><span class="si">$(sys.fqhost)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.uqhost)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.domain)</span><span class="s">&quot;</span><span class="p">,</span> 
			    <span class="s">&quot;.</span><span class="si">$(sys.flavour)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;.</span><span class="si">$(sys.ostype)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;&quot;</span> <span class="p">};</span>
   <span class="c"># List of files to copy</span>
   <span class="p">&quot;</span><span class="nv">filestocopy</span><span class="p">&quot;</span>     <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;/etc/hosts&quot;</span><span class="p">,</span> <span class="s">&quot;/etc/motd&quot;</span> <span class="p">};</span>   
   <span class="p">&quot;</span><span class="nv">dirstocopy</span><span class="p">&quot;</span>      <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/bin&quot;</span><span class="p">,</span> <span class="s">&quot;/usr/local/bin&quot;</span> <span class="p">};</span>
   <span class="c"># Source of the files</span>
   <span class="p">&quot;</span><span class="nv">repo</span><span class="p">&quot;</span>            <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/mnt/fileserver/cfengine/files&quot;</span><span class="p">;</span>   
   <span class="c"># Destination for the files</span>
   <span class="c"># Make it empty to copy over the real system (i.e. &quot;production mode&quot;)</span>
   <span class="c"># &quot;dest&quot; string =&gt; &quot;&quot;;</span>
   <span class="p">&quot;</span><span class="nv">dest</span><span class="p">&quot;</span>            <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/tmp/testdest&quot;</span><span class="p">;</span>   

 <span class="kd">files</span><span class="p">:</span>
   <span class="s">&quot;</span><span class="si">$(dest)$(filestocopy)</span><span class="s">&quot;</span>   
     <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_dcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repo)$(filestocopy)$(suffixes)</span><span class="s">&quot;</span><span class="p">);</span>

   <span class="s">&quot;</span><span class="si">$(dest)$(dirstocopy)</span><span class="s">&quot;</span>    
     <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">local_dcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(repo)$(dirstocopy)$(suffixes)</span><span class="s">&quot;</span><span class="p">),</span>
     <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">recurse</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
