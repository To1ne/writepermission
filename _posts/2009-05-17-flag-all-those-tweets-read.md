--- 
wordpress_id: 111
layout: post
title: Flag All Those Tweets Read
wordpress_url: http://blog.tonotdo.com/?p=111
---
<h3>Problem</h3>
Every time I switched between Twitter client (client at work, client at home, client on mobile phone) I lost track of which tweets I've read. Although it's not required to read all tweets (see <a href="http://www.twitterisntemail.com/">Twitter isn't email</a>), but I like to do it.
I've been thinking for a solution to this problem and I think I've found one.

<!--more-->

<h3>Solution</h3>
I've created a new Twitter account <a href="http://twitter.com/fattr">@fattr</a>. <strong>fattr</strong> is an acronym for "<strong>F</strong>lag <strong>A</strong>ll <strong>T</strong>hose <strong>T</strong>weets <strong>R</strong>ead". The idea was: Send a direct message to @fattr to flag all current Tweets read. So all tweets received <strong>after</strong> sending the DM are <strong>new</strong>.
<img alt="" src="http://fattr.tonotdo.com/img/logo.png" title="FATTR logo" class="aligncenter" width="200" height="200" />

<h3>Realization</h3>
Using the <a href="http://classes.verkoyen.eu/twitter/">PHP Twitter</a> library of <a href="http://blog.verkoyen.eu/">Tijs Verkoyen</a> @fattr will follow you back within 10 minutes. This is required to send DMs.
The same library will make it possible to log in at <a href="http://fattr.tonotdo.com">website</a> to read new tweets.

<h3>Future work</h3>
I really need to improve the code of the project and work on the page design. And I would like to promote use of this <a href="http://twitter.com/fattr">@fattr</a> idea to Twitter client authors. So on every client you would be able to read new tweets, even if they are tagged by another client/location.
