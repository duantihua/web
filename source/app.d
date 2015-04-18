import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.render!("index.dt", req);

	// Use the compatibility version for DMD < 2.064 as render()
   // suffers from DMD bugs 2962/10086/10857
	//res.renderCompat!("index.dt", HTTPServerRequest, "req")(req);
}

shared static this()
{
	auto router = new URLRouter;
	router.get("/", &index);

	auto settings = new HTTPServerSettings;
	settings.port = 8080;

	listenHTTP(settings, router);
}
