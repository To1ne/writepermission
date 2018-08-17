---
layout: post
title: GTD using org-mode on S60 phone
---

## Introduction
I really felt a need for a decend way to organize my TODO lists. The things I need are:
- Accessible from everywhere, even on my Nokia E71 Symbian phone
- Stored centralized, to avoid out-of-sync copies
- A simple file format, so it easily can be opened with a simple text editor

I'm a emacs user and in my search for this setup I ran into `org-mode`, which seemed the perfect solution to me.

## Prerequisites
I've used a <acronym title="Virtual Private Server">VPS</acronym> as server for setting up this environment. It might be possible to do this on a shared host too, but that is not covered in this post.

## Install emacs with org-mode
The most recent versions of `emacs` include `org-mode` by default. So we just have to download and install it.
{% highlight bash %}
mkdir -p /usr/src/emacs
cd /usr/src/emacs
wget http://ftp.gnu.org/gnu/emacs/emacs-23.1.tar.gz
tar -xzf emacs-23.1.tar.gz
cd emacs-23.1
./configure
make
make install
{% endhighlight %}

At my system I got the following error:
{% highlight text %}
makeinfo is missing - cannot build manuals
{%endhighlight%}

To solve this problem provide the option `--without-makeinfo` to the `./configure` command above ([ref](http://osdir.com/ml/wp-forums/2009-08/msg00001.html)).

## Install git
If you want to edit the files in multiple location you might want to use a VCS. I've chosen `git`. To install `git` you can follow the instructions from [my previous post](/2009/09/install-git-on-a-shared-webhost/).

## Create dedicated user
I've chosen to create a dedicated user for my `.org` files. I have baptized this user `org`. This dedicated user allows you to set its home directory on login and tighten its permissions, so when this user gets hacked the hacker can't do much harm.
Run the following commands to add a new user:
{%highlight bash %}
useradd org
passwd org
{%endhighlight%}

## Create and install a SSH key
...

Modify `/etc/passwd`
{%highlight text %}
org:x:500:500::/home/org:/usr/local/bin/emacs
{%endhighlight%}
