
sub this_way {
	
	##### Quite long lasting redirects. Out there MUST be easier solution. This is more or less just a nightmare.

	if (req.http.host ~ "www.katiska.eu") {
		# these come from stupid theme structure
		if (req.url ~ "^/facebook-redirect") { return(synth(701, "https://www.facebook.com/groups/katiska")); }
		elseif (req.url ~ "^/twitter-redirect") { return(synth(701, "https://twitter.com/katiskatweet")); }
		elseif (req.url ~ "^/youtube-redirect/") { return(synth(701, "https://www.youtube.com/channel/UCxHt-5Vwd8oE_cUGGQqXruw")); }
		# known links from elsewhere
		elseif (req.url ~ "^/koulutukset/sumppupro") { return(synth(701, "https://store.katiska.eu/")); }
		elseif (req.url ~ "^/kurssit/agi-faktori-i") { return(synth(701, "https://www.katiska.eu/tieto/fyysisesta-treenista/agilityn-riskit/")); }
		elseif (req.url ~ "^/kurssit/agility-ja-lihaksisto") { return(synth(701, "https://www.katiska.eu/tieto/lihaksisto-ja-luusto/agility-ja-koiran-lihaksisto/")); }
		elseif (req.url ~ "^/kurssit/allergia-pahkinankuoressa") { return(synth(701, "https://www.katiska.eu/tieto/koiran-allergia-hiiva-iho/koiran-allergia-pahkinankuoressa/")); }
		elseif (req.url ~ "^/kurssit/allergisen-koiran-eliminaatio-kaytannossa") { return(synth(701, "https://www.katiska.eu/tieto/koiran-allergia-hiiva-iho/allergisen-koiran-eliminaatio-kaytannossa/")); }
		elseif (req.url ~ "^/kurssit/ehjana-elakkeelle") { return(synth(701, "https://www.katiska.eu/tieto/fyysisesta-treenista/kilpakoira-ehjana-elakkeelle/")); }
		elseif (req.url ~ "^/kurssit/ensimmainen-koira") { return(synth(701, "https://www.katiska.eu/tieto/koira-kasvava-pentu/ikioma-ensimmainen-koira/")); }
		elseif (req.url ~ "^/kurssit/haimatulehdus") { return(synth(701, "https://www.katiska.eu/tieto/koira-sairaus-elimet/sairas-haima-koiran-haimatulehdus/")); }
		elseif (req.url ~ "^/kurssit/hiiva-ikuinen-riesa") { return(synth(701, "https://www.katiska.eu/tieto/koira-sairaus-elimet/onko-koiran-hiiva-ikuinen-riesa/")); }
		elseif (req.url ~ "^/kurssit/koiran-narastys") { return(synth(701, "https://www.katiska.eu/tieto/koira-terveys-narastys/koiran-narastys/")); }
		elseif (req.url ~ "^/kurssit/koiran-ruokinta-perusteet") { return(synth(701, "https://www.katiska.eu/tieto/ruoka/koiran-ruokinta-perusteet/")); }
		elseif (req.url ~ "^/kurssit/koiran-virtsatiekivet") { return(synth(701, "https://www.katiska.eu/tieto/koira-sairaus-elimet/koiran-virtsatiekivet/")); }
		elseif (req.url ~ "^/kurssit/kurkistus-kuivamuoniin") { return(synth(701, "https://www.katiska.eu/tieto/koira-kuivamuona-taysruoka/kurkistus-kuivamuoniin/")); }
		elseif (req.url ~ "^/kurssit/lihaa-vatsan-taydelta") { return(synth(701, "https://www.katiska.eu/tieto/koira-ruokinta-liha/koiralle-lihaa-vatsan-taydelta/")); }
		elseif (req.url ~ "^/kurssit/liikkuvan-koiran-ruokinta") { return(synth(701, "https://www.katiska.eu/tieto/liikkuvan-ruokinta-yleisesti/liikkuvan-koiran-ruokinta/")); }
		elseif (req.url ~ "^/kurssit/liikkuvan-koiran-rutiinitarkastus") { return(synth(701, "https://www.katiska.eu/tieto/lihashuolto/koiran-lihaksiston-rutiinitarkastus/")); }
		elseif (req.url ~ "^/kurssit/pennun-ruoka-ja-kasvu") { return(synth(701, "https://www.katiska.eu/tieto/koira-kasvava-pentu/pennun-ruokinta-ja-kasvu-2/")); }
		elseif (req.url ~ "^/kurssit/perustyokalut") { return(synth(701, "https://www.katiska.eu/tieto/ruoka/koiran-ruokinnan-laskeminen-perustyokalut/")); }
		elseif (req.url ~ "^/kurssit/ravintokouluttaja") { return(synth(701, "https://store.katiska.eu/tuote/ravintokouluttaja/")); }
		elseif (req.url ~ "^/kurssit/ruokinnan-idea") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/ruokinnan-idea-podcast/")); }
		elseif (req.url ~ "^/kurssit/ruuansulatuksen-perusteet") { return(synth(701, "https://www.katiska.eu/tieto/koira-sisaelimisto/koiran-ruuansulatuksen-perusteet/")); }
		elseif (req.url ~ "^/kurssit/sairas-haima") { return(synth(701, "https://www.katiska.eu/tieto/koira-sairaus-elimet/sairas-haima-koiran-haimatulehdus/")); }
		elseif (req.url ~ "^/kurssit/urheilukoirien-palauttaminen") { return(synth(701, "https://www.katiska.eu/tieto/palauttaminen/urheileva-koira-ja-palauttaminen/")); }
		elseif (req.url ~ "^/ravitsemus/hiilihydraatit-ravitsemus/wiki") { return(synth(701, "https://www.koiranravitsemus.fi/aihe/Hiilihydraatit")); }
		elseif (req.url ~ "^/ravitsemus/rasva-ravitsemus/rasva-on-aina-rasva") { return(synth(701, "https://www.katiska.eu/tieto/rasvat/rasva-ruokinnassa/")); }
		elseif (req.url ~ "^/tieto/koira-ruoka-lisaravinne/lisaravinteiden-annostus-hakemisto") { return(synth(701, "https://www.katiska.eu/tieto/lisaravinteiden-annostus/lisaravinteiden-annostus-hakemisto/")); }
		elseif (req.url ~ "^/tieto/koirat/kurssit/lihapohjainen-raakaruokinta-ja-ravintolisat") { return(synth(701, "https://www.katiska.eu/tieto/koira-ruokinta-liha/lihapohjainen-raakaruokinta-ja-ravintolisat/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/103-mahdoton-kysymys-mika-on-hyva-ruokamerkki-koiralle") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/103-mahdoton-kysymys-mika-on-hyva-ruokamerkki-koiralle/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/106-nrc-uskovaisuus") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/106-nrc-uskovaisuus/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/113-kysy-ennen-kuin-ostat") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/113-kysy-ennen-kuin-ostat/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/114-hevosmessuilla-markaa-merisuolaa") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/114-hevosmessuilla-markaa-merisuolaa/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/115-maallikon-valkoinen-takki") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/115-maallikon-valkoinen-takki/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/118-perusta-aina-ennen-nippelia") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/118-perusta-aina-ennen-nippelia/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/122-pentujen-ruokintakerrat-taas") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/122-pentujen-ruokintakerrat-taas/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/126-takakorkea-koira") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/126-takakorkea-koira/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/128-koiran-munuaisruokinta") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/128-koiran-munuaisruokinta/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/129-venla-paiva-588") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/129-venla-paiva-588/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/130-koirallani-on-venahdys-tai-revahdys") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/130-koirallani-on-venahdys-tai-revahdys/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/134-fda-ja-lihojen-jaamat") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/134-fda-ja-lihojen-jaamat/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/135-koiralle-kuiduksi-kuidunlahdetta") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/135-koiralle-kuiduksi-kuidunlahdetta/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/71-furua-ja-kepitettya-jalostusta") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/71-furua-ja-kepitettya-jalostusta/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/72-varmojen-paivien-aitiys") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/72-varmojen-paivien-aitiys/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/77-venla-paiva-9") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/77-venla-paiva-9/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/76-astmapohinaa") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/76-astmapohinaa/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/78-venla-paiva-11") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/78-venla-paiva-11/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/97-kun-minakaan-en-piittaa") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/97-kun-minakaan-en-piittaa/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/kaffepaussi-aktivoitua-pakkoliikuntaa") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/kaffepaussi-aktivoitua-pakkoliikuntaa/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/kaffepaussi-kuitua-ja-laksatiiveja") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/kaffepaussi-kuitua-ja-laksatiiveja/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/kaffepaussi-kuoleman-vastuu") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/kaffepaussi-kuoleman-vastuu/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/kolmannen-pallin-sydrooma") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/kolmannen-pallin-sydrooma/")); }
		elseif (req.url ~ "^/tieto/koirat/podcastit-vlog/venla-paiva-1") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/venla-paiva-1/")); }
		elseif (req.url ~ "^/tieto/koirat/ruokinnan-idea-podcast/10-ulkonako") { return(synth(701, "https://www.katiska.eu/tieto/ruokinnan-idea-podcast/10-ulkonako/")); }
		elseif (req.url ~ "^/tieto/koirat/ruokinnan-idea-podcast/1-intro") { return(synth(701, "https://www.katiska.eu/tieto/ruokinnan-idea-podcast/1-intro/")); }
		elseif (req.url ~ "^/tieto/koirat/ruokinnan-idea-podcast/3-ymparisto") { return(synth(701, "https://www.katiska.eu/tieto/koirat/ruokinnan-idea-podcast/3-ymparisto/")); }
		elseif (req.url ~ "^/tieto/koirat/ruokinnan-idea-podcast/9-tavat") { return(synth(701, "https://www.katiska.eu/tieto/ruokinnan-idea-podcast/9-tavat/")); }
		elseif (req.url ~ "tupakantumppeja-puutokseen") { return(synth(701, "https://www.katiska.eu/tieto/miksi-koira-syo/kylla-koira-tietaa/")); }
		# hitting really often, mostly from search engines and old links in content
		elseif (req.url ~ "/ratsastus/feed") { return(synth(701, "https://jagster.eksis.one/feed")); }
		elseif (req.http.obj ~ "^/wp-content/uploads/2014/05/F1.medium-300x222.gif") { return(synth(701, "https://cdn.katiska.eu/kb/F1.medium.jpg")); }
		elseif (req.url ~ "^/kaffepaussin-aika/$") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/")); }
		elseif (req.url ~ "^/ruokinnan-idea/feed") { return(synth(701, "https://www.katiska.eu/feed/podcast/ruokinnan-idea")); }
		elseif (req.url ~ "^/terveys/itsehoito/ensiapulaukku") { return(synth(701, "https://www.katiska.eu/tieto/itsehoito/koiran-ensiapulaukku/")); }
		elseif (req.url ~ "^/tieto/koirat/kurssit/kilpakoira-ehjana-elakkeelle") { return(synth(701, "https://www.katiska.eu/tieto/fyysisesta-treenista/kilpakoira-ehjana-elakkeelle/")); }
		elseif (req.url ~ "/ratsastus/") { return(synth(701, "https://jagster.eksis.one/")); }
		elseif (req.url ~ "^/kurssit/urheilukoiran-palauttaminen/") { return(synth(701, "https://www.katiska.eu/tieto/palauttaminen/urheileva-koira-ja-palauttaminen/")); }
		elseif (req.url ~ "mika-on-koulutus") { return(synth(701, "https://store.katiska.eu/usein-kysytyt-kysymykset/")); }
		elseif (req.url ~ "kauppa") { return(synth(701, "https://store.katiska.eu/")); }
		elseif (req.url ~ "^/koprofagia/$") { return(synth(701, "https://www.katiska.eu/tieto/koiran-suolisto-vatsa/koprofagia/")); }
		elseif (req.url ~ "^/tuote/koirien-ravintoneuvoja/") { return(synth(701, "https://store.katiska.eu/tuote/ravintokouluttaja/")); }
		elseif (req.url ~ "^/kurssit/kohti-turvallista-ja-terveellista-harrastusuraa") { return(synth(701, "https://www.katiska.eu/tieto/kouluttaminen/kohti-turvallista-ja-terveellista-harrastusuraa/")); }
		elseif (req.url ~ "^/katiska/jagster_poiminnat/cap-suhde/") { return(synth(701, "https://www.katiska.eu/tieto/kalsium/kalsium/")); }
		elseif (req.url ~ "^/ravitsemus/puutos-nakyy-ulospain-tai-sitten-ei/") { return(synth(701, "https://www.katiska.eu/ruokinta/yleista/97-kun-minakaan-en-piittaa/")); }
		elseif (req.http.obj ~ "^/wp-content/uploads/2016/03/mesokausi-248x300.jpg") { return(synth(701, "https://cdn.katiska.eu/kb/mesokausi.jpg")); }
		elseif (req.url ~ "^/koirakilpailut/racing/ruotsin-derby") { return(synth(701, "https://www.katiska.eu/tieto/greyhound-racing/ruotsin-derby-2004/")); }
		elseif (req.url ~ "^/tuote/myytinmurtajat/") { return(synth(701, "https://store.katiska.eu/tuote/myytinmurtajat/")); }
		elseif (req.url ~ "^/ruokinta/yleista/kolumni-mista-tunnet-sa-asiantuntijan/") { return(synth(701, "https://www.katiska.eu/tieto/koira-kuivamuona-taysruoka/kissanruokaa-koiralle/")); }
		elseif (req.url ~ "^/kurssit/vitami/") { return(synth(701, "https://store.katiska.eu/tuote/vitami/")); }
		elseif (req.url ~ "^/tieto/koira-ruoka-lisaravinne/kuitu-koiran-ruokinnassa/") { return(synth(701, "https://www.katiska.eu/tieto/koira-tarve-yleinen/kuitu-lihasta/")); }
		elseif (req.url ~ "^/tuote/egira/") { return(synth(701, "https://store.katiska.eu/tuote/egira/")); }
		elseif (req.url ~ "^/tuote/urheilukoiran-palauttaminen-2/") { return(synth(701, "https://www.katiska.eu/tieto/palauttaminen/urheileva-koira-ja-palauttaminen/")); }
		elseif (req.http.obj ~ "^/wp-content/uploads/2017/06/molkosan-218x300.png") { return(synth(701, "https://cdn.katiska.eu/kb/molkosan.jpg")); }
		elseif (req.url ~ "^/katiska/jagster_poiminnat/kehitys-ja-kasvuhairiot/") { return(synth(701, "https://www.katiska.eu/tieto/koira-pentu-kasvu/koiran-kehitys-ja-kasvuhairiot/")); }
		elseif (req.url ~ "^/koulutukset-2/urheilukoiran-palauttaminen-2/") { return(synth(701, "https://www.katiska.eu/tieto/palauttaminen/urheileva-koira-ja-palauttaminen/")); }
		elseif (req.url ~ "^/tuote/koiran-ravitsemuksen-abc-pennun-ruokinta/") { return(synth(701, "https://store.katiska.eu/tuote/koiran-ravitsemuksen-abc-pennun-ruokinta/")); }
		elseif (req.url ~ "^/katiska/videot/koiran-klipaaminen/") { return(synth(701, "https://www.katiska.eu/tieto/koira-turkki-iho/koiran-klippaaminen/")); }
		elseif (req.url ~ "^/terveys/itsehoito/ripulin-kotihoito-2/") { return(synth(701, "https://www.katiska.eu/tieto/koiran-suolisto-vatsa/ripulin-kotihoito/")); }
		elseif (req.url ~ "^/kaffepaussin-aika/24-halpaa-d-vitamiinia/") { return(synth(701, "https://www.katiska.eu/tieto/podcastit-vlog/24-halpaa-d-vitamiinia/")); }
		elseif (req.url ~ "^/knowledgebase/broilerin-luut/") { return(synth(701, "https://www.katiska.eu/tieto/koira-raakaruokinta-raaka-aineet/video-broilerin-luut/")); }
		elseif (req.url ~ "^/koira/luuston-kasvu/") { return(synth(701, "https://www.katiska.eu/tieto/koira-kasvava-pentu/lyhyt-oppitunti-kasvuun/")); }
		elseif (req.url ~ "^/koulutukset/raakaruokinnan-rautalankamalli/") { return(synth(701, "https://store.katiska.eu/tuote/raakaruokinnan-rautalankamalli/")); }
		elseif (req.url ~ "^/koira/munuaiset-ja-proteiini/") { return(synth(701, "https://www.katiska.eu/tieto/proteiinit/proteiini-ruokinnassa/")); }
		elseif (req.url ~ "^/ravitsemus/yliruokinnalla-laihtuu/") { return(synth(701, "https://www.katiska.eu/tieto/paino/koira-laihtuu-yliruokinnalla/")); }
		elseif (req.url ~ "^/tuote/raakaruokinnan-rautalankamalli/") { return(synth(701, "https://store.katiska.eu/tuote/raakaruokinnan-rautalankamalli/")); }
		# can be deleted someday
		elseif (req.url ~ "^/avainsana") { return(synth(701, "https://www.katiska.eu/tieto/katiskan-kaytto-sisalto/avainsanat-eli-tagit/")); }
		elseif (req.url ~ "^/aihe/") { return(synth(701, "https://foorumi.katiska.eu/")); }
		elseif (req.url ~ "^/blogi/avainsana") { return(synth(701, "https://www.katiska.eu/tieto/katiskan-kaytto-sisalto/avainsanat-eli-tagit/")); }
		elseif (req.url ~ "^/foorumit/") { return(synth(701, "https://foorumi.katiska.eu/")); }
		elseif (req.url ~ "^/keskustelu/") { return(synth(701, "https://foorumi.katiska.eu/")); }
		elseif (req.url == "^/kurssit/$") { return(synth(701, "https://www.katiska.eu/tieto/avainsana/webinaari/")); }
		elseif (req.url ~ "^/oppitunnit/") { return(synth(701, "https://pro.katiska.eu/")); }
		elseif (req.url ~ "^/sanakirja/avital-calcium") { return(synth(701, "https://www.katiska.eu/tieto/lisaravinteiden-annostus/avital-calcium/")); }
		elseif (req.url ~ "^/sanakirja/probalans-be-balans") { return(synth(701, "https://www.katiska.eu/tieto/lisaravinteiden-annostus/probalans-be-balans/")); }
		elseif (req.url ~ "^/selko/$") { return(synth(701, "https://selko.katiska.eu/")); }
		elseif (req.url ~ "supernatural-horsemanship") { return(synth(701, "https://jagster.eksis.one/supernatural-horsemanship/")); }
		elseif (req.url == "^/tieto/infokortti/") { return(synth(701, "https://www.katiska.eu/tieto/avainsana/infokortti/")); }
		elseif (req.url ~ "^/topic/") { return(synth(701, "https://foorumi.katiska.eu/")); }
	}
	
# The if the sub
}
