-- Global variables for luakit

local globals = {
   homepage         = "https://searx.me/?results_on_new_tab=True&language=all&locale=en&disabled_plugins=&image_proxy=False&autocomplete=startpage&safesearch=0&theme=oscar&method=POST&categories=general",
   scroll_step         = 40,
   zoom_step           = 0.1,
   max_cmd_history     = 1000,
   max_srch_history    = 1000,
   default_window_size = "1600x900",
   vertical_tab_width  = 200,
   default_zoom_level  = 100,

   -- Disables loading of hostnames from /etc/hosts (for large host files)
   -- load_etc_hosts      = false,
   -- Disables checking if a filepath exists in search_open function
   -- check_filepath      = false,
   -- Specify your preferred terminal emulator
   term                = "terminator",
}

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format
globals.search_engines = {
   searx       = "https://searx.me/?results_on_new_tab=True&language=all&locale=en&disabled_plugins=&image_proxy=False&autocomplete=startpage&safesearch=0&theme=oscar&method=POST&categories=general&q=%s",
   duckduckgo  = "https://duckduckgo.com/?q=%s",
   startpage  = "https://www.startpage.com/do/dsearch?query=%s&cat=web&pl=opensearch&language=english",
   github      = "https://github.com/search?q=%s",
   google      = "https://google.com/search?q=%s",
   imdb        = "http://www.imdb.com/find?s=all&q=%s",
   wikipedia   = "https://en.wikipedia.org/wiki/Special:Search?search=%s",
   aur          = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go",
   steam          = "https://store.steampowered.com/search/?term=%s",
   itch          = "https://itch.io/search?q=%s",
   itchio          = "https://itch.io/search?q=%s",
   userstyles          = "https://userstyles.org/styles/browse?search_terms=%s",
   amazon          = "https://www.amazon.com/s/ref=nb_sb_noss?field-keywords=%s",
   amazonde          = "https://www.amazon.de/s/ref=nb_sb_noss?field-keywords=%s",
   amazonfr          = "https://www.amazon.fr/s/ref=nb_sb_noss?field-keywords=%s",
   amazonjp          = "https://www.amazon.jp/s/ref=nb_sb_noss?field-keywords=%s",
   lor          = "https://www.linux.org.ru/search.jsp?q=%s&range=ALL&interval=ALL&user=&_usertopic=on",
   linuxorgru          = "https://www.linux.org.ru/search.jsp?q=%s&range=ALL&interval=ALL&user=&_usertopic=on",
   ebay          = "https://www.ebay.com/sch/i.html?_nkw=%s",
   ebayjp          = "https://www.ebay.co.jp/sch/i.html?_nkw=%s",
   ebayde          = "https://www.ebay.de/sch/i.html?_nkw=%s",
   ebayfr          = "https://www.ebay.fr/sch/i.html?_nkw=%s",
   bandcamp          = "https://bandcamp.com/search?q=%s",
   soundcloud          = "https://soundcloud.com/search?q=%s",
   youtube          = "https://www.youtube.com/results?search_query=%s",
}

globals.search_engines.default = globals.search_engines.searx
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitWebView.html
-- https://webkitgtk.org/reference/webkit2gtk/stable/WebKitSettings.html
globals.domain_props = {
   ["all"] = {
	  -- enable_webgl            = false,
	  enable_scripts          = false,
	  enable_plugins          = false,
	  zoom_text_only          = false,
   }, 
   -- ["youtube.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["gog.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["gog.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["store.steampowered.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["steamcommunity.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["help.steampowered.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["facebook.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["bitbucket.org"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["userstyles.org"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["twitch.tv"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["ttvnw.net"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["amazon.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["amazon.de"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["amazon.co.jp"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["amazon.jp"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["amazon.fr"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["ebay.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["ebay.co.jp"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["ebay.de"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["ebay.fr"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["bandcamp.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["bcbits.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["soundcloud.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["sndcdn.com"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["boards.4chan.org"] = {
   -- 	  enable_scripts = true,
   -- },
   -- ["github.com"] = {
   -- 	  enable_scripts = true,
   -- },
}

-- Cookie acceptance policy
-- Acceptable values: "always", "never", "no_third_party"
soup.accept_policy = "no_third_party"

-- Cookie storage location
-- Remove this line or set to nil to disable cookie persistence
soup.cookies_storage = luakit.data_dir .. "/cookies.db"

return globals

-- vim: et:sw=4:ts=8:sts=4:tw=80
