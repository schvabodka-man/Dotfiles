local theme = {}

-- Default settings
theme.font = "14px monospace"
theme.fg   = "#FFFFFF"
theme.bg   = "#0e1112"

-- Genaral colours
theme.success_fg = "#64dd17"
theme.loaded_fg  = "#039be5"
theme.error_fg = "#FFFFFF"
theme.error_bg = "#ff1744"

-- Warning colours
theme.warning_fg = "#FFFFFF"
theme.warning_bg = "#ffff00"

-- Notification colours
theme.notif_fg = "#FFFFFF"
theme.notif_bg = "#0e1112"

-- Menu colours
theme.menu_fg                   = "#FFFFFF"
theme.menu_bg                   = "#0e1112"
theme.menu_selected_fg          = "#FFFFFF"
theme.menu_selected_bg          = "#757575"
theme.menu_title_bg             = "#fff"
theme.menu_primary_title_fg     = "#00c853"
theme.menu_secondary_title_fg   = "#ffea00"

theme.menu_disabled_fg = "#ff1744"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#76ff03"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#FFFFFF'
theme.proxy_active_menu_bg      = '#0e1112'
theme.proxy_inactive_menu_fg    = '#ff1744'
theme.proxy_inactive_menu_bg    = '#0e1112'

-- Statusbar specific
theme.sbar_fg         = "#FFFFFF"
theme.sbar_bg         = "#0e1112"

-- Downloadbar specific
theme.dbar_fg         = "#ffffff"
theme.dbar_bg         = "#0e1112"
theme.dbar_error_fg   = "#ff1744"

-- Input bar specific
theme.ibar_fg           = "#FFFFFF"
theme.ibar_bg           = "#0e1112"

-- Tab label
theme.tab_fg            = "#FFFFFF"
theme.tab_bg            = "#0e1112"
theme.tab_hover_bg      = "#9e9e9e"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#000000"
theme.selected_bg       = "#2196f3"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#ffff00"
theme.loading_bg        = "#0e1112"

theme.selected_private_tab_bg = "#7c4dff"
theme.private_tab_bg    = "#311b92"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#76ff03"
theme.notrust_fg        = "#ff1744"

-- General colour pairings
theme.ok = { fg = "#FFFFFF", bg = "#0e1112" }
theme.warn = { fg = "#FFFFFF", bg = "#ffff00" }
theme.error = { fg = "#FFFFFF", bg = "#ff1744" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
