---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch05/wordpress.cf.html
posttitle: Code > Chapter 5 > wordpress.cf
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch05/wordpress.cf)

<div class="highlight"><pre><span class="c">#!/var/cfengine/bin/cf-agent -KIf</span>
<span class="c">#</span>
<span class="c"># Author: Aleksey Tsalolikhin &lt;atsaloli.tech@gmail.com&gt;, Diego Zamboni &lt;diego.zamboni@cfengine.com&gt;</span>
<span class="c"># OS: linux</span>
<span class="c"># Tested: ubuntu</span>
<span class="c">#</span>
<span class="c"># Install and configure WordPress:</span>
<span class="c">#	1. Install Infrastructure:</span>
<span class="c">#		1.1. Install httpd and mod_php and PHP MySQL client.</span>
<span class="c">#		1.2. Install MySQL server.</span>
<span class="c">#			1.2.1. Create WordPress User in MySQL.</span>
<span class="c">#			1.2.2. Create WordPress Database in MySQL.</span>
<span class="c">#		1.3. Make sure httpd and MySQL servers are running.</span>
<span class="c">#	2. Install the PHP application (WordPress)</span>
<span class="c">#		2.1. Download tarball with the latest version of WordPress PHP application.</span>
<span class="c">#		2.2. Extract it into the httpd document root where it can be run by the Web server.</span>
<span class="c">#		2.3. Create WordPress config file wp-config.php from wp-config-sample.php that&#39;s shipped with WordPress.</span>
<span class="c">#		2.4. Tweak wp-config.php to put in the data needed to establish database connection (db name, db username and password).</span>
<span class="c">#</span>
<span class="c">#</span>
<span class="c"># Sample usage:</span>
<span class="c">#</span>
<span class="c">#   body common control</span>
<span class="c">#   {</span>
<span class="c">#     bundlesequence =&gt; { wp_install(&quot;g.wp_config&quot;) };</span>
<span class="c">#     inputs =&gt; { &quot;cfengine_stdlib.cf&quot;, &quot;wordpress_installer.cf&quot; };</span>
<span class="c">#   }</span>
<span class="c">#   </span>
<span class="c">#   bundle common g</span>
<span class="c">#   {</span>
<span class="c">#   vars:</span>
<span class="c">#     &quot;wp_config[DB_NAME]&quot;      string =&gt; &quot;wordpress&quot;;</span>
<span class="c">#     &quot;wp_config[DB_USER]&quot;      string =&gt; &quot;wordpress&quot;;</span>
<span class="c">#     &quot;wp_config[DB_PASSWORD]&quot;  string =&gt; &quot;lopsa10linux&quot;;</span>
<span class="c">#     debian::</span>
<span class="c">#       &quot;wp_config[_htmlroot]&quot;     string =&gt; &quot;/var/www&quot;;</span>
<span class="c">#     redhat::</span>
<span class="c">#       &quot;wp_config[_htmlroot]&quot;     string =&gt; &quot;/var/www/html&quot;;</span>
<span class="c">#     any::</span>
<span class="c">#       &quot;wp_config[_wp_dir]&quot;       string =&gt; &quot;$(wp_config[_htmlroot])/blog&quot;;</span>
<span class="c">#   }</span>
<span class="c">#</span>
<span class="c"># Any parameters in wp_config that do not start with an underscore (_) will be</span>
<span class="c"># edited/added to the wp-config.php file. You can use this to modify any</span>
<span class="c"># other Wordpress parameters you want, for example:</span>
<span class="c">#   &quot;wp_config[AUTH_KEY]&quot; string =&gt; &quot;foobarbaz&quot;;</span>

<span class="c">######################################################################</span>
<span class="c"># Public entry points</span>
<span class="c">######################################################################</span>

<span class="c"># Make sure wordpress is installed and configured correctly.</span>
<span class="c"># Mandatory parameters in the &quot;params&quot; array:</span>
<span class="c">#   DB_NAME</span>
<span class="c">#   DB_USER</span>
<span class="c">#   DB_PASSWORD</span>
<span class="c">#   _htmlroot</span>
<span class="c">#   _wp_dir (final wordpress install directory)</span>
<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_install</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;wp_vars&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_vars</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_pkgs&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_packages_installed</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_svcs&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_services_up</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_tar&quot;</span>   <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_tarball_is_present</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_xpnd&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_tarball_is_unrolled</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span> 
      <span class="s">&quot;wp_mysql&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_mysql_configuration</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span> 
      <span class="s">&quot;wp_cfgcp&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_config_exists</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_cfg&quot;</span>   <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_is_properly_configured</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c"># Make sure wordpress is configured correctly. It must be installed already.</span>
