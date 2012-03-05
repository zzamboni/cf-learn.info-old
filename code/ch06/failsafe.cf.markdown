---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch06/failsafe.cf.html
posttitle: Code > Chapter 6 > failsafe.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch06/failsafe.cf)

<div class="highlight"><pre><span class="c">###############################################################################</span>
<span class="c">#</span>
<span class="c">#   failsafe.cf - Basic Failsafe Policy for Community</span>
<span class="c">#</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;update&quot;</span> <span class="p">};</span>
        <span class="kr">version</span> <span class="o">=&gt;</span> <span class="s">&quot;Community Failsafe.cf 1.0.0&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################################################</span>

<span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;0&quot;</span><span class="p">;</span>
        <span class="kr">skipidentify</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">update</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>

      <span class="p">&quot;</span><span class="nv">inputs_dir</span><span class="p">&quot;</span>         <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">translatepath</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/inputs&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Directory containing Cfengine policies&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_inputs_dir&quot;</span><span class="p">;</span>

      <span class="p">&quot;</span><span class="nv">ppkeys_file</span><span class="p">&quot;</span>        <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">translatepath</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/ppkeys/localhost.pub&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Path to public key file&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_ppkeys_file&quot;</span><span class="p">;</span>

      <span class="p">&quot;</span><span class="nv">file_check</span><span class="p">&quot;</span>         <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">translatepath</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(inputs_dir)</span><span class="s">/promises.cf&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Path to a policy file&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_file_check&quot;</span><span class="p">;</span>

      <span class="p">&quot;</span><span class="nv">master_location</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/var/cfengine/masterfiles&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;The master cfengine policy directory on the policy host&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_vars_master_location&quot;</span><span class="p">;</span>

      <span class="c">#</span>

  <span class="kd">classes</span><span class="p">:</span>

      <span class="s">&quot;have_ppkeys&quot;</span>   <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(ppkeys_file)</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Check for /var/cfengine/ppkeys/localhost.pub&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_classes_have_ppkeys&quot;</span><span class="p">;</span>

      <span class="s">&quot;files_ok&quot;</span>      <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(file_check)</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Check for /var/cfengine/masterfiles/promises.cf&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_classes_files_ok&quot;</span><span class="p">;</span>

      <span class="c">#</span>

  <span class="kd">processes</span><span class="p">:</span>

    <span class="nc">files_ok</span><span class="p">::</span>

      <span class="s">&quot;cf-serverd&quot;</span>  <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_server&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Monitor cf-serverd process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_processes_cf_serverd&quot;</span><span class="p">;</span>

      <span class="s">&quot;cf-monitord&quot;</span> <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_monitor&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Monitor cf-monitord process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_processes_cf_monitord&quot;</span><span class="p">;</span>

    <span class="nc">files_ok.!windows</span><span class="p">::</span>

      <span class="s">&quot;cf-execd&quot;</span>    <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_exec&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Monitor cf-execd process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_processes_cf_execd&quot;</span><span class="p">;</span>

      <span class="c">#</span>

  <span class="kd">commands</span><span class="p">:</span>

    <span class="nc">start_server</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(sys.cf_serverd)</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Start cf-serverd process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_commands_start_cf_serverd&quot;</span><span class="p">;</span>

    <span class="nc">start_monitor</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(sys.cf_monitord)</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Start cf-monitord process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_commands_start_cf_monitord&quot;</span><span class="p">;</span>

    <span class="nc">!windows.start_exec</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(sys.cf_execd)</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Start cf-execd process&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_commands_start_cf_execd_not_windows&quot;</span><span class="p">;</span>

    <span class="nc">!have_ppkeys</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(sys.cf_key)</span><span class="s">&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Generate cfengine encryption keys if necessary&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_commands_generate_keys&quot;</span><span class="p">;</span>

    <span class="nc">am_policy_hub&amp;(Min00_05||Min30_35)</span><span class="p">::</span>
      <span class="s">&quot;/usr/bin/git pull origin&quot;</span>
        <span class="kr">contain</span> <span class="o">=&gt;</span> <span class="nf">u_in_dir</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(master_location)</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Update </span><span class="si">$(master_location)</span><span class="s"> from git repository&quot;</span><span class="p">,</span>
        <span class="kr">handle</span>  <span class="o">=&gt;</span> <span class="s">&quot;update_masterfiles_from_git&quot;</span><span class="p">;</span>

      <span class="c">#</span>

  <span class="kd">files</span><span class="p">:</span>

    <span class="nc">!am_policy_hub</span><span class="p">::</span>  <span class="c"># policy hub should not alter inputs/ uneccessary</span>

      <span class="s">&quot;</span><span class="si">$(inputs_dir)</span><span class="s">/cf_promises_validated&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Check whether a validation stamp is available for a new policy update to reduce the distributed load&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;check_valid_update&quot;</span><span class="p">,</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">u_dcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(master_location)</span><span class="s">/cf_promises_validated&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(sys.policy_hub)</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">,</span>
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">u_if_repaired</span><span class="p">(</span><span class="s">&quot;validated_updates_ready&quot;</span><span class="p">);</span>

    <span class="nc">am_policy_hub|validated_updates_ready</span><span class="p">::</span>  <span class="c"># policy hub should always put masterfiles in inputs in order to check new policy</span>

      <span class="s">&quot;</span><span class="si">$(inputs_dir)</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Copy policy updates from master source on policy server if a new validation was acquired&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_inputs_dir&quot;</span><span class="p">,</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">u_rcp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(master_location)</span><span class="s">&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="si">$(sys.policy_hub)</span><span class="s">&quot;</span><span class="p">),</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">),</span>
        <span class="kr">file_select</span>  <span class="o">=&gt;</span> <span class="nf">u_input_files</span><span class="p">,</span>
        <span class="kr">depends_on</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;grant_access_policy&quot;</span><span class="p">,</span> <span class="s">&quot;check_valid_update&quot;</span> <span class="p">},</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">,</span>
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">u_if_repaired</span><span class="p">(</span><span class="s">&quot;update_report&quot;</span><span class="p">);</span>

    <span class="nc">!windows</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/bin&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Make sure cfengine binaries have right file permissions&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_sys_workdir_bin&quot;</span><span class="p">,</span>
        <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">u_m</span><span class="p">(</span><span class="s">&quot;755&quot;</span><span class="p">),</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse_basedir</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">),</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">;</span>

      <span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/lib&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Make sure cfengine libraries have right file permissions&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_sys_workdir_lib&quot;</span><span class="p">,</span>
        <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">u_m</span><span class="p">(</span><span class="s">&quot;644&quot;</span><span class="p">),</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse_basedir</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">),</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">;</span>

      <span class="s">&quot;/usr/local/sbin&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Ensure cfengine binaries were copied to /usr/local/sbin&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_usr_local_sbin&quot;</span><span class="p">,</span>
        <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">u_m</span><span class="p">(</span><span class="s">&quot;755&quot;</span><span class="p">),</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">u_cp_nobck</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/bin&quot;</span><span class="p">),</span>
        <span class="kr">file_select</span> <span class="o">=&gt;</span> <span class="nf">u_cf3_files</span><span class="p">,</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse</span><span class="p">(</span><span class="s">&quot;1&quot;</span><span class="p">),</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">;</span>

    <span class="nc">am_policy_hub</span><span class="p">::</span>

      <span class="s">&quot;</span><span class="si">$(master_location)</span><span class="s">/.&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Make sure masterfiles folder has right file permissions&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;update_files_sys_workdir_masterfiles&quot;</span><span class="p">,</span>
        <span class="kr">perms</span> <span class="o">=&gt;</span> <span class="nf">u_m</span><span class="p">(</span><span class="s">&quot;644&quot;</span><span class="p">),</span>
        <span class="kr">depth_search</span> <span class="o">=&gt;</span> <span class="nf">u_recurse_basedir</span><span class="p">(</span><span class="s">&quot;inf&quot;</span><span class="p">),</span>
        <span class="kr">action</span> <span class="o">=&gt;</span> <span class="nf">u_immediate</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#########################################################</span>
