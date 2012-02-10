---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch03/default-promises.cf.html
posttitle: Code > Chapter 3 > default-promises.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch03/default-promises.cf)

<div class="highlight"><pre><span class="c">###############################################################################</span>
<span class="c">#</span>
<span class="c">#   promises.cf - Basic Policy for Community</span>
<span class="c">#</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">common</span> <span class="k">control</span>
<span class="p">{</span>
        <span class="kr">inputs</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                    <span class="s">&quot;cfengine_stdlib.cf&quot;</span><span class="p">,</span> 
                    <span class="s">&quot;environment_</span><span class="si">$(environments.active)</span><span class="s">/env_promises.cf&quot;</span><span class="p">,</span>   
                  <span class="p">};</span>

        <span class="kr">bundlesequence</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                            <span class="s">&quot;environments&quot;</span><span class="p">,</span>
                            <span class="s">&quot;main&quot;</span><span class="p">,</span>
                            <span class="s">&quot;env_main&quot;</span><span class="p">,</span>   
                          <span class="p">};</span>

        <span class="kr">version</span> <span class="o">=&gt;</span> <span class="s">&quot;Community Promises.cf 1.0.0&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">###############################################################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">main</span>
<span class="p">{</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">am_policy_hub</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">--&gt; I&#39;m a policy hub.</span><span class="p">&quot;</span>
        <span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Display message on screen/email&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;main_reports_i_am_hub&quot;</span><span class="p">;</span>

    <span class="nc">!am_policy_hub</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">--&gt; $(sys.policy_hub) is my policy hub.</span><span class="p">&quot;</span>
        <span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Display message on screen/email&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;main_reports_is_my_hub&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">--&gt; CFE is running on $(sys.fqhost)</span><span class="p">&quot;</span>
        <span class="kt">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Display message on screen/email&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;main_reports_cfe_running&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#</span>
<span class="c"># Assign your machines to available environments here.</span>
<span class="c">#</span>
<span class="c"># You may add and remove environments as you want, just keep the</span>
<span class="c"># environment_&lt;NAME&gt; class defined (for GUI to sort hosts properly) and</span>
<span class="c"># environments.active variable defined as it is used in the rest of promises.cf</span>
<span class="c"># Note that &lt;NAME&gt;=&quot;any&quot; is reserved for internal purposes.</span>
<span class="c">#</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">environments</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>

      <span class="c">#</span>
      <span class="c"># Classify hosts into staing environments</span>
      <span class="c"># You may use any method like or, expression, classmatch, etc. to define the classes</span>
      <span class="c"># Hosts do not need to be classified into an environment, but must not be in multiple</span>
      <span class="c">#</span>

      <span class="p">&quot;</span><span class="nv">environment_development</span><span class="p">&quot;</span> <span class="kt">or</span> <span class="o">=&gt;</span> <span class="p">{</span>  
                                        <span class="s">&quot;hostname1_example_com&quot;</span><span class="p">,</span>
                                        <span class="s">&quot;ipv4_10_1_2_3&quot;</span><span class="p">,</span>
                                      <span class="p">};</span>


      <span class="p">&quot;</span><span class="nv">environment_testing</span><span class="p">&quot;</span>     <span class="kt">or</span> <span class="o">=&gt;</span> <span class="p">{</span>
                                        <span class="nf">classmatch</span><span class="p">(</span><span class="s">&quot;.*_test_example_com&quot;</span><span class="p">),</span> 
                                        <span class="s">&quot;ipv4_10_1_2&quot;</span><span class="p">,</span>
                                        <span class="s">&quot;suse_11&quot;</span><span class="p">,</span>
                                      <span class="p">};</span>


      <span class="p">&quot;</span><span class="nv">environment_production</span><span class="p">&quot;</span>  <span class="kt">or</span> <span class="o">=&gt;</span> <span class="p">{</span>
                                        <span class="nf">classmatch</span><span class="p">(</span><span class="s">&quot;.*_example_com&quot;</span><span class="p">),</span>  
                                        <span class="s">&quot;ipv4_10_1&quot;</span><span class="p">,</span>
                                      <span class="p">};</span>

      <span class="c">#</span>

  <span class="kd">vars</span><span class="p">:</span>

      <span class="c">#</span>
      <span class="c"># This variable holds active environment.</span>
      <span class="c">#</span>
      <span class="c"># * CDP reads files from inputs/environments_${active}/cdp_inputs.</span>
      <span class="c"># * inputs/environments_${active}/promises.cf file is read during execution.</span>
      <span class="c">#</span>
    <span class="nc">any</span><span class="p">::</span>   

      <span class="p">&quot;</span><span class="nv">active</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;none&quot;</span><span class="p">,</span> <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>

    <span class="nc">environment_production</span><span class="p">::</span>

      <span class="p">&quot;</span><span class="nv">active</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;production&quot;</span><span class="p">,</span> <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>

    <span class="nc">environment_testing</span><span class="p">::</span>

      <span class="p">&quot;</span><span class="nv">active</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;testing&quot;</span><span class="p">,</span> <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>

    <span class="nc">environment_development</span><span class="p">::</span>

      <span class="p">&quot;</span><span class="nv">active</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;development&quot;</span><span class="p">,</span> <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c">#</span>
<span class="c"># common def</span>
<span class="c">#  - common/global variables and classes here  </span>
<span class="c">#</span>
<span class="c">###############################################################################</span>

<span class="k">bundle</span> <span class="k">common</span> <span class="nf">def</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>

      <span class="c"># Begin change # Your domain name, for use in access control</span>

      <span class="p">&quot;</span><span class="nv">domain</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;example.com&quot;</span><span class="p">,</span>  
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Define a global domain for all hosts&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;common_def_vars_domain&quot;</span><span class="p">;</span>

      <span class="c"># List here the IP masks that we grant access to on the server</span>

      <span class="p">&quot;</span><span class="nv">acl</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                       <span class="s">&quot;</span><span class="si">$(sys.policy_hub)</span><span class="s">/16&quot;</span>  

                       <span class="c">#  &quot;2001:700:700:3.*&quot;, </span>
                       <span class="c">#  &quot;217.77.34.18&quot;, </span>
                       <span class="c">#  &quot;217.77.34.19&quot;,</span>
                     <span class="p">},</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Define an acl for the machines to be granted accesses&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;common_def_vars_acl&quot;</span><span class="p">;</span> 

      <span class="c"># End change #</span>

      <span class="p">&quot;</span><span class="nv">dir_masterfiles</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="nf">translatepath</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/masterfiles&quot;</span><span class="p">),</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Define masterfiles path&quot;</span><span class="p">,</span>
        <span class="kr">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;common_def_vars_dir_masterfiles&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-agent </span>
