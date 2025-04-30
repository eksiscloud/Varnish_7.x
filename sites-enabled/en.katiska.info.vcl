## Wordpress ##
sub vcl_recv {
  if (req.http.host == "en.katiska.eu") {
		set req.backend_hint = sites;

	## just for this virtual host
	# for stop caching uncomment
	#return(pass);
	# for dumb TCL-proxy uncomment
	#return(pipe);
		
	## Somekind backdoor for different needs
	#if (std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist) {
	#	return(pipe);
	#}

	## General rules common to every backend by common.vcl
	call common_rules;
	
	## Limit logins by country and language
	if (req.url ~ "^/wp-login.php") {
		# I'm pubishing via Ulysses app every now and then
		if (std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist) {
			return(pass);
		}
		# I have only finnish users
		#if (req.http.X-Country-Code !~ "fi" || 
		if (req.http.x-language !~ "fi") {
			return(synth(666, "Forbidden action from " + req.http.X-Real-IP));
		}
	}
	
	## cPanel (please, don't bother. You can't break my password. Really.)
	if (req.url ~ "^/hallinta") {
		return(synth(702, "https://whm47.louhi.net:2083/hallinta"));
	}

	## Wordpress REST API
	# For some reason this isn't working if in wordpress_common.vcl
	if (req.url ~ "/wp-json/wp/v2/") {
		# Whitelisted IP will pass, but only when logged in
		if (std.ip(req.http.X-Real-IP, "0.0.0.0") ~ whitelist) {
			return(pass);
		} else {
		# Must be logged in
			if (req.http.cookie !~ "wordpress_logged_in") {
				return(synth(403, "Unauthorized request"));
			}
		}
	}

	## Discourse as commenting system
#	if (req.url ~ "/wp-json/wp-discourse/v1/discourse-comments") {
#		return(pass);
#	}
	
	## Tag list 
	# Actually, tags are quite static so commented. But I'll give a bit shorter TTL later
	if (req.url ~ "^/tieto/avainsana/") {
		return(pass);
	}

	## Landing pages with form/mailing list (needs nonce)
	# I'm not sure if pass helps with nonce
	if (req.url ~ "/laskeutumissivut") {
		return(pass);
	}

	## Drops Mailster/contact form
	if (req.url ~ "/postilista") {
		return(pass);
	}

	## Pass contact form
	if (req.url ~ "/tiedustelut") {
		return(pass);
	}

	## Download manager hates caching
	if (req.url ~ "/lataus") {
		return(pipe);
	}

	## Needed for Monit
	if (req.url ~ "/pong") {
		return(pipe);
	}

	## Keep this last because wordpress_common.vcl limits more and tells cache all others etc.
	call wp_basics;

	## Let's put querystrings in the order to avoid miss because of changed order
        ## This breaks places every now and then. So if you get strange error 5xx comment this out first
	set req.url = std.querysort(req.url);

	
	## Cache all others requests if they reach this point.
	return(hash);

  # The end of host
  }
# The end of sub-vcl
}
