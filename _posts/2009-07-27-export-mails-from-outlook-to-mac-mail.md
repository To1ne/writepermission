--- 
wordpress_id: 162
layout: post
title: Export mails from Outlook to Mac Mail
wordpress_url: http://blog.tonotdo.com/?p=162
---
<h3>Problem</h3>
Recently I've bought a new iMac. Real great machine, but I used to be a Windows Vista user, so I needed to export files and settings to Mac. Most of it was no problem, the only problem was: Email. On Windows I did use Microsoft Outlook to access my Hotmail, Gmail and own domain email account.

<!--more-->
Most of you know, Outlook uses <code>.pst</code> files to store the mails locally. But you can't import them directly into Mac Mail. So I needed to export them to a format Mac Mail knows. There are several (paid) tools available to convert Outlook mails to Mac Mail, but I didn't want to pay for a tool I only use once.
<h3>Solution</h3>
Mac Mail support import from <a href="http://www.mozillamessaging.com/en-US/thunderbird/">Mozilla Thunderbird</a>. Thunderbird is a free mail client and works on both Windows and Mac. And the major upside, Thunderbird support import from Outlook. So I ran into an article how to import emails from <a href="http://kb.mozillazine.org/Import_.pst_files">Outlook to Thunderbird</a>. And this is how I did do it:
<ol>
	<li>Install Thunderbird on your Windows machine
(Outlook needs to be running on the machine when you import to Thunderbird)</li>
	<li>Import the messages using Tools -&gt; Import -&gt; Mail.</li>
	<li>Close Thunderbird and copy the <a href="http://kb.mozillazine.org/Profile_folder_-_Thunderbird">Thunderbird Profile directory</a> from
<code>C:\Users\&lt;Windows user name&gt;\AppData\Roaming\Thunderbird\Profiles\&lt;Profile name&gt;\</code>
to your Mac (I used a Windows share to do this)</li>
	<li>Import the Thunderbird files to Mac Mail using File -&gt; Import Mailboxes</li>
</ol>
And now you have a "On my Mac" folder in Mac Mail, where the imported mails are stored.

<h3>Additional</h3>
Recently Hotmail has enabled POP3. So you can easily use this to access your Hotmail accounts via Mac Mail, or any other mail client.
These are the settings (<em>from <a href="http://lifehacker.com/5169684/hotmail-finally-enables-pop3-worldwide">LifeHacker.com</a></em>):
<blockquote><strong>POP server</strong>: pop3.live.com (Port 995)
<strong>POP SSL required</strong>? Yes
<strong>User name</strong>: Your Windows Live ID, for example yourname@hotmail.com
<strong>Password</strong>: The password you usually use to sign in to Hotmail or Windows Live
<strong>SMTP server</strong>: smtp.live.com (Port 25)
<strong>Authentication required</strong>? Yes (this matches your POP username and password)
<strong>TLS/SSL require</strong>d? Yes</blockquote>
