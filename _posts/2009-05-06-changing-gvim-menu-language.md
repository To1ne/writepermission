--- 
layout: post
title: Change the gVim menu language
wordpress_id: 74
wordpress_url: http://blog.tonotdo.com/?p=74
---

## Problem
I wanted to try gVim (Vim on Windows with a GUI) on my Vista machine. So I've downloaded the [installer](http://www.vim.org/download.php#pc) from the [website](http://www.vim.org/) and ran it. Everything OK so far. But when I started it, it seems the menu's are in Dutch. I **really** hate that, because I use all software in English (and the Dutch translations in gVim, as in many other apps, really suck).
But it took me some time to find out how to change it. But I've found a way.

## Solution
Add the following lines at the top of the file `%PROGRAM_FILES%/Vim/_vimrc`.

    lang en
    language mes en
    set langmenu=en_US.UTF-8

That's it, just restart and everything should be in English.

## Additional:
To modify the window size, add:

    winsize 200 50

Enjoy your Vimming...
