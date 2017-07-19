--[[--
  Use this file to specify **User** preferences.
  Review [examples](+/opt/zbstudio/cfg/user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--
editor.fontsize = 12 -- this is mapped to ide.config.editor.fontsize
editor.fontname = "Fira Mono"

editor.autoactivate = true
editor.tabwidth = 4
editor.usetabs = true

styles = loadfile('cfg/tomorrow.lua')('Molokai')
stylesoutshell = styles

excludelist = {".svn/", ".git/", ".hg/", "CVS/", "*.pyc", "*.pyo", "*.exe", "*.dll", "*.obj","*.o", "*.a", "*.lib", "*.so", "*.dylib", "*.ncb", "*.sdf", "*.suo", "*.pdb", "*.idb", ".DS_Store", "*.class", "*.psd", "*.db", "*.meta",}

keymap[ID.REDO] = "Ctrl-Shift-Z"

