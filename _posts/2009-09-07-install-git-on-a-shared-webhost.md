--- 
wordpress_id: 183
layout: post
title: Install git on a shared webhost
wordpress_url: http://www.writepermission.com/?p=183
---
<h3>Introduction</h3>
Recently I ran into an article about using <a href="http://git-scm.com/">git</a> to upload your site (see links at the bottom how to). But off course, this requires to have <code>git</code> installed on your hosting. My host (via <a href="http://www.turtlehost.be/">TurtleHost.be</a>) does not have it. So I was thinking, why not install it myself. Idea sounded more simple than doing it... .

<!--more-->
<h3>Requirements</h3>
<ul>
   <li>You need to have <a href="http://en.wikipedia.org/wiki/Secure_Shell">    ssh</a> access to your server.</li>
</ul>
<h3>Finding git</h3>
Before we can download <code>git</code>, we need to know which Linux distribution your server is using. This is required so the <code>git</code> executable will be able to use the correct libraries.
To find out which kernel your server is running, log in to your server via ssh and type the command:
<pre lang="bash">cat /etc/*-release</pre>
On my server this returned <code>CentOS release 5.3 (Final)</code>.
Next thing we need to know if your server is running 32bit or 64bit. This we can verify with the command:
<pre lang="bash">uname -p</pre>
<code>x86_64</code> indicates the server has 64bit kernel running. <code>i386 </code>/<code>i486</code>/<code>i586</code>/<code>i686</code> means it is a 32bit kernel.

<h3>Downloading git</h3>
Next we need to download <code>git</code> from somewhere. Probably you can find it by searching it on a RPM repository. I found one on <a href="http://rpm.pbone.net/">rpm.pbone.net</a> . This site has a great search engine where you can find <code>git</code> version for your server distro.
After finding a download link, again log in to your server via ssh and type the following commands:
<pre lang="bash">mkdir ~/git-download
cd ~/git-download
wget ftp://the.download.link/of/repo/containing/git-1.6.x.x.rpm</pre>
Now you have the <code>.rpm</code> on your server.

<h3>Installing git</h3>This <code>rpm</code> needs to be installed, but you won't be able to use the regular <code>rpm</code> installer because this requires root access.
You can extract the <code>rpm</code> file with the command:
<pre lang="bash">rpm2cpio git-1.6.x.x.rpm | cpio -imdv </pre>
This will create a <code>usr/</code> directory in currect directory. You best move this directory to your home root:<pre lang="bash">mv usr ~/usr</pre>
Now we are almost there, we only need to add the directory to <code>$PATH </code> variable. Doing this will make it possible to execute the command <code>git</code> from anywhere.
Open your <code>~/.bashrc</code> file with your favorite editor (<code>vim</code> or <code>pico</code>) and add the following line:
<pre lang="bash">export PATH=$PATH:$HOME/usr/bin:$HOME/usr/libexec/git-core</pre>
And that's it. To activate this change, run <code>source ~/.bashrc</code> or log out and in again.

<h3>Note</h3>
You can use <code>git</code> just by typing the <code>git</code> command. But <code>git init</code> might give a warning:
<pre lang="text">warning: templates not found /usr/share/git-core/templates</pre>
To avoid this warning I've added an alias to <code>~/.bashrc</code>:
<pre lang="bash">alias git-init='git init --template=$HOME/usr/share/git-core/templates'</pre>
This <code>git-init</code> command is an alternative to <code>git init</code> and will take the correct path for templates.

<h3>Possible problems</h3>
One problem caused me a headache when using <code>git</code> to upload my site was het error:
<pre lang="text">git: 'index-pack' is not a git-command.</pre>
The reason for this problem was that <code>$HOME/usr/libexec/git-core</code> was not added to the <code>$PATH</code> variable.

<h3>Further reading</h3>
So now you have <code>git</code> up and running on your server and you can use it to upload your site. Read about it:
<ul>
   <li><a href="http://www.wolfslittlestore.be/2009/06/websites-updaten-met-git/">Websites updaten met git</a> - in Dutch</li>
   <li><a href="http://toroid.org/ams/git-website-howto">Using Git to manage a web site</a> - original article in English</li>
</ul>