<span class="c">#</span>
<span class="c"># Settings describing the details of the fixed behavioural promises made by </span>
<span class="c"># cf-agent.</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">agent</span> <span class="k">control</span>

<span class="p">{</span>
      <span class="c"># Global default for time that must elapse before promise will be rechecked.</span>
      <span class="c"># Don&#39;t keep any promises.</span>

    <span class="nc">any</span><span class="p">::</span>

      <span class="c"># This should normally be set to an interval like 1-5 mins</span>
      <span class="c"># We set it to one initially to avoid confusion.</span>

        <span class="kr">ifelapsed</span> <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>

      <span class="c"># Do not send IP/name during server connection if address resolution is broken.</span>
      <span class="c"># Comment it out if you do NOT have a problem with DNS</span>

        <span class="kr">skipidentify</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>

      <span class="c"># Environment variables based on Distro</span>

    <span class="nc">debian</span><span class="p">::</span>
        <span class="kr">environment</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                         <span class="s">&quot;DEBIAN_FRONTEND=noninteractive&quot;</span><span class="p">,</span>
                         <span class="c">#                  &quot;APT_LISTBUGS_FRONTEND=none&quot;,</span>
                         <span class="c">#                  &quot;APT_LISTCHANGES_FRONTEND=none&quot;,</span>
                       <span class="p">};</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-serverd</span>
