----------------------------------------------------------------------------------------
-- luakit configuration file, more information at http://luakit.org/ --
----------------------------------------------------------------------------------------

require "lfs"

require "unique_instance"

-- Set the number of web processes to use. A value of 0 means 'no limit'.
luakit.process_limit = 4

-- Load library of useful functions for luakit
local lousy = require "lousy"

-- Load users global config
-- ("$XDG_CONFIG_HOME/luakit/globals.lua" or "/etc/xdg/luakit/globals.lua")
local globals = require "globals"

-- Load users theme
lousy.theme.init(lousy.util.find_config("palette.lua"))
assert(lousy.theme.get(), "failed to load theme")

-- Load users window class
-- ("$XDG_CONFIG_HOME/luakit/window.lua" or "/etc/xdg/luakit/window.lua")
local window = require "window"

-- Load users webview class
-- ("$XDG_CONFIG_HOME/luakit/webview.lua" or "/etc/xdg/luakit/webview.lua")
local webview = require "webview"

-- Add luakit;//log/ chrome page
local log_chrome = require "log_chrome"

window.add_signal("build", function (w)
					 local widgets, l, r = require "lousy.widget", w.sbar.l, w.sbar.r

					 -- Left-aligned status bar widgets
					 l.layout:pack(widgets.uri())
					 l.layout:pack(widgets.hist())
					 l.layout:pack(widgets.progress())

					 -- Right-aligned status bar widgets
					 r.layout:pack(widgets.buf())
					 r.layout:pack(log_chrome.widget())
					 r.layout:pack(widgets.ssl())
					 r.layout:pack(widgets.tabi())
					 r.layout:pack(widgets.scroll())
end)

-- Load luakit binds and modes
local modes = require "modes"
local binds = require "binds"

----------------------------------
-- Optional user script loading --
----------------------------------

-- Add adblock
local adblock = require "adblock"
local adblock_chrome = require "adblock_chrome"

local webinspector = require "webinspector"

-- Add uzbl-like form filling
local formfiller = require "formfiller"

-- Add proxy support & manager
local proxy = require "proxy"

-- Add quickmarks support & manager
local quickmarks = require "quickmarks"

-- Add session saving/loading support
local session = require "session"

-- Add command to list closed tabs & bind to open closed tabs
local undoclose = require "undoclose"

-- Add command to list tab history items
local tabhistory = require "tabhistory"

-- Add greasemonkey-like javascript userscript support
local userscripts = require "userscripts"

-- Add bookmarks support
local bookmarks = require "bookmarks"
local bookmarks_chrome = require "bookmarks_chrome"

-- Add download support
local downloads = require "downloads"
local downloads_chrome = require "downloads_chrome"

-- Add automatic PDF downloading and opening
local viewpdf = require "viewpdf"

-- Example using xdg-open for opening downloads / showing download folders
downloads.add_signal("open-file", function (file)
						luakit.spawn(string.format("xdg-open %q", file))
						return true
end)

-- Add vimperator-like link hinting & following
local follow = require "follow"

-- Add command history
local cmdhist = require "cmdhist"

-- Add search mode & binds
local search = require "search"

-- Add ordering of new tabs
local taborder = require "taborder"

-- Save web history
local history = require "history"
local history_chrome = require "history_chrome"

local help_chrome = require "help_chrome"
local introspector_chrome = require "introspector_chrome"

-- Add command completion
local completion = require "completion"

-- Press Control-E while in insert mode to edit the contents of the currently
-- focused <textarea> or <input> element, using `xdg-open`
local open_editor = require "open_editor"

-- NoScript plugin, toggle scripts and or plugins on a per-domain basis.
-- `,ts` to toggle scripts, `,tp` to toggle plugins, `,tr` to reset.
-- Remove all "enable_scripts" & "enable_plugins" lines from your
-- domain_props table (in config/globals.lua) as this module will conflict.
--require "noscript"

local follow_selected = require "follow_selected"
local go_input = require "go_input"
local go_next_prev = require "go_next_prev"
local go_up = require "go_up"

-- Filter Referer HTTP header if page domain does not match Referer domain
require_web_module("referer_control_wm")

