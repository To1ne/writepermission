---
layout: post
title: Flag All Those Tweets Read
wordpress_id: 111
wordpress_url: http://blog.tonotdo.com/?p=111
redirect_from: /2009/05/flag-all-those-tweets-read/
---

## Problem
Every time I switched between Twitter client (client at work, client at home, client on mobile phone) I lost track of which tweets I've read. Although it's not required to read all tweets (see [Twitter isn't email](http://www.twitterisntemail.com/)), but I like to do it.
I've been thinking for a solution to this problem and I think I've found one.

## Solution
I've created a new Twitter account [@fattr](http://twitter.com/fattr). **fattr** is an acronym for "**F**lag **A**ll **T**hose **T**weets **R**ead". The idea was: Send a direct message to @fattr to flag all current Tweets read. So all tweets received **after** sending the DM are **new**.

![FATTR logo](http://fattr.tonotdo.com/img/logo.png)

## Realization
Using the [PHP Twitter](http://classes.verkoyen.eu/twitter/) library of [Tijs Verkoyen](http://blog.verkoyen.eu/) @fattr will follow you back within 10 minutes. This is required to send DMs.
The same library will make it possible to log in at [website](http://fattr.tonotdo.com) to read new tweets.

## Future work
I really need to improve the code of the project and work on the page design. And I would like to promote use of this [@fattr](http://twitter.com/fattr) idea to Twitter client authors. So on every client you would be able to read new tweets, even if they are tagged by another client/location.
