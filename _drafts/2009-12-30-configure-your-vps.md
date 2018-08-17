---
layout: post
title: Configure your VPS
wordpress_id: 286
wordpress_url: http://blog.writepermission.com/?p=286
---

## Preparation
Let's start with some basic preparation.

- Install additional GPG keys:
	{%highlight bash %}
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
rpm --import http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
{% endhighlight %}

- Install `rpmforge-release` package:
	{% highlight bash %}
rpm --install http://apt.sw.be/redhat/el5/en/i386/RPMS.dag/rpmforge-release-0.3.6-1.el5.rf.i386.rpm
{% endhighlight %}

- Install updates:
	{% highlight bash %}
yum update
{% endhighlight %}

- Install ssh authorized key for faster login via `ssh`:
	{% highlight bash %}
mkdir -p ~/.ssh
ssh-copy-id -i .ssh/id_rsa.pub root@yourdomainname.tld
{% endhighlight %}


## Test tools
Later on we'll use some tools to modify configurations and run tests, so we install those too:

- Install a command line text editor, `vim` can be installed using `yum`:
	{% highlight bash %}
yum install vim-minimal vim-common vim-enhanced
{% endhighlight %}

- ... or you can build `emacs` yourself:
	{% highlight bash %}
 mkdir -p /usr/src/emacs
cd /usr/src/emacs
wget http://ftp.gnu.org/gnu/emacs/emacs-22.3.tar.gz
tar -xzf emacs-22.3.tar.gz
cd emacs-22.3
./configure
make
make test
make install
{% endhighlight %}

=
- Install telnet (used to test later on):
	{% highlight bash %}
yum install telnet
{% endhighlight %}

- Install links (command line browser):
	{% highlight bash %}
yum install links
{% endhighlight %}


## Optional tools
I've installed the following tools too. These are not required, but might be useful some day.
- Install and activate `zsh`:
	{% highlight bash %}
yum install zsh
ln -sf /bin/zsh /bin/sh
{% endhighlight %}

- Install `git`:
	{% highlight bash %}
yum install git
{% endhighlight %}

- Install `oh-my-zsh`:
	{% highlight bash %}
wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
{% endhighlight %}


## Basic settings
Next we apply some basic settings:

- Make sure `/etc/hosts` contains the following line:
	{% highlight text %}
127.0.0.1 yourdomainname.tld localhost localhost.localdomain
{% endhighlight %}

- Adjust `/etc/sysconfig/network` so looks like this:
	{% highlight text %}
NETWORKING="yes"
HOSTNAME="yourdomainname.tld"
GATEWAY="216.66.76.1"
{% endhighlight %}

- Get additional yum repositories:
	{% highlight bash %}
wget http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm
{% endhighlight %}

Do a `reboot` to apply the host changes.

## Apache, PHP, MySQL, phpMyAdmin
Install these packages with the following command:
{% highlight bash %}
yum install httpd mysql-server php php-mysql php-mbstring phpmyadmin
{% endhighlight %}

To enable `ModRewrite` with `.htaccess` (for user-friendly URLs):
{% highlight bash %}
a2enmod rewrite
{% endhighlight %}
TODO werkt niet

## Configure MySQL & phpMyAdmin
Start MySQL:
{% highlight bash %}
chkconfig --levels 235 mysqld on
/etc/init.d/mysqld start
{% endhighlight %}

Set the MySQL root password:
{% highlight bash %}
mysqladmin -u root password yourrootsqlpassword
{% endhighlight %}

Configure phpMyAdmin so Apache allows connections not just from localhost. To do this, open `/etc/httpd/conf.d/phpMyAdmin.conf` and comment out the following lines:
{% highlight text %}
...
#<Directory /usr/share/phpMyAdmin/>
#   order deny,allow
#   deny from all
#   allow from 127.0.0.1
#</Directory>
...
{% endhighlight %}

Possibly you need to change the authentication from `cookie` to `http` in `/usr/share/phpmyadmin/config.inc.php`:
{% highlight text %}
...
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'http';
...
{% endhighlight %}

And finally create system startup links for Apache and start it:
{% highlight bash %}
chkconfig --levels 235 httpd on
/etc/init.d/httpd start
{% endhighlight %}

## FTP server
To install a FTP server daemon, run the command:
{% highlight bash %}
yum install pure-ftpd
{% endhighlight %}

And make sure it starts automatically:
{% highlight bash %}
chkconfig --levels 235 pure-ftpd on
/etc/init.d/pure-ftpd start
{% endhighlight %}

## Mail server
First we need to install and configure postfix:
{% highlight bash %}
yum remove sendmail
yum install postfix dovecot
{% endhighlight %}

This removes sendmail, because we use postfix instead.
Edit `/etc/postfix/main.cf` like this:
{% highlight text %}
myhost = mail.yourdomainname.tld
mydomain = yourdomainname.tld
myorigin = $mydomain
inet_interfaces = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
{% endhighlight %}
TODO add the postconf -e command

All the lines are already in the file you just need to uncomment them and edit `yourdomainname`.