local error_page = require "error_page"

-- Add userstyles loader
local styles = require "styles"

-- Hide scrollbars on all pages
local hide_scrollbars = require "hide_scrollbars"

-- Automatically apply per-domain webview properties
local domain_props = require "domain_props"

-- Add a stylesheet when showing images
local image_css = require "image_css"

-- Add a new tab page
local newtab_chrome = require "newtab_chrome"

-- Add tab favicons mod
local tab_favicons = require "tab_favicons"

-- Add :view-source command
local view_source = require "view_source"




-----------------------------
------- Custom funcs --------
-----------------------------
--open video in mpv
local function mpv (w) 
   local view = w.view
   local uri = view.hovered_uri or view.uri
   if uri then
	  msg.info("Opening video in mpv")
	  luakit.spawn(string.format("mpv --geometry=1280x720 %s", uri))
   end
end

local function yank(w)
   local uri = string.gsub(w.view.uri or "", " ", "%%20")
   luakit.selection.clipboard = uri
   w:notify("Copied: " .. uri)
end

--pass integration
local function pass()
   luakit.spawn('terminator -e "~/.config/fish/shortcuts/search-password.fish"')
end

-----------------------------
-------- Keybindings --------
-----------------------------
local add_binds = modes.add_binds

--unbind shit
add_binds("normal", {
			 { "j", function (w) end },
			 { "k", function (w) end },
			 { "h", function (w) end },
			 { "l", function (w) end },
			 { "^", "nil", function (w) end },
			 { "$", "nil", function (w) end },
			 { "0", "nil",function (w, m) end },
			 { "<Control-e>", function (w) end },
			 { "<Control-y>", function (w) end },
			 { "gg", "nil", function (w) end },
			 { "G", "nil", function (w) end },
			 { "%", "nil", function (w) end },
			 { "zi", function (w) end },
			 { "zo", function (w) end },
			 { "zz", function (w) end },
			 { "pp", function (w) end},
			 { "pt", function (w) end},
			 { "^pw$", function (w) end},
			 { "^PP$", function (w) end},
			 { "^PT$", function (w) end},
			 { "^PW$", function (w) end},
			 { "<Control-d>", "nil", function (w) end },
			 { "<Control-f>", function (w) end },
			 { "<Control-b>", function (w) end  },
			 { "<space>", function (w) end },
			 { "<Shift-space>",  function (w) end },
			 { "<BackSpace>", function (w) end },
			 { "<Control-Page_Up>", "nil", function (w) end },
			 { "<Control-Page_Down>", "nil", function (w) end },
			 { "<Control-Tab>", "nil", function (w) end },
			 { "<Shift-Control-Tab>", "nil", function (w) end },
			 { "<Control-t>", "nil", function (w) end },
			 { "<Control-w>", "nil", function (w) end },
			 { "d", "nil", function (w) end },
			 { "f", "nil", function (w) end },
			 { ">", "nil", function (w) end },
			 { "<", "nil", function (w) end },
			 { "<Control-o>", "nil", function (w, m) end },
			 { "<Control-i>", "nil", function (w, m) end },
			 { "y", "nil", function (w) end },
			 { "Y", "nil", function (w) end },
			 { "o", "nil", function (w) end },
			 { "t", "nil", function (w) end },
			 { "w", "nil", function (w)  end },
			 { "O", "nil", function (w) end },
			 { "T", "nil", function (w) end },
			 { "W", "nil", function (w) end },
			 { "H", "nil", function (w, m) end },
			 { "L", "nil", function (w, m) end },
			 { "gT", "nil", function (w) end },
			 { "gt", "nil", function (w) end},
			 { "g0", "nil", function (w) end },
			 { "g$", "nil", function (w) end },
			 { "^gH$", "nil", function (w) end },
			 { "^gh$", "nil", function (w) end },
			 { "^gy$", "nil", function (w) end },
			 { "r", "nil", function (w) end },
			 { "R", "nil", function (w) end },
			 { "<Control-c>", "nil", function (w) end },
			 { "<Control-R>", "nil", function (w) end },
			 { "^ZZ$", "nil", function (w) end },
			 { "^ZQ$", "nil", function (w) end },
			 { "^D$",  "nil", function (w) end },
			 { "u",  "nil", function (w) end },
			 { "<Control-z>", "nil", function (w) end },
			 { ":", "nil", function (w) end, {} },
			 { "^f$", function (w) end },
			 { "^F$", function (w) end },
			 { "^;$", function (w) end },
			 { "^g;l$", function (w) end },
			 { "^,ts$", function (w) end },
			 { "^,tp$", function (w) end },
			 { "^,tr$", function (w) end },
			 { "<F1>", "nil", function (w) end },
			 { "<F12>", "nil", function (w) end },
			 { "/", function (w) end },
			 { "?", function (w) end },
			 { "n", function (w) end },
			 { "N", function (w) end},
			 { "^;$", function (w) end },
			 { "^g;$", function (w) end },
})
add_binds("search", {
			 { "<Control-j>", function (w) end },
			 { "<Control-k>", function (w) end },
})
add_binds("follow", {
			 { "<Tab>", function (w) end },
			 { "<Shift-Tab>", function (w) end },
})


