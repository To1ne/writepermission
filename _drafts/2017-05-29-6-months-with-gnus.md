---
layout: post
title: 6 months with Gnus
---

_If you want to skip to the part about Gnus itself, [click here](#the-good)_

## Gnus?

Before I get started, let me tell you what Gnus is.

This is what the [about page](http://gnus.org/about.html) says about Gnus:

> Gnus is a flexible message reader running under GNU Emacs. It supports reading
> and composing both news and mail. In addition, it is able to use a number of
> web-based sources as inputs for its groups.

So basically, it's a mail client in GNU Emacs. Or at least, that is how I use
Gnus.

## Why?

Well, as you might know, I am an avid Emacs user. So being able to read my email
inside Emacs, would make me feel at home.

There are actually a number of email clients for Emacs, amongst them being:

- [WanderLust](https://github.com/wanderlust/wanderlust)
- [Mew](http://www.mew.org/en/)
- [NotMuch](https://notmuchmail.org/)
- [mu4e](http://www.djcbsoftware.nl/code/mu/mu4e.html)

So, why did I choose Gnus?

Well, to be honest I didn't try the alternatives. I choose Gnus because many
people in the Emacs community use Gnus
([John Wiegley](https://twitter.com/jwiegley),
[Sacha Chua](https://twitter.com/sachac), and many others). So I assumed "If
they say it's good, I'll trust them on that."

## The setup

So how does it work?

Well, my setup (which I also inspired by the more experienced Emacs users)
consists of mbsync and Dovecot.

[mbsync](http://isync.sourceforge.net/mbsync.html) is a tool that synchronizes
IMAP4 and Maildir mailboxes. So what it does, the downloads all my email to my
local filesystem.

[Dovecot](https://dovecot.org/) is an IMAP server that I run locally which reads
the Maildir from my filesystem and serves them locally. Gnus in Emacs connects
to this local IMAP server.

[mbsync-el](https://github.com/dimitri/mbsync-el) is a little Emacs package I
use to trigger the synchronization between my online email account and my local
filesystem.

## The good
