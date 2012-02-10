---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/failsafe-update.cf.html
posttitle: Code > Chapter 3 > failsafe-update.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/failsafe-update.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">update</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>

      <span class="p">&quot;</span><span class="nv">inputs_dir</span><span class="p">&quot;</span>         <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">translatepath</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/inputs&quot;</span><span class="p">),</span>   
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Directory containing Cfengine policies&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_inputs_dir&quot;</span><span class="p">;</span>

      <span class="p">&quot;</span><span class="nv">master_location</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/cfengine/masterfiles&quot;</span><span class="p">,</span>   
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;The master cfengine policy directory on the policy host&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_master_location&quot;</span><span class="p">;</span>

      <span class="c">#</span>

  <span class="kd">files</span><span class="p">:</span>

      <span class="p">&quot;</span><span class="nv">$(inputs_dir)</span><span class="p">&quot;</span>   
        <span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Copy policy updates from master source on policy server if a new validation was acquired&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_inputs_dir&quot;</span><span class="p">,</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">u_rcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(master_location)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(sys.policy_hub)</span><span class="s">&quot;</span><span class="p">),</span>  
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">),</span>   
        <span class="kr">file_select</span>  <span class="o">=&gt;</span> <span class="nf">u_input_files</span><span class="p">,</span>   
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">u_if_repaired</span><span class="p">(</span><span class="s">&quot;update_report&quot;</span><span class="p">);</span>   

<span class="p">}</span>

<span class="c">#########################################################</span>
<span class="c"># Self-contained bodies from the lib to avoid dependencies</span>
<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">u_input_files</span>
<span class="p">{</span>
        <span class="kr">leaf_name</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*.cf&quot;</span><span class="p">,</span><span class="s">&quot;.*.dat&quot;</span><span class="p">,</span><span class="s">&quot;.*.txt&quot;</span> <span class="p">};</span>
        <span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;leaf_name&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">u_rcp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
        <span class="kr">trustkey</span>    <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>

    <span class="nc">!am_policy_hub</span><span class="p">::</span>

        <span class="kr">servers</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">u_immediate</span>
<span class="p">{</span>
        <span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">depth_search</span> <span class="nf">u_recurse</span><span class="p">(</span><span class="nv">d</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">depth</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(d)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">exclude_dirs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="se">\.</span><span class="s">svn&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">u_if_repaired</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