--mpv vids
add_binds("all", {
			 { "<Control-v>", "Open video in mpv.", mpv },
})
--tabs
add_binds("all", {
			 { "<Mod1-Left>", "Go to previous tab.", function (w) w:prev_tab() end },
			 { "<Mod1-Right>", "Go to next tab.", function (w) w:next_tab() end },
			 { "<Mod1-Shift-Left>", "Reorder tab left `[count=1]` positions.",
			   function (w, m)
				  w.tabs:reorder(w.view,
								 (w.tabs:current() - m.count) % w.tabs:count())
			   end, {count=1} },

			 { "<Mod1-Shift-Right>", "Reorder tab right `[count=1]` positions.",
			   function (w, m)
				  w.tabs:reorder(w.view,
								 (w.tabs:current() + m.count) % w.tabs:count())
			   end, {count=1} },
			 { "<Mod1-q>", "Close current tab.", function (w) w:close_tab() end },
			 { "<Mod1-Shift-Return>", "Open one or more URLs in a new tab.", function (w) w:enter_cmd(":tabopen ") end },
			 { "<Mod1-Control-Return>", "Open one or more URLs based on current location in a new tab.", function (w) w:enter_cmd(":tabopen " .. (w.view.uri or "")) end },
})
add_binds("normal", {{ "<Mod1-Return>", "Open a new tab.", function (w) w:new_tab("luakit://newtab/") end }})
add_binds("normal", {{ "<Control-Z>", "Reopen tab.", function (w) w:new_tab("luakit://newtab/") end }})
--history
add_binds("all", {
			 { "<Control-Left>", "Go back in the browser history.", function (w, m) w:back(m.count) end },
			 { "<Control-Right>", "Go forward in the browser history.", function (w, m) w:forward(m.count) end },
})
--m-x like emacs
add_binds("all", {{ "<Mod1-x>", "Enter `command` mode.", function (w) w:set_mode("command") end, {} }})
--yanking
add_binds("normal", {{ "<Control-u>", "Yank current URI to clipboard.", function (w) yank(w) end}})
--opening
add_binds("all", {
			 { "<Mod1-o>", "Open one or more URLs.", function (w) w:enter_cmd(":open ") end },
			 { "<Mod1-Control-o>", "Open one or more URLs based on current location.", function (w) w:enter_cmd(":open " .. (w.view.uri or "")) end },
			 { "<Mod1-Shift-o>", "Open one or more URLs.", function (w) w:enter_cmd(":tabopen ") end },
			 { "<Mod1-Control-Shift-o>", "Open one or more URLs based on current location in a new window.",function (w) w:enter_cmd(":tabopen " .. (w.view.uri or "")) end},
})
--reloading
add_binds("all", {
			 { "<Control-r>", "Reload current tab.", function (w) w:reload() end },
			 { "<Control-Shift-r>", "Reload current tab (skipping cache).", function (w) w:reload(true) end },
})
--devel
add_binds("normal", { { "<F1>", "Toggle web inspector.", function (w) w:run_cmd(":inspect!") end }})
--search
add_binds("normal", {
			 { "<Control-f>", "Search for string on current page.",
			   function (w) w:start_search("/") end },
			 { "<Control-Shift-f>", "Reverse search for string on current page.",
			   function (w) w:start_search("?") end },
})
add_binds("search", {
			 { "<Control->>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Control-<>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Control-]>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Control-[>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Control-Right>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Control-Left>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Mod1->>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Mod1-<>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Mod1-]>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Mod1-[>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Mod1-Right>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Mod1-Left>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Mod1-Down>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Mod1-Up>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
			 { "<Control-Down>", "Select next search result.", function (w)
				  w:search(w.search_state.last_search, true)
			 end },
			 { "<Control-Up>", "Select previous result.", function (w)
				  w:search(w.search_state.last_search, false)
			 end },
})
--follow mode
local function focus(w, step) --can't access shit
   local follow_wm = require_web_module("follow_wm")
   follow_wm:emit_signal(w.view, "focus", step)
end
add_binds("normal", {
			 { "<Control-g>", [[Start `follow` mode. Hint all clickable elements
        (as defined by the `follow.selectors.clickable`
            selector) and open links in the current tab.]],
			   function (w)
				  w:set_mode("follow", {
								selector = "clickable", evaluator = "click",
								func = function (s) w:emit_form_root_active_signal(s) end,
				  })
			 end },

			 -- Open new tab
			 { "<Control-Shift-g>", [[Start follow mode. Hint all links (as defined by the
            `follow.selectors.uri` selector) and open links in a new tab.]],
			   function (w)
				  w:set_mode("follow", {
								prompt = "background tab", selector = "uri", evaluator = "uri",
								func = function (uri)
								   assert(type(uri) == "string")
								   w:new_tab(uri, { switch = false, private = w.view.private })
								end
				  })
			 end },
})
add_binds("follow", {
			 { "<Control->>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Control-<>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Control-]>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Control-[>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Control-Right>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Control-Left>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Mod1->>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Mod1-<>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Mod1-]>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Mod1-[>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Mod1-Right>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Mod1-Left>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Mod1-Down>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Mod1-Up>", "Focus the previous element hint.", function (w) focus(w, -1) end },
			 { "<Control-Down>", "Focus the next element hint.", function (w) focus(w, 1) end },
			 { "<Control-Up>", "Focus the previous element hint.", function (w) focus(w, -1) end },
})


-----------------------------
-------- Commands -----------
-----------------------------
local add_cmds = modes.add_cmds
--mpv
add_cmds({
	  { ":mpv", [[Play in MPV player]], function (w) mpv(w) end },
	  { ":video", [[Play in MPV player]], function (w) mpv(w) end },
})
--pass integration
add_cmds({
	  { ":pass", [[Unix pass]], function () pass()  end },
	  { ":passwords", [[Unix pass]], function () pass()  end },
})
--yanking
add_cmds({
	  { ":yank", [[Copy url]], function (w) yank(w) end },
	  { ":url", [[Copy url]], function (w) yank(w) end },
	  { ":uri", [[Copy url]], function (w) yank(w) end },
})
--noscript
add_cmds({
	  { ":scripts-toggle", [[Toggle scripts]], function (w) w:toggle_scripts()  end },
	  { ":noscript-toggle", [[Toggle scripts]], function (w) w:toggle_scripts()  end },
	  { ":javascript-toggle", [[Toggle scripts]], function (w) w:toggle_scripts()  end },
	  { ":js-toggle", [[Toggle scripts]], function (w) w:toggle_scripts()  end },
})
--plugins
add_cmds({
	  { ":plugins-toggle", [[Toggle plugins]], function (w) w:toggle_plugins()  end },
})
-----------------------------
-- End user script loading --
-----------------------------

-- Restore last saved session
local w = (not luakit.nounique) and (session and session.restore())
if w then
   for i, uri in ipairs(uris) do
	  w:new_tab(uri, { switch = i == 1 })
   end
else
   -- Or open new window
   window.new(uris)
end

-- vim: et:sw=4:ts=8:sts=4:tw=80
