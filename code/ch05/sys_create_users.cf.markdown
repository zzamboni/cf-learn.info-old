---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/sys_create_users.cf.html
posttitle: Code > Chapter 5 > sys_create_users.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/sys_create_users.cf)

<div class="highlight"><pre><span class="k">bundle</span> <span class="k">agent</span> <span class="nf">create_users</span><span class="p">(</span><span class="nv">info</span><span class="p">)</span>
<span class="p">{</span>
<span class="kd">vars</span><span class="p">:</span>
  <span class="p">&quot;</span><span class="nv">user</span><span class="p">&quot;</span>        <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(info)</span><span class="s">&quot;</span><span class="p">);</span> 

<span class="kd">classes</span><span class="p">:</span>
  <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span> <span class="kr">not</span> <span class="o">=&gt;</span> <span class="nf">userexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">);</span> 

<span class="kd">commands</span><span class="p">:</span> 
  <span class="nc">linux</span><span class="p">::</span>
    <span class="s">&quot;/usr/sbin/useradd </span><span class="si">$($(info)[$(user)][flags])</span><span class="s"> -u </span><span class="si">$($(info)[$(user)][uid])</span><span class="s"> </span>
<span class="s">     -g </span><span class="si">$($(info)[$(user)][gid])</span><span class="s"> -d </span><span class="si">$($(info)[$(user)][home])</span><span class="s"> </span>
<span class="s">     -s </span><span class="si">$($(info)[$(user)][shell])</span><span class="s"> -c &#39;</span><span class="si">$($(info)[$(user)][fullname])</span><span class="s">&#39; </span><span class="si">$(user)</span><span class="s">&quot;</span>
       <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
  <span class="nc">windows</span><span class="p">::</span>
    <span class="s">&quot;c:/Windows/system32/net user </span><span class="si">$(user)</span><span class="s"> </span><span class="si">$($(info)[$(user)][password])</span><span class="s"> /add </span>
<span class="s">     </span><span class="se">\&quot;</span><span class="s">/fullname:</span><span class="si">$($(info)[$(user)][fullname])</span><span class="se">\&quot;</span><span class="s"> </span><span class="se">\&quot;</span><span class="s">/homedir:</span><span class="si">$($(info)[$(user)][home])</span><span class="se">\&quot;</span><span class="s">&quot;</span>
       <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
    <span class="c">### On Windows we use a command to set the password inconditionally in case it has changed.</span>
    <span class="s">&quot;c:/Windows/system32/net user </span><span class="si">$(user)</span><span class="s"> </span><span class="si">$($(info)[$(user)][password])</span><span class="s">&quot;</span><span class="p">;</span> 

<span class="kd">files</span><span class="p">:</span>
  <span class="c">### This is not conditioned to the add_* classes to always check and reset the passwords if needed.</span>
  <span class="nc">linux</span><span class="p">::</span>
    <span class="s">&quot;/etc/shadow&quot;</span> 
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">set_user_field</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="s">&quot;</span><span class="si">$($(info)[$(user)][password])</span><span class="s">&quot;</span><span class="p">);</span>

<span class="kd">reports</span><span class="p">:</span> 
  <span class="nc">!linux.!windows</span><span class="p">::</span>
    <span class="s">&quot;I only know how to create users under Linux and Windows.&quot;</span><span class="p">;</span>
  <span class="nc">verbose</span><span class="p">::</span>
    <span class="s">&quot;Created user </span><span class="si">$(user)</span><span class="s">&quot;</span>
      <span class="kr">ifvarclass</span> <span class="o">=&gt;</span> <span class="s">&quot;add_</span><span class="si">$(user)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>


----

{% include codeindex.markdown %}
