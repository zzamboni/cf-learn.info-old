---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/password_expire_logindefs2.cf.html
posttitle: Code > Chapter 4 > password_expire_logindefs2.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/password_expire_logindefs2.cf)

<div class="highlight"><pre><span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
  <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;password_expiration&quot;</span> <span class="p">};</span>
  <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cfengine_stdlib.cf&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">password_expiration</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="c"># List of parameters to modify</span>
    <span class="p">&quot;</span><span class="nv">params</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;PASS_MAX_DAYS&quot;</span><span class="p">,</span> <span class="s">&quot;PASS_MIN_DAYS&quot;</span><span class="p">,</span> <span class="s">&quot;PASS_WARN_AGE&quot;</span> <span class="p">};</span>   

    <span class="c"># Maximum password age</span>
    <span class="p">&quot;</span><span class="nv">logindefs[PASS_MAX_DAYS]</span><span class="p">&quot;</span>                      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;180&quot;</span><span class="p">;</span>   
    <span class="c"># Minimum password age (minimum days between changes)</span>
    <span class="p">&quot;</span><span class="nv">logindefs[PASS_MIN_DAYS]</span><span class="p">&quot;</span>                      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;10&quot;</span><span class="p">;</span>
    <span class="c"># Warning period (in days) before password expires</span>
    <span class="p">&quot;</span><span class="nv">logindefs[PASS_WARN_AGE]</span><span class="p">&quot;</span>                      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;5&quot;</span><span class="p">;</span>

    <span class="c"># Position of each parameter in /etc/shadow</span>
    <span class="p">&quot;</span><span class="nv">fieldnum[PASS_MIN_DAYS]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;4&quot;</span><span class="p">;</span>   
    <span class="p">&quot;</span><span class="nv">fieldnum[PASS_MAX_DAYS]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;5&quot;</span><span class="p">;</span>
    <span class="p">&quot;</span><span class="nv">fieldnum[PASS_WARN_AGE]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;6&quot;</span><span class="p">;</span>
   
    <span class="c"># UIDs below this threshold will not be touched</span>
    <span class="p">&quot;</span><span class="nv">uidthreshold</span><span class="p">&quot;</span> <span class="kt">int</span> <span class="o">=&gt;</span> <span class="s">&quot;500&quot;</span><span class="p">;</span>   
    <span class="c"># Additionally, these users and UIDs will not be touched.</span>
    <span class="c"># These are comma-separated lists.</span>
    <span class="p">&quot;</span><span class="nv">skipped_users</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;vboxadd,nobody&quot;</span><span class="p">;</span>   
    <span class="p">&quot;</span><span class="nv">skipped_uids</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;1000,1005&quot;</span><span class="p">;</span>

    <span class="c"># Get list of users, and also generate them in canonified form</span>
    <span class="p">&quot;</span><span class="nv">users</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getusers</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(skipped_users)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$(skipped_uids)</span><span class="s">&quot;</span><span class="p">);</span>   
    <span class="p">&quot;</span><span class="nv">cusers[$(users)]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">canonify</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(users)</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">classes</span><span class="p">:</span>
    <span class="c"># Define classes for users that must not be modified,</span>
    <span class="c"># either by UID threshold or by username</span>
    <span class="s">&quot;skip_</span><span class="si">$(cusers[$(users)])</span><span class="s">&quot;</span>  <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">islessthan</span><span class="p">(</span><span class="nf">getuid</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(users)</span><span class="s">&quot;</span><span class="p">),</span> <span class="s">&quot;</span><span class="si">$(uidthreshold)</span><span class="s">&quot;</span><span class="p">);</span>   
    
  <span class="kd">files</span><span class="p">:</span>
    <span class="s">&quot;/etc/login.defs&quot;</span>   
      <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;edit_logindefs&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Set desired login.defs parameters&quot;</span><span class="p">,</span>
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_config_values</span><span class="p">(</span><span class="s">&quot;password_expiration.logindefs&quot;</span><span class="p">);</span>
   
    <span class="s">&quot;/etc/shadow&quot;</span>   
      <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;edit_shadow_</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">,</span>
      <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Modify </span><span class="si">$(params)</span><span class="s"> for individual users.&quot;</span><span class="p">,</span>
      <span class="kr">edit_defaults</span> <span class="o">=&gt;</span> <span class="nf">backup_timestamp</span><span class="p">,</span>
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_user_field</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(users)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(fieldnum[$(params)])</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(logindefs[$(params)])</span><span class="s">&quot;</span><span class="p">),</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;!skip_</span><span class="si">$(cusers[$(users)])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


{% include codeindex.markdown %}
