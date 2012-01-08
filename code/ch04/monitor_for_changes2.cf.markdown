---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/monitor_for_changes2.cf.html
posttitle: Code > Chapter 4 > monitor_for_changes2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/monitor_for_changes2.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;neighborhood_watch&quot;</span><span class="p">,</span> <span class="s">&quot;monitor_for_changes&quot;</span> <span class="p">};</span>
  <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">monitor_for_changes</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="p">&quot;</span><span class="nv">dirs</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;/bin&quot;</span><span class="p">,</span> <span class="s">&quot;/usr/bin&quot;</span> <span class="p">};</span>
    <span class="p">&quot;</span><span class="nv">files</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;/etc/passwd&quot;</span><span class="p">,</span> <span class="s">&quot;/etc/motd&quot;</span> <span class="p">};</span>

  <span class="kd">files</span><span class="p">:</span>
    <span class="s">&quot;</span><span class="si">$(dirs)</span><span class="s">&quot;</span>
      <span class="kr">changes</span> <span class="o">=&gt;</span> <span class="nf">detect_all_change</span><span class="p">,</span>
      <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">recurse</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">);</span>

    <span class="s">&quot;</span><span class="si">$(files)</span><span class="s">&quot;</span>
      <span class="kr">changes</span> <span class="o">=&gt;</span> <span class="nf">detect_all_change</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">neighborhood_watch</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">neighbors</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">peers</span><span class="p">(</span><span class="s">&quot;/var/cfengine/inputs/hostlist&quot;</span><span class="p">,</span><span class="s">&quot;#.*&quot;</span><span class="p">,</span><span class="mi">4</span><span class="p">),</span>   
                       <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Get my neighbors from a list of all hosts&quot;</span><span class="p">;</span>

<span class="kd">files</span><span class="p">:</span>

  <span class="c"># Redundant cross monitoring</span>
  <span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/nw/</span><span class="si">$(neighbors)</span><span class="s">_checksum_digests.db&quot;</span>   
    <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Watch our peers remote hash tables!&quot;</span><span class="p">,</span>
    <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">remote_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/checksum_digests.db&quot;</span><span class="p">,</span><span class="err">$</span><span class="p">(</span><span class="nf">neighbors</span><span class="p">)),</span>   
    <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">neighbor_report</span><span class="p">(</span><span class="s">&quot;File changes observed on </span><span class="si">$(neighbors)</span><span class="s">&quot;</span><span class="p">),</span>   
    <span class="kr">depends_on</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;grant_hash_tables&quot;</span> <span class="p">};</span>   
<span class="p">}</span>

<span class="k">body</span> <span class="k">action</span> <span class="nf">neighbor_report</span><span class="p">(</span><span class="nv">msg</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;30&quot;</span><span class="p">;</span>
  <span class="kr">log_string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(msg)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">server</span> <span class="nf">access_rules</span><span class="p">()</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="c"># List here the IP masks that we grant access to on the server</span>
  <span class="p">&quot;</span><span class="nv">acl</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                  <span class="s">&quot;</span><span class="si">$(sys.ipv4)</span><span class="s">/24&quot;</span><span class="p">,</span>
                  <span class="s">&quot;128.39.89.233&quot;</span><span class="p">,</span> 
                  <span class="s">&quot;2001:700:700:3.*&quot;</span>
                 <span class="p">},</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Define an acl for the machines to be granted accesses&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;common_def_vars_acl&quot;</span><span class="p">;</span> 

<span class="kd">access</span><span class="p">:</span>
  <span class="s">&quot;/var/cfengine/checksum_digests.tcdb&quot;</span>
    <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;grant_hash_tables&quot;</span><span class="p">,</span>
    <span class="kr">admit</span>   <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(acl)</span> <span class="p">},</span>
    <span class="kr">maproot</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="nv">@(acl)</span> <span class="p">};</span>
 <span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
