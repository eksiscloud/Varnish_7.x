sub diagnose {
	## HIT & MISS
	if (obj.hits > 0) {
		# I don't fancy boring hit/miss announcements
		set resp.http.You-had-only-one-job = "Success";
	} else {
		set resp.http.You-had-only-one-job = "Phew";
	}

	## Show hit counts (per objecthead)
	# Same here, something like X-total-hits is just boring
	if (obj.hits > 0) {
		set resp.http.Footprint-of-CO2 = (obj.hits) + " metric-tons";
	} else {
		set resp.http.Footprint-of-CO2 = "Greenwash in progress";
	}

	## How much there is RAM in use and free to use
	set resp.http.Workload = (storage.s0.free_space) + " happy minions";
	#set resp.http.Workload = std.tostring(std.round((storage.s0.free_space / (8 * 1073741824)) * 100)) + " %";
	set resp.http.Size-of-Universum = (storage.s0.used_space) + " parsek";
	#set resp.http.Workload = std.f2s(storage.s0.used_space / 1048576, 2) + " megaparsek";
	

	## I'd like to know, sometimes, if Varnish is using streaming
	if (resp.is_streaming == false) {
		set resp.http.StreamingWars = "ep.1";
	} elseif (resp.is_streaming == true) {
		set resp.http.StreamingWars = "ep.2";
	} else {
		set resp.http.StreamingWars = "South Park? No thanks :(";
	}

	## Using ETAG (content based) by backend is more accurate than Last-Modified (time based), 
	# but I want to get last-modified because I'm curious, even curiosity kills the cat
	set resp.http.Modified = resp.http.Last-Modified;
	unset resp.http.Last-Modified;
	
	## Just to be sure who is seeing what
	if (req.http.x-bot) {
		set resp.http.debug = req.http.x-bot;
	}

	## Let's find out IPs that PROXY should deliver; Nginx can't PROXY, though
	#set resp.http.client = client.ip;
	#set resp.http.server = server.ip;
	#set resp.http.remote = remote.ip;
	#set resp.http.local = local.ip;

# Ends here
}