<span class="c">#</span>
<span class="c"># Server controls are mainly about determining access policy for the connection </span>
<span class="c"># protocol: i.e. access to the server itself. </span>
<span class="c"># Access to specific files must be granted in addition. </span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">server</span> <span class="k">control</span> 
<span class="p">{</span>
        <span class="kr">denybadclocks</span>         <span class="o">=&gt;</span> <span class="s">&quot;false&quot;</span><span class="p">;</span>
        <span class="kr">allowconnects</span>         <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;127.0.0.1&quot;</span> <span class="p">,</span> <span class="s">&quot;::1&quot;</span><span class="p">,</span> <span class="nv">@(def.acl)</span> <span class="p">};</span>
        <span class="kr">allowallconnects</span>      <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;127.0.0.1&quot;</span> <span class="p">,</span> <span class="s">&quot;::1&quot;</span><span class="p">,</span> <span class="nv">@(def.acl)</span> <span class="p">};</span>
        <span class="kr">trustkeysfrom</span>         <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;127.0.0.1&quot;</span> <span class="p">,</span> <span class="s">&quot;::1&quot;</span><span class="p">,</span> <span class="nv">@(def.acl)</span> <span class="p">};</span>

        <span class="kr">skipverify</span>            <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*</span><span class="si">$(def.domain)</span><span class="s">&quot;</span><span class="p">,</span> <span class="s">&quot;127.0.0.1&quot;</span> <span class="p">,</span> <span class="s">&quot;::1&quot;</span><span class="p">,</span> <span class="nv">@(def.acl)</span> <span class="p">};</span>

        <span class="kr">allowusers</span>            <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;root&quot;</span> <span class="p">};</span>
        <span class="kr">maxconnections</span>        <span class="o">=&gt;</span> <span class="s">&quot;100&quot;</span><span class="p">;</span>

      <span class="c"># Uncomment the line below to allow remote users to run </span>
      <span class="c"># cf-agent through cf-runagent</span>

      <span class="c"># cfruncommand          =&gt; &quot;$(sys.cf_agent)&quot;;</span>
<span class="p">}</span>

<span class="c">###############################################################################</span>

<span class="k">bundle</span> <span class="k">server</span> <span class="nf">access_rules</span><span class="p">()</span>
<span class="p">{</span>
  <span class="kd">access</span><span class="p">:</span>

    <span class="nc">any</span><span class="p">::</span>

      <span class="p">&quot;</span><span class="nv">$(def.dir_masterfiles)</span><span class="p">&quot;</span>
        <span class="kt">handle</span> <span class="o">=&gt;</span> <span class="s">&quot;server_access_rule_grant_access_policy&quot;</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Grant access to the policy updates&quot;</span><span class="p">,</span>
        <span class="kr">admit</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;.*</span><span class="si">$(def.domain)</span><span class="s">&quot;</span><span class="p">,</span> <span class="nv">@(def.acl)</span> <span class="p">};</span>

      <span class="c"># Uncomment the promise below to allow cf-runagent to</span>
      <span class="c"># access cf-agent on *NIX system</span>
      <span class="c">#</span>
      <span class="c">#   &quot;$(sys.workdir)/bin/cf-agent&quot;</span>
      <span class="c">#       handle =&gt; &quot;server_access_rule_grant_access_cfagent_linux&quot;,</span>
      <span class="c">#      comment =&gt; &quot;Grant access to cf-agent (for cf-runagent)&quot;,</span>
      <span class="c">#        admit =&gt; { &quot;.*$(def.domain)&quot;, @(def.acl) };</span>

      <span class="c"># Uncomment the promise below to allow cf-runagent to</span>
      <span class="c"># access cf-agent on Windows machines</span>
      <span class="c"># </span>
      <span class="c">#  &quot;c:\program files\cfengine\bin\cf-agent.exe&quot;</span>
      <span class="c">#</span>
      <span class="c">#    handle =&gt; &quot;server_access_rule_grant_access_cfagent_windows&quot;,</span>
      <span class="c">#    comment =&gt; &quot;Grant access to the agent (for cf-runagent)&quot;,</span>
      <span class="c">#    admit   =&gt; { &quot;.*$(def.domain)&quot;, @(def.acl) };        </span>
      
  <span class="kd">roles</span><span class="p">:</span>

      <span class="c"># Use roles to allow specific remote cf-runagent users to</span>
      <span class="c"># define certain soft-classes when running cf-agent on this host  </span>
      <span class="c">#  &quot;emergency&quot;  authorize =&gt; { &quot;root&quot; };</span>
      
