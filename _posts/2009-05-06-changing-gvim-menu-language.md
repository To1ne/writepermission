--- 
wordpress_id: 74
layout: post
title: Change the gVim menu language
wordpress_url: http://blog.tonotdo.com/?p=74
---
<h3>Problem</h3>
I wanted to try gVim (Vim on Windows with a GUI) on my Vista machine. So I've downloaded the <a href="http://www.vim.org/download.php#pc">installer</a> from the <a href="http://www.vim.org/">website </a>and ran it. Everything OK so far. But when I started it, it seems the menu's are in Dutch. I <strong>really</strong> hate that, because I use all software in English (and the Dutch translations in gVim, as in many other apps, really suck).
But it took me some time to find out how to change it. But I've found a way.

<!--more-->

<h3>Solution</h3>
Add the following lines at the top of the file <code>%PROGRAM_FILES%/Vim/_vimrc</code>.
<pre lang="text">
lang en
language mes en
set langmenu=en_US.UTF-8
</pre>

That's it, just restart and everything should be in English.

<h3>Additional:</h3>
To modify the window size, add:
<pre lang="text">
winsize 200 50
</pre>

Enjoy your Vimming...