<span class="c"># Mandatory parameters in the &quot;params&quot; array:</span>
<span class="c">#   _wp_dir (directory where wordpress is installed)</span>
<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_config</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">methods</span><span class="p">:</span>
      <span class="s">&quot;wp_vars&quot;</span>  <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_vars</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_cfgcp&quot;</span> <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_config_exists</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
      <span class="s">&quot;wp_cfg&quot;</span>   <span class="kr">usebundle</span> <span class="o">=&gt;</span> <span class="nf">wp_is_properly_configured</span><span class="p">(</span><span class="s">&quot;wp_vars.conf&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_vars</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>   
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">wp_dir</span><span class="p">&quot;</span>             <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$($(params)[_wp_dir])</span><span class="s">&quot;</span><span class="p">;</span>
      <span class="c"># Default configuration values. Internal parameters start with _</span>
      <span class="p">&quot;</span><span class="nv">conf[_tarfile]</span><span class="p">&quot;</span>      <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/root/wordpress-latest.tar.gz&quot;</span><span class="p">,</span>   
                            <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>   
      <span class="p">&quot;</span><span class="nv">conf[_downloadurl]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;http://wordpress.org/latest.tar.gz&quot;</span><span class="p">,</span>
                            <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">conf[_wp_config]</span><span class="p">&quot;</span>    <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(wp_dir)</span><span class="s">/wp-config.php&quot;</span><span class="p">,</span>
                            <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">conf[_wp_cfgsample]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$(wp_dir)</span><span class="s">/wp-config-sample.php&quot;</span><span class="p">,</span>
                            <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
    <span class="nc">debian</span><span class="p">::</span>   
      <span class="p">&quot;</span><span class="nv">conf[_sys_servicecmd]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/usr/sbin/service&quot;</span><span class="p">,</span>
                              <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">conf[_sys_apachesrv]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;apache2&quot;</span><span class="p">,</span>
                              <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
    <span class="nc">redhat</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">conf[_sys_servicecmd]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;/sbin/service&quot;</span><span class="p">,</span>
                              <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
      <span class="p">&quot;</span><span class="nv">conf[_sys_apachesrv]</span><span class="p">&quot;</span>  <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;httpd&quot;</span><span class="p">,</span>
                              <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
    <span class="nc">any</span><span class="p">::</span>   
      <span class="c"># Copy configuration parameters passed, into a local array</span>
      <span class="p">&quot;</span><span class="nv">param_keys</span><span class="p">&quot;</span>          <span class="kt">slist</span>  <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">);</span>   
      <span class="p">&quot;</span><span class="nv">conf[$(param_keys)]</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;</span><span class="si">$($(params)[$(param_keys)])</span><span class="s">&quot;</span><span class="p">,</span>
                            <span class="kr">policy</span> <span class="o">=&gt;</span> <span class="s">&quot;overridable&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_report_params</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">keys</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">);</span>
  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">cfengine_3</span><span class="p">::</span>
      <span class="s">&quot;</span><span class="si">$(keys)</span><span class="s"> = </span><span class="si">$($(params)[$(keys)])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_packages_installed</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
    <span class="nc">debian</span><span class="p">::</span>  
      <span class="p">&quot;</span><span class="nv">desired_package</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                                   <span class="s">&quot;apache2&quot;</span><span class="p">,</span> 
                                   <span class="s">&quot;php5&quot;</span><span class="p">,</span>
                                   <span class="s">&quot;php5-mysql&quot;</span><span class="p">,</span>
                                   <span class="s">&quot;mysql-server&quot;</span><span class="p">,</span>
                                 <span class="p">};</span>
    <span class="nc">redhat</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">desired_package</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="p">{</span> 
                                   <span class="s">&quot;httpd&quot;</span><span class="p">,</span>
                                   <span class="s">&quot;php&quot;</span><span class="p">,</span>
                                   <span class="s">&quot;php-mysql&quot;</span><span class="p">,</span>
                                   <span class="s">&quot;mysql-server&quot;</span><span class="p">,</span>
                                 <span class="p">};</span>
  <span class="kd">packages</span><span class="p">:</span>  
      <span class="s">&quot;</span><span class="si">$(desired_package)</span><span class="s">&quot;</span>
        <span class="kr">package_policy</span> <span class="o">=&gt;</span> <span class="s">&quot;add&quot;</span><span class="p">,</span>
        <span class="kr">package_method</span> <span class="o">=&gt;</span> <span class="nf">generic</span><span class="p">,</span>
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;packages_added&quot;</span><span class="p">);</span>

  <span class="kd">commands</span><span class="p">:</span>
    <span class="nc">packages_added</span><span class="p">::</span>  
      <span class="s">&quot;</span><span class="si">$($(params)[_sys_servicecmd])</span><span class="s"> </span><span class="si">$($(params)[_sys_apachesrv])</span><span class="s"> graceful&quot;</span> 
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Restarting httpd so it can pick up new modules.&quot;</span><span class="p">;</span>

