sub common_rules {
	### These are common to every virtual hosts
	
	## Who can do BAN, PURGE and REFRESH and how
	# Remember to use capitals when doing, size matters...
	
	if (req.method == "BAN|PURGE|REFRESH") {
               if (std.ip(req.http.X-Real-IP, "0.0.0.0") !~ whitelist) {
                       return (synth(405, "Banning/purging not allowed for " + req.http.X-Real-IP));
		}
		
		# BAN needs a pattern:
		# curl -X BAN -H "X-Ban-Request:^/contact" "www.example.com"
		# varnishadm ban obj.http.Content-Type ~ ^image/
		if (req.method == "BAN") {
			if(!req.http.x-ban-request) {
				return(synth(400,"Missing x-ban header"));
			}
			ban("req.url ~ " 
			+ req.http.x-ban-request
			+ " && req.http.host == " 
			+ req.http.host);
				# Throw a synthetic page so the request won't go to the backend
				return (synth(200,"Ban added"));
		}
	
		# soft/hard purge
#		if (req.method == "PURGE") {
#			if(!req.http.x-xkey-purge) {
#				return(hash);
#			}
#			set req.http.x-purges = xkey.purge(req.http.x-xkey-purge);
#			if (std.integer(req.http.x-purges,0) != 0) {
#				return(synth(200, req.http.x-purges + " objects purged"));
#			} else {
#				return(synth(404, "Key not found"));
#			}
#		}
		
		# Hit-always-miss - Old content will be updated with fresh one.
		if (req.method == "REFRESH") {
			set req.method = "GET";
			set req.hash_always_miss = true;
		}
	}
	
	# This just an example how to ban objects or purge all when country codes come from backend
	#if (req.method == "PURGE") {
	#	if (!std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist) {
	#		return (synth(405, "Purging not allowed for " + req.http.X-Real-IP));
	#	}
		# Backend gave X-Country-Code to indicate clearing of specific geo-variation
	#	if (req.http.X-Country-Code) {
	#		set req.method = "GET";
	#		set req.hash_always_miss = true;
	#	} else {
			# clear all geo-variants of this page
	#		return (purge);
	#		}
	#	} else {
	#		set req.http.X-Country-Code = country.lookup("country/iso_code", std.ip(req.http.X-Real-IP, "0.0.0.0"));
	#		set req.http.X-Country-Code = std.tolower(req.http.X-Country-Code);    
	#		if (req.http.X-Country-Code !~ "(fi|se)") {
	#			set req.http.X-Country-Code = "fi";
	#	}
	#}
	
	## Only deal with "normal" types
	# In-build rules. Those aren't needed, unless return(...) forces skip it.
	# Heads up! BAN/PURGE/REFRESH must be done before this or declared here. Unless those don't work when purging or banning.
	#if (req.method != "GET" &&
	#req.method != "HEAD" &&
	#req.method != "PUT" &&
	#req.method != "POST" &&
	#req.method != "TRACE" &&
	#req.method != "OPTIONS" &&
	#req.method != "PATCH" &&
	#req.method != "DELETE"
	#) {
	## Non-RFC2616 or CONNECT which is weird.
	## Why send the packet upstream, while the visitor is using a non-valid HTTP method?
	#	return(synth(405, "Non-valid HTTP method!"));
	#}
	
	## CSP logs
	# This is actually not needed, because the url needs authorization when requested from web (well, my system wants)
	# I did this just to get good night sleep
	if (req.url ~ "^/_csp") {
		if (std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist) {
			return(pass);
		} else {
			return(synth(403, "Not allowed"));
		}
	}
	
	## Auth requests shall be passed
	# In-build rule. doesn't needed here.
	if (req.http.Authorization || req.http.Cookie) {
		return(pass);
	}
	
	## Do not cache AJAX requests.
	if (req.http.X-Requested-With == "XMLHttpRequest") {
		return(pass);
	}
	
	## Only GET and HEAD are cacheable methods AFAIK
	# In-build rule, doesn't needed here
	#if (req.method != "GET" && req.method != "HEAD") {
	#	return(pass);
	#}
	
	## Enable smart refreshing, aka. ctrl+F5 will flush that page
	# Remember your header Cache-Control must be set something else than no-cache
	# Otherwise everything will miss
#	if (req.http.Cache-Control ~ "no-cache" && (std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist)) {
#		set req.hash_always_miss = true;
#	}

	# if there’s no Range header we like, use "0-" which means "from the 0-th byte till the end"
#	if (req.http.Range ~ "bytes=") {
#		set req.http.x-range = "req.http.Range";
#	} else {
#		set req.http.x-range = "bytes=0-";
#	}
	
	## Page that Monit will ping
	# Change this URL to something that will NEVER be a real URL for the hosted site, it will be effectively inaccessible.
	# 200 OK is same as pass
	if (req.url == "^/monit-zxcvb") {
		return(synth(200, "OK"));
	}
	
	## Adsense incomings are lower when Varnish is on, trying to solve out this
	# is it because of caching or CSP-rules?
	if (req.url ~ "adsbygoogle") {
		return(pass);
	}

	## 410 Gone redirects by 410sites.vcl
#	call all_gone;
	
	## Steady and easy 301 redirections by 301sites.vcl
#	call this_way;
	
	## Global handling of 404 and 410 from 404.vcl
#	call global-redirect;
	
	## Passing UA tech
#	if (req.http.x-bot == "tech") {
#		return(pass);
#	}

	## Implementing websocket support
	if (req.http.Upgrade ~ "(?i)websocket") {
		return(pipe);
	}

	## Cache warmup
	# wget --spider -o wget.log -e robots=off -r -l 5 -p -S -T3 --header="X-Bypass-Cache: 1" --header="User-Agent:CacheWarmer" -H --domains=example.com --show-progress www.example.com
	# It saves a lot of directories, so think where you are before launching it... A protip: /tmp
	if (req.http.X-Bypass-Cache == "1" && req.http.User-Agent == "CacheWarmer") {
		return(pass);
	}
	
	## Large static files are delivered directly to the end-user without waiting for Varnish to fully read the file first.
	# The job will be done at vcl_backend_response
	# But is this really needed nowadays?
	if (req.url ~ "^[^?]*\.(avi|mkv|mov|mp3|mp4|mpeg|mpg|ogg|ogm|wav)(\?.*)?$") {
		unset req.http.cookie;
		return(hash);
	}

	## Cache all static files by Removing all Cookies for static files
	# Remember, do you really need to cache static files that don't cause load? Only if you have memory left.
	# Here I decide to cache these static files. I exclude images because they are handled by the CDN.
	if (req.url ~ "^[^?]*\.(7z|bmp|bz2|css|csv|doc|docx|eot|flac|flv|gz|ico|js|otf|pdf|ppt|pptx|rtf|svg|swf|tar|tbz|tgz|ttf|txt|txz|webm|woff|woff2|xls|xlsx|xml|xz|zip)(\?.*)?$") {
		unset req.http.cookie;
		return(hash);
	}
	
	## Let's clean User-Agent, just to be on safe side
	# It will come back at vcl_hash, but without separate cache
	# I want send User-Agent to backend because that is the only way to show who is actually getting error 404; I don't serve bots other nice ones 
	# and 404 from real users must fix right away
	set req.http.x-agent = req.http.User-Agent;
	if (req.http.x-bot !~ "(nice|tech|bad|visitor)") { set req.http.x-bot = "visitor"; }
	unset req.http.User-Agent;
	
# The end
}
