sub wp_basics {
	
	### Only for Wordpresses
	
	## I have strange redirection issue with all WordPresses
	# Must be a problem with cookies/caching/nonce, but I don't understand how.
	# It might be somekind conflict between/from plugins too.
	# So, I'm taking a short road here
	if (
		   req.url ~ "&_wpnonce"
		|| req.url ~ "&reauth=1"
		|| req.url ~ "&redirect_to"
		|| req.url ~ "\?gf-download"
		) {
			return(pipe);
		}
	
	## admin-ajax can be a little bit faster, sometimes, but only if GET
	# This must be before passing wp-admin
	#if (req.url ~ "admin-ajax.php" && req.http.cookie !~ "wordpress_logged_in" ) {
	#	return (hash);
	#}
	
	# Some devices, mainly from Apple, send urls ending /null
	if (req.url ~ "/null$") {
		set req.url = regsub(req.url, "/null", "/");
	}
	
	## Stop behaving bad
	# I don't use Adminer any more
	#if (
	#	   req.url ~ "/adminer"
	#	|| req.http.User-Agent ~ "jetmon"
	#	|| req.http.User-Agent ~ "Jetpack by WordPress.com"
	#	) {
	#	if (
	#		   req.http.X-County-Code ~ "fi"
	#		|| req.http.x-language ~ "fi" 
	#		|| req.http.x-agent == "nice"
	#		) {
	#			return(synth(403, "Forbidden: " + req.http.X-Real-IP));
	#	} else {
	#			return(synth(666, "Forbidden: " + req.http.X-Real-IP));
	#	}
	#}
	
	## Fix Wordpress visual editor issues, must be the first one as url requests to work (well, not exacly first...)
	# Backend of Wordpress
	if (req.url ~ "^/wp-admin/") { return(pipe); }


	if (req.url ~ "/wp-(login|my-account|comments-post.php|cron)" || req.url ~ "/(login|lataus)" || req.url ~ "preview=true") {
		return(pass);
	}

	## Don't cache logged-in user, password reseting and posts behind password
	# Frontend of Wordpress
	if (req.http.cookie ~ "(wordpress_logged_in|resetpass|postpass)") {
		return(pass);
	}
	
	## I don't want to fill RAM for benefits of bots.
	# This could be more general too, or is this smart move at all?
	if (req.url ~ "^/wp-json/") {
		return(pass);
	}

	## Normalize the query arguments.
	# 'If...' structure is for Wordpress, so change/add something else when needed
	# If std.querysort is any earlier it will break things, like giving error 500 when logging out. For me anyway, but I have some other issues with logging out too.
#	if (req.url !~ "(wp-admin|wp-login|wp-json)") {
#		set req.url = std.querysort(req.url);
#	}

	## Don't cache wordpress related pages
	if (req.url ~ "(signup|activate|mail|logout)") {
		return(pass);
	}

	## Must Use plugins I reckon
	if (req.url ~ "/mu-.*") {
		return(pass);
	}

	## Hit everything else
	# I'm dealing with both, Wordpress and Woocommerce, here even I have Woocommerce spesific vcl too.
	# Again, 'tuote' is product in finnish
	if (req.url !~ "(wp-(login.php|cron.php|admin|comment)|login|cart|my-account|wc-api|checkout|addons|loggedout|lost-password|tuote)") {
		unset req.http.cookie;
	}

# Ends here
}