<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_services_up</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">processes</span><span class="p">:</span>
    <span class="nc">debian</span><span class="p">::</span> 
      <span class="s">&quot;/usr/sbin/mysqld&quot;</span> <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_mysqld&quot;</span><span class="p">;</span>
      <span class="s">&quot;/usr/sbin/apache2&quot;</span>  <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_httpd&quot;</span><span class="p">;</span>
    <span class="nc">redhat</span><span class="p">::</span>
      <span class="s">&quot;^mysqld&quot;</span> <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_mysqld&quot;</span><span class="p">;</span>
      <span class="s">&quot;^httpd&quot;</span>  <span class="kr">restart_class</span> <span class="o">=&gt;</span> <span class="s">&quot;start_httpd&quot;</span><span class="p">;</span>

  <span class="kd">commands</span><span class="p">:</span> 
    <span class="nc">start_mysqld</span><span class="p">::</span>
      <span class="s">&quot;</span><span class="si">$($(params)[_sys_servicecmd])</span><span class="s"> mysql start&quot;</span><span class="p">;</span>

    <span class="nc">start_httpd</span><span class="p">::</span>
      <span class="s">&quot;</span><span class="si">$($(params)[_sys_servicecmd])</span><span class="s"> </span><span class="si">$($(params)[_sys_apachesrv])</span><span class="s"> start&quot;</span> <span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_tarball_is_present</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span> 
      <span class="s">&quot;wordpress_tarball_is_present&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_tarfile])</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">commands</span><span class="p">:</span> 
    <span class="nc">!wordpress_tarball_is_present</span><span class="p">::</span>
      <span class="s">&quot;/usr/bin/wget -q -O </span><span class="si">$($(params)[_tarfile])</span><span class="s"> </span><span class="si">$($(params)[_downloadurl])</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Downloading latest version of WordPress.&quot;</span><span class="p">;</span>

  <span class="kd">reports</span><span class="p">:</span> 
    <span class="nc">wordpress_tarball_is_present</span><span class="p">::</span>
      <span class="s">&quot;WordPress tarball is on disk.&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_tarball_is_unrolled</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span> 
      <span class="s">&quot;wordpress_src_dir_is_present&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_htmlroot])</span><span class="s">/wordpress&quot;</span><span class="p">);</span>
      <span class="s">&quot;wordpress_final_dir_is_present&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_wp_dir])</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">wordpress_final_dir_is_present</span><span class="p">::</span>
      <span class="s">&quot;WordPress directory is present.&quot;</span><span class="p">;</span>

  <span class="kd">commands</span><span class="p">:</span>
    <span class="nc">!wordpress_final_dir_is_present&amp;!wordpress_src_dir_is_present</span><span class="p">::</span> 
      <span class="s">&quot;/bin/tar -xzf </span><span class="si">$($(params)[_tarfile])</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Unrolling wordpress tarball to </span><span class="si">$($(params)[_htmlroot])</span><span class="s">/wordpress.&quot;</span><span class="p">,</span>
        <span class="kr">contain</span> <span class="o">=&gt;</span> <span class="nf">in_dir_shell</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_htmlroot])</span><span class="s">&quot;</span><span class="p">);</span>
    <span class="nc">wordpress_src_dir_is_present&amp;!wordpress_final_dir_is_present</span><span class="p">::</span>
      <span class="s">&quot;/bin/mv </span><span class="si">$($(params)[_htmlroot])</span><span class="s">/wordpress </span><span class="si">$($(params)[_wp_dir])</span><span class="s">&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Rename unrolled directory into its final destination </span><span class="si">$($(params)[_wp_dir])</span><span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_mysql_configuration</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">commands</span><span class="p">:</span>
      <span class="s">&quot;/usr/bin/mysql -u root -e </span><span class="se">\&quot;</span><span class="s"></span>
