--[[--
  Use this file to specify **User** preferences.
  Review [examples](+/opt/zbstudio/cfg/user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--
editor.fontsize = 12 -- this is mapped to ide.config.editor.fontsize
editor.fontname = "Fira Mono"

styles = loadfile('cfg/tomorrow.lua')('Tomorrow')
styles.text = {bg = {158,158,158}}
