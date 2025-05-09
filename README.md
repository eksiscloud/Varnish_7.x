# Varnish 7.1.1

My working copy of stack Nginx+Varnish+Apache2 with several virtual hosts, bad-bot, unauth 403-urls, GeoIP etc.

if you want to use GeoIP, xtag etc you must compile Varnish addons.

Heads up - this is from live setup, so remember change at least urls. And because of same reason I have some solution that suits for me, but surely not for you.

Always be really carefully when you do copy&paste from anywhere.

## Known major issues at the moment

**4.5.2025**: WordPress admin goes into cache, and needs reloading everytime something should be done. At same time at same t.ex. automatic tag offering when editing a post doesn't work.
Use return(pipe); for important sites that needs admin often.

## The stack

The stack is:

Nginx listening 80 and 443, redirecting from 80 to 443
Nging is terminating SSL and taking care of HTTP/2
Varnish is listening port 8080
Apache2 is listening port 8282

## The setup of Varnish

default.vcl is doing general things
all-cookie.vcl is cleaning cookies etc.
all-vhost.vcl is including all virtual hosts
sites-enabled/*.vcl are the sites
ext/filtering/bad-bot.vcl is killing bots and is quite useless because Nginx is doing same thing (error 444).
ext/404.vcl is used to do some general 404- and 410 redirects (more or less just a test)
ext/403.vcl stops knockers. Be really careful if you use something like this. It is easy to stop usefull stuff too.
ext/monit.vcl is for monit and letsenctypt.vcl for Lets Encryt (it is from time I was trying Hitch; waste of time)
error/*.html are special error pages, not in use

There is another sub-vcl that isn't mentioned here. I'll add those, sometimes.

I'm using Fail2ban to ban IP of bots too. Overkill?

I've tried comment everything but all I've done are quite basic things and self explaining. Some doesn't work or do weird things.

## Limitations

Setup works when terminating of SSL (and some other stuffs) are made on Nginx/Apache2. 
It doesn't work out-of-the-box if font of Varnish is a dumb SSL/TLS-proxy, as Hitch.

There is no point what so ever use proxy unless you have thousands SSL-certificates to terminate or
you have some other needs, like load balancing. Using i.e. Hitch forcing you to do all nice things what
a webserver can really well, on Varnish. At same time you will loose easy-reading logs, but sure: you will 
learn how to use varnishlog or varnishnsca to explore basic incoming requests.

## The base

I'm using one VPS, hosting few WordPresses and one WooCommerce (default.vcl has commented parts for Gitea and Moodle, though)
* Nginx/Varnish (as a hub taking care of virtual hosts and caching; needs more RAM)
* Apache2 as backend for "ordinary" sites (needs more disk, not so much RAM, unless you have dynamic sites like e-commerces)
* do NOT try to put JS-heavy web-apps, as Discourse-forum, behind Varnish - unless there is need to do some exotic things, as load balancing.
Backends are talking to front using spesified port that is limited only for those two IP-addresses.

NOTE: if you are using Docker, it bypasses UFW and needs its own rules.

## GeoIP

I'm using GeoIP on Nginx to identify countries and telling it to Varnish. Both needs extra work when installing/setup, but it is not that hard
job - Google will help you. Mostly part of Nginx is just a relic from time when I used iptables for banning and filtering.

## War against bots

Nginx do the work and Varnish is just a backup. There is an example how to do filtering in Varnish, but it is more expensive way than than letting Nginx do the heavy lifting.

## Virtual hosts

Nginx is listening both ports, 80 and 443, and sends requests to Varnish. Varnish will then redirect port 80 to port 443. 
It would be more smarter to do on Nginx using simple rewrite, but certbot has too much issues with that.

### Certbot crashes Ngnix
```certbot renew``` can't shutdown and restart Nginx right. Certbot shall shutdown Nginx first and 
after that it tries read nginx.pid and it is not there anymore. That situation is quite common reason for crashed
Nginx because ports are in use by ghost-Nginx. Then you have to do ```killall nginx``` and after that
```systemctl restart nginx```. When you have backend on dedicated VPS, not as 127.0.0.1, you can't use
--standalone or --webroot either - you are stuck on --nginx even that is the issue.

To fix that you need to
* remove all post/pre settings if such exists (/etc/letsencrypt/cli.ini and renewal/*.host)
* upgrade certbot to version 1.x
* never use crontab to renew certificates; there is system-timer for that
* do pipe; for certbot at very early stage on default.vcl

HEADS UP: I don't think anything of that is really issue anymore. it has fixed now, I reckon.

