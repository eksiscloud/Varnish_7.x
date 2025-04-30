## Discourse ##
sub vcl_recv {
  if (req.http.host == "foorumi.katiska.eu") {
	set req.backend_hint = meta;

	# Your lifelines: 
	# Turn off cache
	# or make Varnish act like dumb proxy
	#return(pass);
	#return(pipe);
	
	## Stop knocking
	if (req.url ~ "(wp-login|xmlrpc).php") {
		# I'm doing this just to protect some IPs not to banned like forever
		if (
		   req.http.X-Country-Code ~ "fi"
		|| req.http.x-language ~ "fi" 
		|| req.http.x-agent == "nice"
		) {
			return(synth(403, "Forbidden request from: " + req.http.X-Real-IP));
		} else {
			return(synth(666, "Forbidden request from: " + req.http.X-Real-IP));
		}
	}

	## These will eat up working memory of Varnish really fast, if using sitewide pass instead pipe
	if (req.url ~ "(/javascripts/|/presence/)") {
		return(pipe);
	}

	## These are quite static, except sitemap, but it is just matter of TTL
	#if (req.url ~"/(robots.txt|humans.txt)") {
	#	return(hash);
	#}

	## The only things I can cache from Discourse.
	# Yes, I'm usin S3 as CDN, but loading from RAM is always faster than jumps to CDN edge.
	#if (req.url ~ "(^/uploads/|^/assets/|^/user_avatar/)") {
	#	return (hash);
	#}

	# And that's it. Nothing else. Must pipe or get error 500. And pipe means too that anything in vcl_backend_response amd vcl_delivet won't apply.
	#return(pipe);
	return(pass);
	
  #The end of the host
  }
# The end of the sub
}
