---
layout: post
title: My perfect emacs org-mode setup
---

## Introduction
I really had a need for a decend way to organize my TODO items. I really wanted 1 sole solution that would suit the following requirements:
- Accessible from anywhere and stored centralized, to avoid out-of-sync copies
- Possible to read/edit from any device, including my Nokia E71 Symbian phone
- A simple file format, so it easily can be opened with a simple text editor

I've investigated some online solutions but none of them suited me right.
Until I ran into `org-mode` for `emacs`. It really looked powerful and filled my needs described above.


### Org-mode
Well, I've chosen `org-mode` for `emacs`. So it isn't really a editor of its own, it's a "addon" for `emacs`. I don't know if you know about `emacs` but it is an editor developed in the mid-70s. So it is an "old" editor, but a very rich one. It doesn't look like it is, but I can ensure you under the hood it is.


## Prerequisites
For my `org-mode` I'm using my <acronym title="Virtual Private Server">VPS</acronym> for this environment. It might be possible to do this on a shared host too, but that is not covered in this post.


## Installation
The most recent versions of `emacs` include `org-mode` by default. So download and install `emacs` would provide `org-mode' too.
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

### Drawbacks
I encountered the following problems:
{% highlight text %}
configure: error: no acceptable C compiler found in $PATH
{%endhighlight%}

This means the development tools are not installed on your system. You
can install them with the command:
{%highlight bash %}
yum groupinstall 'Development Tools'
{%endhighlight%}

The next error I got when I was running `./configure` was:
{% highlight text %}
configure: error: You seem to be running X, but no X development libraries
were found.  You should install the relevant development files for X
and for the toolkit you want, such as Gtk+, Lesstif or Motif.  Also make
sure you have development files for image handling, i.e.
tiff, gif, jpeg, png and xpm.
If you are sure you want Emacs compiled without X window support, pass
  --without-x
to configure.
{%endhighlight%}
The solution for this is quite self-explaniotary, just pass
`--without-x` to the configure-script.

Another thing I ran into was:
{% highlight text %}
makeinfo is missing - cannot build manuals
{%endhighlight%}
To solve this problem append `--without-makeinfo` to the `./configure` command above and run the following commands again ([ref](http://osdir.com/ml/wp-forums/2009-08/msg00001.html)).


## Create dedicated user
I've chosen to create a dedicated user for my `.org` files. I have baptized this user `org`. This dedicated user allows you to set its start directory on login and tighten its permissions, so when this user gets hacked the hacker can't do much harm.
To add a new user run the following commands:
{%highlight bash %}
useradd org
passwd org
{%endhighlight%}

### Customize user settings
It's useful to add your personal `ssh` public key to the `~/.ssh/authorized_keys` file on the server. This allows quicker and faster login.

Next thing I've done is making `emacs` start automatically when the user logs in. Therefore you'll have to modify the `/etc/passwd` file to something like this:
{%highlight text %}
org:x:500:500::/home/org:/usr/local/bin/emacs
{%endhighlight%}
But you might want to wait with this, because you need to configure other settings first.

## Dropbox
We need to install DropBox without gnome, do this with the commands:
{%highlight bash %}
mkdir -p /tmp/dropbox
cd /tmp/dropbox
wget http://www.getdropbox.com/download?plat=lnx.x86
tar -xzf dropbox-lnx.x86-*.tar.gz
mv .dropbox-dist/ $HOME
{%endhighlight%}

You can start the DropBox daemon with the command
`~/.dropbox-dist/dropboxd`. You should ensure the daemon is started on
every boot, therefore

yum  install nautilus

log in to the webpage
This client is not linked to any account...
Please visit https://www.dropbox.com/cli_link?host_id=ff6921fc2f3ca85517c222b07b7aa809 to link this machine.


## Version control
In my setup I use `git` to keep history of my `.org` files. This allows you to work locally on the `.org` files, and `push` them to the server when you're done.
My server is a CentOs machine, and I've installed `git` with the command:
{%highlight text %}
yum install git
{%endhighlight%}
But if you want to install `git` on a shared host, you can follow the instructions from [my previous post](/2009/09/install-git-on-a-shared-webhost/).


## MagicKey
volume up to control: 162 to 22
volume down to esc: 163 to 4
mute to tab: 242 to 2

# TODO
fix ssh public key for root (nothing to do with this)
make the dropbox directory accesible for org user
