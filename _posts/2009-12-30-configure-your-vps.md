--- 
wordpress_id: 286
layout: post
title: Configure your VPS
wordpress_url: http://blog.writepermission.com/?p=286
---
<h2>Basic tools</h2>
Some basic tools will make it easy to set up your VPS, so we install them first:
<ul>
	<li>Install VIM text editor using the command:
<pre>yum install vim-minimal vim-common vim-enhanced</pre></li>
	<li>Install telnet (used to test later on) TODO:
<pre>yum install telnet</pre></li>
	<li>Install links (command line browser):
<pre>yum install links</pre></li>
	<li>Install GPG keys:
<pre>rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
rpm --import http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt</pre></li>
	<li>Install rpmforge-release package:
<pre>rpm --import http://apt.sw.be/redhat/el5/en/i386/RPMS.dag/rpmforge-release-0.3.6-1.el5.rf.i386.rpm</pre></li>

</ul>

<h2>Basic settings</h2>
Next we apply some basic settings:
<ul>
	<li>Make sure <code>/etc/hosts</code> contains the following line:
<pre>127.0.0.1 yourdomainname.tld localhost localhost.localdomain</pre></li>
	<li>Adjust <code>/etc/sysconfig/network</code> so looks like this:
<pre>NETWORKING="yes"
HOSTNAME="yourdomainname.tld"
GATEWAY="216.66.76.1"
</pre></li>
	<li>Install updates:
<pre>yum update</pre></li>
	<li>Get additional yum repositories:
<pre>wget http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm
</pre></li>
</ul>
Do a <code>reboot</code> to apply the host changes.

<h2>Apache, PHP, MySQL, phpMyAdmin</h2>
Install these packages with the following command:
<pre>yum install httpd mysql-server php php-mysql php-mbstring phpmyadmin</pre>
To enable <code>ModRewrite</code> with <code>.htaccess</code> (for user-friendly URLs):
<pre>a2enmod rewrite</pre> TODO werkt nit

<h2>Configure MySQL & phpMyAdmin</h2>
Start MySQL:
<pre>chkconfig --levels 235 mysqld on
/etc/init.d/mysqld start</pre>
Set the MySQL root password:
<pre>mysqladmin -u root password yourrootsqlpassword</pre>
Configure phpMyAdmin so Apache allows connections not just from localhost. To do this, open <code>/etc/httpd/conf.d/phpMyAdmin.conf</code> and comment out the following lines:
<pre>[...]
#<Directory /usr/share/phpMyAdmin/>
#   order deny,allow
#   deny from all
#   allow from 127.0.0.1
#</Directory>
[...]</pre>
Possibly you need to change the authentication from <code>cookie</code> to <code>http</code> in <code>/usr/share/phpmyadmin/config.inc.php</code>:
<pre>[...]
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'http';
[...]</pre>
And finally create system startup links for Apache and start it:
<pre>chkconfig --levels 235 httpd on
/etc/init.d/httpd start</pre>

<h2>FTP server</h2>
To install a FTP server daemon, run the command:
<pre>yum install pure-ftpd</pre>
And make sure it starts:
<pre>chkconfig --levels 235 pure-ftpd on
/etc/init.d/pure-ftpd start</pre>

<h2>Mail server</h2>
First we need to install and configure postfix:
<pre>yum remove sendmail
yum install postfix</pre>
This removes sendmail, because we use postfix instead.
Edit <code>/etc/postfix/main.cf</code> like this:
<pre>myhost= mail. yourdomainname.tld
mydomain = yourdomainname.tld
myorigin = $mydomain
inet_interfaces = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain</pre> TODO maybe use the postfix -e command
All the lines are already in the file you just need to uncomment them and edit <code>yourdomainname</code>.

