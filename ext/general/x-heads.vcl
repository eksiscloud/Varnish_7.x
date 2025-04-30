sub headers_x {
## let's set some extra just for fun
	set resp.http.Server = "Caffeine v64.25.61";		# strange, but if backend is in Nginx this will be overdriven and showing Server: nginx
	set resp.http.Powered-By = "Tremblement de Terre";	# half cocnag, half absinthe; take it easy with that
	set resp.http.Callsign-VPS = "Single stack";
	set resp.http.Callsign-Hub = "Elizabeth";
	set resp.http.Callsign-Cache = "Vickers";
	#set resp.http.Callsign-Site = "Rasmus";
	#set resp.http.Callsign-Object = "Aapo";
	#set resp.http.Callsign-DB = "Tiitu";
	set resp.http.UX-Specialist = "Jakke Lehtonen";
	set resp.http.UX-Home = "https://www.eksis.one/";
	set resp.http.UX-Meme = "Keep calm, smoke your coffee and drink your smokes - it's just an user";
	set resp.http.UX-101 = "Good web-pages will die young";
	set resp.http.Site-Little-Code-Helper = "https://git.eksis.one/";
	set resp.http.Site-Dog-And-Food = "https://www.katiska.eu/";
	set resp.http.Site-Discussion = "https://foorumi.katiska.eu/";
	set resp.http.Clacks-Overhead = "GNU Terry Pratchett";
	set resp.http.Why-not-X-headers = "https://tools.ietf.org/html/rfc6648";
}