<span class="c"># Self-contained bodies from the lib to avoid dependencies</span>
<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">perms</span> <span class="nf">u_m</span><span class="p">(</span><span class="nv">p</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">mode</span>  <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(p)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">file_select</span> <span class="nf">u_cf3_files</span>
<span class="p">{</span>
        <span class="kr">leaf_name</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;cf-.*&quot;</span> <span class="p">};</span>
        <span class="kr">file_result</span> <span class="o">=&gt;</span> <span class="s">&quot;leaf_name&quot;</span><span class="p">;</span>
<span class="p">}</span>

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

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">u_dcp</span><span class="p">(</span><span class="nv">from</span><span class="p">,</span><span class="nv">server</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;mtime&quot;</span><span class="p">;</span>
        <span class="kr">trustkey</span>    <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>

    <span class="nc">!am_policy_hub</span><span class="p">::</span>

        <span class="kr">servers</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(server)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">copy_from</span> <span class="nf">u_cp_nobck</span><span class="p">(</span><span class="nv">from</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">source</span>      <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(from)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">compare</span>     <span class="o">=&gt;</span> <span class="s">&quot;digest&quot;</span><span class="p">;</span>
        <span class="kr">copy_backup</span> <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
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

<span class="k">body</span> <span class="k">depth_search</span> <span class="nf">u_recurse_basedir</span><span class="p">(</span><span class="nv">d</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">include_basedir</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
        <span class="kr">depth</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(d)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">exclude_dirs</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="se">\.</span><span class="s">svn&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">classes</span> <span class="nf">u_if_repaired</span><span class="p">(</span><span class="nv">x</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">promise_repaired</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;</span><span class="si">$(x)</span><span class="s">&quot;</span> <span class="p">};</span>
<span class="p">}</span>

<span class="c">#########################################################</span>

<span class="k">body</span> <span class="k">contain</span> <span class="nf">u_in_dir</span><span class="p">(</span><span class="nv">s</span><span class="p">)</span>
<span class="p">{</span>
        <span class="kr">chdir</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(s)</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