<span class="s">      CREATE DATABASE IF NOT EXISTS </span><span class="si">$($(params)[DB_NAME])</span><span class="s">;</span>
<span class="s">      GRANT ALL PRIVILEGES ON </span><span class="si">$($(params)[DB_NAME])</span><span class="s">.*</span>
<span class="s">      TO &#39;</span><span class="si">$($(params)[DB_USER])</span><span class="s">&#39;@localhost</span>
<span class="s">      IDENTIFIED BY &#39;</span><span class="si">$($(params)[DB_PASSWORD])</span><span class="s">&#39;;</span>
<span class="s">      FLUSH PRIVILEGES;</span><span class="se">\&quot;</span><span class="s"></span>
<span class="s">&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_config_exists</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">classes</span><span class="p">:</span>
     <span class="s">&quot;wordpress_config_file_exists&quot;</span>  
        <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">fileexists</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_wp_config])</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">files</span><span class="p">:</span>
    <span class="nc">!wordpress_config_file_exists</span><span class="p">::</span>  
      <span class="s">&quot;</span><span class="si">$($(params)[_wp_config])</span><span class="s">&quot;</span>
        <span class="kr">copy_from</span> <span class="o">=&gt;</span> <span class="nf">backup_local_cp</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$($(params)[_wp_cfgsample])</span><span class="s">&quot;</span><span class="p">);</span>

  <span class="kd">reports</span><span class="p">:</span>
    <span class="nc">wordpress_config_file_exists</span><span class="p">::</span>
      <span class="s">&quot;WordPress config file </span><span class="si">$($(params)[_wp_config])</span><span class="s"> is present&quot;</span><span class="p">;</span>
    <span class="nc">!wordpress_config_file_exists</span><span class="p">::</span>
      <span class="s">&quot;WordPress config file </span><span class="si">$($(params)[_wp_config])</span><span class="s"> is not present&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_is_properly_configured</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">allparams</span><span class="p">&quot;</span> <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">getindices</span><span class="p">(</span><span class="s">&quot;</span><span class="si">$(params)</span><span class="s">&quot;</span><span class="p">);</span> 
    <span class="nc">secondpass</span><span class="p">::</span>
      <span class="p">&quot;</span><span class="nv">wpparams</span><span class="p">&quot;</span>  <span class="kt">slist</span> <span class="o">=&gt;</span> <span class="nf">grep</span><span class="p">(</span><span class="s">&quot;[^_].*&quot;</span><span class="p">,</span> <span class="s">&quot;allparams&quot;</span><span class="p">);</span>

  <span class="kd">classes</span><span class="p">:</span>
      <span class="s">&quot;secondpass&quot;</span> <span class="kr">expression</span> <span class="o">=&gt;</span> <span class="nf">isvariable</span><span class="p">(</span><span class="s">&quot;allparams&quot;</span><span class="p">);</span>

  <span class="kd">files</span><span class="p">:</span>
    <span class="s">&quot;</span><span class="si">$($(params)[_wp_config])</span><span class="s">&quot;</span> 
      <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">replace_or_add</span><span class="p">(</span><span class="s">&quot;define</span><span class="se">\(</span><span class="s">&#39;</span><span class="si">$(wpparams)</span><span class="s">&#39;, *(?!&#39;</span><span class="si">$($(params)[$(wpparams)])</span><span class="s">)&#39;.*&quot;</span><span class="p">,</span>
				  <span class="s">&quot;define(&#39;</span><span class="si">$(wpparams)</span><span class="s">&#39;, &#39;</span><span class="si">$($(params)[$(wpparams)])</span><span class="s">&#39;);&quot;</span><span class="p">);</span>
<span class="p">}</span>