If you want to use SMTP on a port other than 25 (I've used 26) modify `/etc/postfix/master.cf`:
{% highlight text %}
#smtp      inet n       -       n       -       -       smtpd
26         inet n       -       n       -       -       smtpd
{% endhighlight %}

Next we install SASL:
{% highlight bash %}
yum install cyrus-sasl
{% endhighlight %}

Enable it by added the following lines to `/etc/postfix/main.cf`:
{% highlight text %}
# SASL SETTINGS
#
# Enable authentication
smtpd_sasl_auth_enable = yes
# Set recipient restrictions
smtpd_recipient_restrictions = permit_mynetworks,permit_sasl_authenticated,reject_unauth_destination
#
# Disable anonymous authentication
smtpd_sasl_security_options = noanonymous
#
# Set the SASL type to dovecot
smtpd_sasl_type = dovecot
#
# Set the SASL path
smtpd_sasl_path = private/auth
{% endhighlight %}

To reload these setting, type:
{% highlight bash %}
postfix reload
{% endhighlight %}

Last of three, install dovecot:
{% highlight bash %}
yum install dovecot
{% endhighlight %}

Open `/etc/dovecot.conf` and the following is uncommented and modified
{% highlight text %}
protocols = imap imaps pop3 pop3s
auth default {
mechanisms = plain login
passdb pam {
}
userdb passwd {
}
socket listen {
client {
path = /var/spool/postfix/private/auth
mode = 0660
user = postfix
group = postfix
}
}
}
{% endhighlight %}

**Note:** Be careful with the braces.

Now just start them:
{% highlight bash %}
chkconfig --level 235 saslauthd on
/etc/init.d/saslauthd start
chkconfig --levels 235 postfix on
/etc/init.d/postfix start
chkconfig --levels 235 dovecot on
/etc/init.d/dovecot start
{% endhighlight %}

## Webmail: RoundCube
Many people use SquirrelMail, but I prefer [RoundCube](http://roundcube.net/). To install it, follow these instructions:
Get the link from the [Download page](http://roundcube.net/download) and type:
{% highlight bash %}
cd /tmp
wget https://sourceforge.net/projects/roundcubemail/files/roundcubemail/0.3-stable/roundcubemail-0.3-stable.tar.gz/download
tar -xzf roundcubemail-0.3-stable.tar.gz
mv roundcubemail-0.3-stable /usr/share/roundcube
{% endhighlight %}

This will download it and install it to `/usr/share/roundcube`.

Next configure Apache. Create a new file `/etc/httpd/conf.d/roundcube.conf` and place in this code:
{% highlight text %}
Alias /roundcube /usr/share/roundcube
Alias /roundCube /usr/share/roundcube
{% endhighlight %}

And restart Apache:
{% highlight bash %}
/etc/init.d/httpd restart
{% endhighlight %}

Apply correct rights to the subdirectories `temp` and `logs`:
{% highlight bash %}
chown apache:apache /usr/share/roundcube/temp /usr/share/roundcube/logs
chmod 700 /usr/share/roundcube/temp /usr/share/roundcube/logs
{% endhighlight %}

Configure the database:
{% highlight bash %}
mysql --user=root --password=yourrootsqlpassword
CREATE DATABASE roundcubemail;
GRANT ALL PRIVILEGES ON roundcubemail.* TO roundcube@localhost IDENTIFIED BY 'yourroundcubepass';
FLUSH PRIVILEGES;
{% endhighlight %}

Then start the RoundCube installer by browsing to `http://yourdomain.tld/roundcube/installer`.
On the first page, see if everything is OK, and go to next if it is.
On the next page apply the settings you like and fill in the correct database credentials.
After doing this, you'll have to save these settings to the files `/usr/share/roundcube/config/main.inc.php` `/usr/share/roundcube/config/db.inc.php`.
On the last page you can test everything - probably you'll need to push "Initialize database".

After doing this, try to login via `http://yourdomain.tld/roundcube`. If everything works disable the installer:
{% highlight bash %}
mv /usr/share/roundcube/installer /usr/share/roundcube/.installer
chmod 000 /usr/share/roundcube/.installer
{% endhighlight %}

MORE TODO
install extensions:
{% highlight bash %}
yum install php-pecl-fileinfo php-dom php-gd
{% endhighlight %}

add to `/etc/php.ini`
{% highlight text %}
extension=fileinfo.so
extension=domxml.so
extension=gd.so
extension=mcrypt.so


date.timezone = “Europe/Brussels”


rpm --import http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka    --> php 5.2+


vim /etc/yum.repos.d/utterramblings.repo

add >
[utterramblings]
name=Jason's Utter Ramblings Repo
baseurl=http://www.jasonlitka.com/media/EL$releasever/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka

{% endhighlight %}

## Sources
http://www.jasonlitka.com/yum-repository/
- [The Perfect Server - CentOS 5.3 x86_64 \[ISPConfig 3\]](http://www.howtoforge.com/perfect-server-centos-5.3-x86_64-ispconfig-3)</a>
- [The Perfect Setup - CentOS 4.3 (64-bit)](http://www.howtoforge.com/perfect_setup_centos_4.3)
- [Quick Linux Server Installation](http://www.mysql-apache-php.com/)
- [Installing PHP 5.2.x or 5.3.x on RedHat ES5, CentOS 5, etc](http://bluhaloit.wordpress.com/2008/03/13/installing-php-52x-on-redhat-es5-centos-5-etc/)
- [Setup Postfix/Dovecot MailServer for Centos/RHEL](http://corpocrat.com/2008/07/10/setup-postfixdovecot-mailserver-for-centosrhel/)
- [SMTP Authentication for Mail clients](http://postfix.state-of-mind.de/patrick.koetter/smtpauth/smtp_auth_mailclients.html)
- [Installing Postfix/Dovecot with SMTP-AUTH and TLS on CentOS](http://drupalab.com/blog/installing-postfix-dovecot-with-smtp-auth--tls-on-centos)
- [How to Install RoundCube](http://trac.roundcube.net/wiki/Howto_Install)
