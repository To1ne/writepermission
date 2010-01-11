--- 
layout: post
title: Export mails from Outlook to Mac Mail
wordpress_id: 162
wordpress_url: http://blog.tonotdo.com/?p=162
---
## Problem
Recently I've bought a new iMac. Real great machine, but I used to be a Windows Vista user, so I needed to export files and settings to Mac. Most of it was no problem, the only problem was: Email. On Windows I did use Microsoft Outlook to access my Hotmail, Gmail and own domain email account.

Most of you know, Outlook uses `.pst` files to store the mails locally. But you can't import them directly into Mac Mail. So I needed to export them to a format Mac Mail knows. There are several (paid) tools available to convert Outlook mails to Mac Mail, but I didn't want to pay for a tool I only use once.

## Solution
Mac Mail support import from [Mozilla Thunderbird](http://www.mozillamessaging.com/en-US/thunderbird/). Thunderbird is a free mail client and works on both Windows and Mac. And the major upside, Thunderbird support import from Outlook. So I ran into an article how to import emails from [Outlook to Thunderbird](http://kb.mozillazine.org/Import_.pst_files). And this is how I did do it:

1. Install Thunderbird on your Windows machine
(Outlook needs to be running on the machine when you import to Thunderbird)
1. Import the messages using Tools -> Import -> Mail.
1. Close Thunderbird and copy the [Thunderbird Profile directory](http://kb.mozillazine.org/Profile_folder_-_Thunderbird) from
`C:\Users\<Windows user name>\AppData\Roaming\Thunderbird\Profiles\<Profile name>\`
to your Mac (I used a Windows shared folder to do this)
1. Import the Thunderbird files to Mac Mail using File -&gt; Import Mailboxes

And now you have a "On my Mac" folder in Mac Mail, where the imported mails are stored.

## Additional
Recently Hotmail has enabled POP3. So you can easily use this to access your Hotmail accounts via Mac Mail, or any other mail client.
These are the settings (*from [LifeHacker.com](http://lifehacker.com/5169684/hotmail-finally-enables-pop3-worldwide)*):

> **POP server**: pop3.live.com (Port 995)
>
> **POP SSL required**? Yes
>
> **User name**: Your Windows Live ID, for example yourname@hotmail.com
>
> **Password**: The password you usually use to sign in to Hotmail or Windows Live
>
> **SMTP server**: smtp.live.com (Port 25)
>
> **Authentication required**? Yes (this matches your POP username and password)
>
> **TLS/SSL require**d? Yes