<span class="c">#############################################</span>

<span class="c"># This is not included in the standard method sequence called from wp_install because</span>
<span class="c"># it has not been fully tested and is not something everyone would want to do. If</span>
<span class="c"># you want it, add it specifically to your bundlesequence.</span>

<span class="k">bundle</span> <span class="k">agent</span> <span class="nf">wp_allow_http_inbound</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">files</span><span class="p">:</span>
    <span class="nc">redhat</span><span class="p">::</span> <span class="c"># tested on RHEL only, file location may vary based on Linux distro or OS</span>
      <span class="s">&quot;/etc/sysconfig/iptables&quot;</span>
        <span class="kr">edit_line</span> <span class="o">=&gt;</span> <span class="nf">wp_insert_HTTP_allow_rule_before_the_accept_established_tcp_conns_rule</span><span class="p">,</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;insert HTTP allow rule into /etc/sysconfig/iptables&quot;</span><span class="p">,</span>
        <span class="kr">classes</span> <span class="o">=&gt;</span> <span class="nf">if_repaired</span><span class="p">(</span><span class="s">&quot;iptables_edited&quot;</span><span class="p">);</span>

  <span class="kd">commands</span><span class="p">:</span> 
    <span class="nc">iptables_edited</span><span class="p">::</span>
      <span class="s">&quot;/sbin/service iptables restart&quot;</span>
        <span class="kr">comment</span> <span class="o">=&gt;</span> <span class="s">&quot;Restarting iptables to load new config&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">bundle</span> <span class="k">edit_line</span> <span class="nf">wp_insert_HTTP_allow_rule_before_the_accept_established_tcp_conns_rule</span><span class="p">(</span><span class="nv">params</span><span class="p">)</span>
<span class="p">{</span>
  <span class="kd">vars</span><span class="p">:</span>
      <span class="p">&quot;</span><span class="nv">http_rule</span><span class="p">&quot;</span> <span class="kt">string</span> <span class="o">=&gt;</span> <span class="s">&quot;-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT&quot;</span><span class="p">;</span>

  <span class="kd">insert_lines</span><span class="p">:</span>
      <span class="s">&quot;</span><span class="si">$(http_rule)</span><span class="s">&quot;</span>
        <span class="kr">location</span> <span class="o">=&gt;</span> <span class="nf">wp_before_the_accept_established_tcp_conns_rule</span><span class="p">;</span>
<span class="p">}</span>

<span class="k">body</span> <span class="k">location</span> <span class="nf">wp_before_the_accept_established_tcp_conns_rule</span>
<span class="p">{</span>
      <span class="kr">before_after</span> <span class="o">=&gt;</span> <span class="s">&quot;before&quot;</span><span class="p">;</span>
      <span class="kr">first_last</span> <span class="o">=&gt;</span> <span class="s">&quot;first&quot;</span><span class="p">;</span>
      <span class="kr">select_line_matching</span> <span class="o">=&gt;</span> <span class="s">&quot;^-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT.*&quot;</span><span class="p">;</span>
<span class="p">}</span>

<span class="c"># Todo:</span>
<span class="c">#</span>
<span class="c">#</span>
<span class="c"># MySQL:</span>
<span class="c"># - submit a patch to the MySQL folks to add a non-interactive version of /usr/bin/mysql_secure_installation</span>
<span class="c"># - secure mysql instance with a non-interactive version of /usr/bin/mysql_secure_installation once it is available</span>
<span class="c"># - change the root password using /usr/bin/mysqladmin -u root password &#39;new-password&#39;</span>
<span class="c"># - secure mysql instance by: removing the test databases and anonymous user created by default</span>
<span class="c">#</span>
<span class="c"># httpd:</span>
<span class="c"># - instead of hardcoding &quot;/var/www/html&quot;, derive httpd document root on the fly from /etc/httpd/conf/httpd.conf</span>
<span class="c">#   DocumentRoot using Function readstringlist</span>
</pre></div>


{% include codeindex.markdown %}