If you want to use SMTP on a port other than 25 (I've used 26) modify <code>/etc/postfix/master.cf</code>:
<pre>#smtp      inet  n       -       n       -       -       smtpd
26         inet n       -       n       -       -       smtpd
</pre>

Next we install SASL:
<pre>yum install cyrus-sasl</pre>
Enable it by added the following lines to <code>/etc/postfix/main.cf</code>:
<pre># SASL SETTINGS
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
</pre>
To reload these setting, type:
<pre>postfix reload</pre>

Last of three, install dovecot:
<pre>yum install dovecot</pre>
Open <code>/etc/dovecot.conf</code> and the following is uncommented and modified
<pre>protocols = imap imaps pop3 pop3s
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
</pre>
<strong>Note:</strong> Be careful with the braces.

Now just start them:
<pre>chkconfig --levels 235 postfix on
/etc/init.d/postfix start
chkconfig --levels 235 dovecot on
/etc/init.d/dovecot start
</pre>

<h2>Webmail: RoundCube</h2>
Many people use SquirrelMail, but I prefer <a href="http://roundcube.net/">RoundCube</a>. To install it, follow these instructions:
Get the link from the <a href="http://roundcube.net/download">Download page</a> and type:
<pre>cd /tmp
wget https://sourceforge.net/projects/roundcubemail/files/roundcubemail/0.3-stable/roundcubemail-0.3-stable.tar.gz/download
tar -xzf roundcubemail-0.3-stable.tar.gz
mv roundcubemail-0.3-stable /usr/share/roundcube</pre>
This will download it and install it to <code>/usr/share/roundcube</code>.

Next configure Apache. Create a new file <code>/etc/httpd/conf.d/roundcube.conf</code> and place in this code:
<pre>Alias /roundcube /usr/share/roundcube
Alias /roundCube /usr/share/roundcube</pre>
And restart Apache:
<pre>/etc/init.d/httpd restart</pre>

Apply correct rights to the subdirectories <code>temp</code> and <code>logs</code>:
<pre>chown apache:apache /usr/share/roundcube/temp /usr/share/roundcube/logs
chmod 700 /usr/share/roundcube/temp /usr/share/roundcube/logs</pre>

Configure the database:
<pre>mysql --username=root --password=yourrootsqlpassword
CREATE DATABASE roundcubemail;
GRANT ALL PRIVILEGES ON roundcubemail.* TO roundcubeuser@localhost IDENTIFIED BY 'yourroundcubepass';
FLUSH PRIVILEGES;</pre>

Then start the RoundCube installer by browsing to <code>http://yourdomain.tld/roundcube/installer</code>.
On the first page, see if everything is OK, and go to next if it is.
On the next page apply the settings you like and fill in the correct database credentials.
After doing this, you'll have to save these settings to the files <code>/usr/share/roundcube/config/main.inc.php</code> <code>/usr/share/roundcube/config/db.inc.php</code>.
On the last page you can test everything - probably you'll need to push "Initialize database".

After doing this, try to login via <code>http://yourdomain.tld/roundcube</code>. If everything works disable the installer:
<pre>mv /usr/share/roundcube/installer /usr/share/roundcube/.installer
chmod 000 /usr/share/roundcube/.installer</pre>

<h2>Sources</h2>
<ul>
	<li><a href="http://www.howtoforge.com/perfect-server-centos-5.3-x86_64-ispconfig-3">The Perfect Server - CentOS 5.3 x86_64 [ISPConfig 3]</a></li>
	<li><a href="http://www.howtoforge.com/perfect_setup_centos_4.3">The Perfect Setup - CentOS 4.3 (64-bit)</a></li>
	<li><a href="http://www.mysql-apache-php.com/">Quick Linux Server Installation</a></li>
	<li><a href="http://bluhaloit.wordpress.com/2008/03/13/installing-php-52x-on-redhat-es5-centos-5-etc/">Installing PHP 5.2.x or 5.3.x on RedHat ES5, CentOS 5, etc</a></li>
	<li><a href="http://corpocrat.com/2008/07/10/setup-postfixdovecot-mailserver-for-centosrhel/">Setup Postfix/Dovecot MailServer for Centos/RHEL</a></li>
	<li><a href="http://postfix.state-of-mind.de/patrick.koetter/smtpauth/smtp_auth_mailclients.html">SMTP Authentication for Mail clients</a></li>
	<li><a href="http://drupalab.com/blog/installing-postfix-dovecot-with-smtp-auth--tls-on-centos">Installing Postfix/Dovecot with SMTP-AUTH and TLS on CentOS</a></li>
	<li><a href="http://trac.roundcube.net/wiki/Howto_Install">How to Install RoundCube</a></li>

</ul>



