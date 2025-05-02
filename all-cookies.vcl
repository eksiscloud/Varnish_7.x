### Common for all subdomains
##
sub vcl_recv {

	### Cookies: Varnish >6.4 (same as earlier libvmod-cookie)
	
	## Keeping needed cookies and deleting rest.
	# You don't need to hash with every cookie. You can do something like this too:
	# sub vcl_hash {
	#	hash_data(cookie.get("language"));
	# }
	# Well, filtering per sitetype is quite meaningless, though. And adds more hassling. 
	# But I'm using x-host to filter different type of sites.
	
	# Gitea (almost nothing can be cached)
#	if (req.http.host ~ "git.eksis.one") {
#		set req.http.x-host = "gitea";
#		cookie.parse(req.http.cookie);
		# https://docs.gitea.io/en-us/config-cheat-sheet/
#		cookie.keep("i_like_gitea,_csrf,redirect_to,lang,gitea_incredible,gitea_awesome");
#		set req.http.cookie = cookie.get_string();
#		cookie.keep("lang");
#		set req.http.cookie-lang = cookie.get_string();
#	}
		
	# Matomo (no point to cache what so ever)
#	elseif 
	if (req.http.host ~ "stats.eksis.eu") {
		set req.http.x-host = "matomo";
		cookie.parse(req.http.cookie);
		cookie.keep("piwik_,MATOMO_");
		set req.http.cookie = cookie.get_string();
	}
	
	# Everything else must be pure WordPress/WooCommerce
	else {
		set req.http.x-host = "wordpress";
		cookie.parse(req.http.cookie);
		# I'm deleting test_cookie because 'wordpress_' acts like wildcard, I reckon
		# But why _pk_ cookies passes?
		cookie.delete("wordpress_test_Cookie,_pk_");
		cookie.keep("wordpress_,wp-settings,_wp-session,wordpress_logged_in_,resetpass,woocommerce_cart_hash,woocommerce_items_in_cart,wp_woocommerce_session_");
		set req.http.cookie = cookie.get_string();
	}

	# Don' let empty cookies travel any further
	if (req.http.cookie == "") {
		unset req.http.cookie;
	}

	## Now we do everything per domains which are declared in all-vhost.vcl
}
