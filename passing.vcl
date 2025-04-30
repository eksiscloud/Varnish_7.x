sub fastline {


## My personal safenet moneywise when (not if...) I'll make some funny to Varnish

	if (req.http.host == "store.katiska.eu") {
                set req.backend_hint = sites;
                return(pipe);
        }

#       if (req.http.host == "www.katiska.eu") {
#                 set req.backend_hint = sites;
#                 return(pipe);
#         }

#	if (req.http.host == "selko.katiska.eu") {
#               set req.backend_hint = sites;
#               return(pipe);
#	}

#	if (req.http.host == "www.eksis.one") {
#                set req.backend_hint = sites;
#                return(pipe);
#        }

#	if (req.http.host == "dev.eksis.one") {
#                    set req.backend_hint = sites;
#                    return(pipe);
#       }

#       if (req.http.host == "jagster.eksis.one") {
#                    set req.backend_hint = sites;
#                    return(pipe);
#       }

#       if (req.http.host == "git.eksis.one") {
#               set req.backend_hint = gitea;
#               return(pipe);
#       }

       if (req.http.host == "stats.eksis.eu") {
               set req.backend_hint = sites;
               return(pipe);
       }

# The end
}