<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-execd</span>
<span class="c">#</span>
<span class="c"># These body settings determine the behaviour of cf-execd, including scheduling</span>
<span class="c"># times and output capture to $(sys.workdir)/outputs and relay via email.</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">executor</span> <span class="k">control</span>
<span class="p">{</span>
    <span class="nc">any</span><span class="p">::</span>

        <span class="kr">splaytime</span>  <span class="o">=&gt;</span> <span class="s">&quot;1&quot;</span><span class="p">;</span>
        <span class="kr">mailto</span>     <span class="o">=&gt;</span> <span class="s">&quot;cfengine@</span><span class="si">$(def.domain)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">mailfrom</span>   <span class="o">=&gt;</span> <span class="s">&quot;cfengine@</span><span class="si">$(sys.host)</span><span class="s">.</span><span class="si">$(def.domain)</span><span class="s">&quot;</span><span class="p">;</span>
        <span class="kr">smtpserver</span> <span class="o">=&gt;</span> <span class="s">&quot;localhost&quot;</span><span class="p">;</span>

      <span class="c"># Default:</span>
      <span class="c">#</span>
      <span class="c"># schedule =&gt; { &quot;Min00&quot;, &quot;Min05&quot;, &quot;Min10&quot;, &quot;Min15&quot;, &quot;Min20&quot;, </span>
      <span class="c">#               &quot;Min25&quot;, &quot;Min30&quot;, &quot;Min35&quot;, &quot;Min40&quot;, &quot;Min45&quot;,</span>
      <span class="c">#               &quot;Min50&quot;, &quot;Min55&quot; };</span>

      <span class="c"># The full path and command to the executable run by default (overriding builtin).</span>
      <span class="c"># cf-twin needs its own safe environment because of the update mechanism</span>

    <span class="nc">linux</span><span class="p">::</span>
        <span class="kr">exec_command</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(sys.cf_twin)</span><span class="s"> -f failsafe.cf &amp;&amp; </span><span class="si">$(sys.cf_agent)</span><span class="s">&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-report</span>
<span class="c">#</span>
<span class="c"># Determines a list of reports to write into the build directory. </span>
<span class="c"># The format may be in text, html or xml format.</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">reporter</span> <span class="k">control</span>
<span class="p">{</span>
    <span class="nc">any</span><span class="p">::</span>

        <span class="kr">reports</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                     <span class="s">&quot;all&quot;</span> 
                   <span class="p">};</span>

        <span class="kr">build_directory</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(sys.workdir)</span><span class="s">/reports&quot;</span><span class="p">;</span>
        <span class="kr">report_output</span>   <span class="o">=&gt;</span> <span class="s">&quot;html&quot;</span><span class="p">;</span>
        <span class="kr">style_sheet</span> <span class="o">=&gt;</span> <span class="s">&quot;/cf_enterprise.css&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-runagent</span>
<span class="c">#</span>
<span class="c"># The most important parameter here is the list of hosts that the agent will </span>
<span class="c"># poll for connections.</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">runagent</span> <span class="k">control</span>
<span class="p">{</span>
      <span class="c"># A list of hosts to contact when using cf-runagent</span>

    <span class="nc">any</span><span class="p">::</span>

        <span class="kr">hosts</span> <span class="o">=&gt;</span> <span class="p">{</span> <span class="s">&quot;127.0.0.1&quot;</span> <span class="p">};</span>

      <span class="c"># , &quot;myhost.example.com:5308&quot;, ...</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
<span class="c"># This part is for cf-monitord</span>
<span class="c">#</span>
<span class="c"># The system defaults will be sufficient for most users. </span>
<span class="c"># This configurability potential, however, will be a key to developing </span>
<span class="c"># the integrated monitoring capabilities of CFE.</span>
<span class="c">###############################################################################</span>

<span class="k">body</span> <span class="k">monitor</span> <span class="k">control</span>
<span class="p">{</span>
    <span class="nc">any</span><span class="p">::</span>
        <span class="kr">forgetrate</span> <span class="o">=&gt;</span> <span class="s">&quot;0.7&quot;</span><span class="p">;</span>
        <span class="kr">histograms</span> <span class="o">=&gt;</span> <span class="s">&quot;true&quot;</span><span class="p">;</span>
      <span class="c">#  tcpdump =&gt; &quot;false&quot;;</span>
      <span class="c">#  tcpdumpcommand =&gt; &quot;/usr/sbin/tcpdump -t -n -v&quot;;</span>

<span class="p">}</span>

<span class="c">###############################################################################</span>
</pre></div>

<div align="right"><font size="-2">Syntax highlighting courtesy of <a href="http://blog.zzamboni.org/cfengine3-lexer-for-pygments">Pygments</a></font></div>
----

{% include codeindex.markdown %}
