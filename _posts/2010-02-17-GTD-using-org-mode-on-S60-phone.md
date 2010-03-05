--- 
layout: post
title: GTD using org-mode on S60 phone
---
## Aim
The aim of this post is setting up a system for <acronym title="Getting Things Done">GTD</acronym> on a S60 mobile phone. For this setup we'll use `emacs org-mode`.

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