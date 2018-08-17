---
layout: post
title: Install git on a shared webhost
wordpress_id: 183
wordpress_url: http://www.writepermission.com/?p=183
redirect_from: /2009/09/install-git-on-a-shared-webhost
---

## Introduction
Recently I ran into an article about using [git](http://git-scm.com/) to upload your site (see links at the bottom how to). But off course, this requires to have `git` installed on your hosting. My host (via [TurtleHost.be](http://www.turtlehost.be/)) does not have it. So I was thinking, why not install it myself. Idea sounded more simple than doing it... .

## Requirements
- You need to have [ssh](http://en.wikipedia.org/wiki/Secure_Shell) access to your server.

## Finding git
Before we can download `git`, we need to know which Linux distribution your server is using. This is required so the `git` executable will be able to use the correct libraries.
To find out which kernel your server is running, log in to your server via ssh and type the command:
{% highlight bash %}
cat /etc/*-release
{% endhighlight %}

On my server this returned `CentOS release 5.3 (Final)`.
Next thing we need to know if your server is running 32bit or 64bit. This we can verify with the command:
{% highlight bash %}
uname -p
{% endhighlight %}
`x86_64` indicates the server has 64bit kernel running. `i386`/`i486`/`i586`/`i686` means it is a 32bit kernel.

## Downloading git
Next we need to download `git` from somewhere. Probably you can find it by searching it on a RPM repository. I found one on [rpm.pbone.net](http://rpm.pbone.net/). This site has a great search engine where you can find `git` version for your server distro.
After finding a download link, again log in to your server via ssh and type the following commands:
{% highlight bash %}
mkdir ~/git-download
cd ~/git-download
wget ftp://the.download.link/of/repo/containing/git-1.6.x.x.rpm
{% endhighlight %}
Now you have the `.rpm` on your server.

## Installing git
This `rpm` needs to be installed, but you won't be able to use the regular `rpm` installer because this requires root access.
You can extract the `rpm` file with the command:
{% highlight bash %}
rpm2cpio git-1.6.x.x.rpm | cpio -imdv
{% endhighlight %}

This will create a `usr/` directory in currect directory. You best move this directory to your home root:
{% highlight bash %}
mv usr ~/usr
{% endhighlight %}

Now we are almost there, we only need to add the directory to `$PATH` variable. Doing this will make it possible to execute the command `git` from anywhere.
Open your `~/.bashrc` file with your favorite editor (`vim` or `pico`) and add the following line:
{% highlight bash %}
export PATH=$PATH:$HOME/usr/bin:$HOME/usr/libexec/git-core
{% endhighlight %}
And that's it. To activate this change, run `source ~/.bashrc` or log out and in again.

## Note
You can use `git` just by typing the `git` command. But `git init` might give a warning:

    warning: templates not found /usr/share/git-core/templates

To avoid this warning I've added an alias to `~/.bashrc`:
{% highlight bash %}
alias git-init='git init --template=$HOME/usr/share/git-core/templates'
{% endhighlight %}
This `git-init` command is an alternative to `git init` and will take the correct path for templates.

## Possible problems
One problem caused me a headache when using `git` to upload my site was het error:

    git: 'index-pack' is not a git-command.
The reason for this problem was that `$HOME/usr/libexec/git-core` was not added to the `$PATH` variable.

## Further reading
So now you have `git` up and running on your server and you can use it to upload your site. Read about it:

- [Websites updaten met git](http://www.wolfslittlestore.be/2009/06/websites-updaten-met-git/) - in Dutch
- [Using Git to manage a web site](http://toroid.org/ams/git-website-howto) - original article in English
