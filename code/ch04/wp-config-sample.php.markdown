---
layout: cf-learn
title: Learning CFEngine 3
pageurl: /code/ch04/wp-config-sample.php.html
posttitle: Code > Chapter 4 > wp-config-sample.php
navsection: code
---

[(download this file)](https://raw.github.com/zzamboni/cf-learn.info/master/src/ch04/wp-config-sample.php)

<div class="highlight"><pre><span class="cp">&lt;?php</span>
<span class="sd">/**</span>
<span class="sd"> * The base configurations of the WordPress.</span>
<span class="sd"> *</span>
<span class="sd"> * This file has the following configurations: MySQL settings, Table Prefix,</span>
<span class="sd"> * Secret Keys, WordPress Language, and ABSPATH. You can find more information</span>
<span class="sd"> * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing</span>
<span class="sd"> * wp-config.php} Codex page. You can get the MySQL settings from your web host.</span>
<span class="sd"> *</span>
<span class="sd"> * This file is used by the wp-config.php creation script during the</span>
<span class="sd"> * installation. You don&#39;t have to use the web site, you can just copy this file</span>
<span class="sd"> * to &quot;wp-config.php&quot; and fill in the values.</span>
<span class="sd"> *</span>
<span class="sd"> * @package WordPress</span>
<span class="sd"> */</span>

<span class="c1">// ** MySQL settings - You can get this info from your web host ** //</span>
<span class="sd">/** The name of the database for WordPress */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_NAME&#39;</span><span class="p">,</span> <span class="s1">&#39;database_name_here&#39;</span><span class="p">);</span>

<span class="sd">/** MySQL database username */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_USER&#39;</span><span class="p">,</span> <span class="s1">&#39;username_here&#39;</span><span class="p">);</span>

<span class="sd">/** MySQL database password */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_PASSWORD&#39;</span><span class="p">,</span> <span class="s1">&#39;password_here&#39;</span><span class="p">);</span>

<span class="sd">/** MySQL hostname */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_HOST&#39;</span><span class="p">,</span> <span class="s1">&#39;localhost&#39;</span><span class="p">);</span>

<span class="sd">/** Database Charset to use in creating database tables. */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_CHARSET&#39;</span><span class="p">,</span> <span class="s1">&#39;utf8&#39;</span><span class="p">);</span>

<span class="sd">/** The Database Collate type. Don&#39;t change this if in doubt. */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;DB_COLLATE&#39;</span><span class="p">,</span> <span class="s1">&#39;&#39;</span><span class="p">);</span>

<span class="sd">/**#@+</span>
<span class="sd"> * Authentication Unique Keys and Salts.</span>
<span class="sd"> *</span>
<span class="sd"> * Change these to different unique phrases!</span>
<span class="sd"> * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}</span>
<span class="sd"> * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.</span>
<span class="sd"> *</span>
<span class="sd"> * @since 2.6.0</span>
<span class="sd"> */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;AUTH_KEY&#39;</span><span class="p">,</span>         <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;SECURE_AUTH_KEY&#39;</span><span class="p">,</span>  <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;LOGGED_IN_KEY&#39;</span><span class="p">,</span>    <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;NONCE_KEY&#39;</span><span class="p">,</span>        <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;AUTH_SALT&#39;</span><span class="p">,</span>        <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;SECURE_AUTH_SALT&#39;</span><span class="p">,</span> <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;LOGGED_IN_SALT&#39;</span><span class="p">,</span>   <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;NONCE_SALT&#39;</span><span class="p">,</span>       <span class="s1">&#39;put your unique phrase here&#39;</span><span class="p">);</span>

<span class="sd">/**#@-*/</span>

<span class="sd">/**</span>
<span class="sd"> * WordPress Database Table prefix.</span>
<span class="sd"> *</span>
<span class="sd"> * You can have multiple installations in one database if you give each a unique</span>
<span class="sd"> * prefix. Only numbers, letters, and underscores please!</span>
<span class="sd"> */</span>
<span class="nv">$table_prefix</span>  <span class="o">=</span> <span class="s1">&#39;wp_&#39;</span><span class="p">;</span>

<span class="sd">/**</span>
<span class="sd"> * WordPress Localized Language, defaults to English.</span>
<span class="sd"> *</span>
<span class="sd"> * Change this to localize WordPress.  A corresponding MO file for the chosen</span>
<span class="sd"> * language must be installed to wp-content/languages. For example, install</span>
<span class="sd"> * de.mo to wp-content/languages and set WPLANG to &#39;de&#39; to enable German</span>
<span class="sd"> * language support.</span>
<span class="sd"> */</span>
<span class="nb">define</span> <span class="p">(</span><span class="s1">&#39;WPLANG&#39;</span><span class="p">,</span> <span class="s1">&#39;&#39;</span><span class="p">);</span>

<span class="sd">/**</span>
<span class="sd"> * For developers: WordPress debugging mode.</span>
<span class="sd"> *</span>
<span class="sd"> * Change this to true to enable the display of notices during development.</span>
<span class="sd"> * It is strongly recommended that plugin and theme developers use WP_DEBUG</span>
<span class="sd"> * in their development environments.</span>
<span class="sd"> */</span>
<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;WP_DEBUG&#39;</span><span class="p">,</span> <span class="k">false</span><span class="p">);</span>

<span class="cm">/* That&#39;s all, stop editing! Happy blogging. */</span>

<span class="sd">/** Absolute path to the WordPress directory. */</span>
<span class="k">if</span> <span class="p">(</span> <span class="o">!</span><span class="nb">defined</span><span class="p">(</span><span class="s1">&#39;ABSPATH&#39;</span><span class="p">)</span> <span class="p">)</span>
	<span class="nb">define</span><span class="p">(</span><span class="s1">&#39;ABSPATH&#39;</span><span class="p">,</span> <span class="nb">dirname</span><span class="p">(</span><span class="k">__FILE__</span><span class="p">)</span> <span class="o">.</span> <span class="s1">&#39;/&#39;</span><span class="p">);</span>

<span class="sd">/** Sets up WordPress vars and included files. */</span>
<span class="k">require_once</span><span class="p">(</span><span class="nx">ABSPATH</span> <span class="o">.</span> <span class="s1">&#39;wp-settings.php&#39;</span><span class="p">);</span>
</pre></div>


----

{% include codeindex.markdown %}
