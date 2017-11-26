c.bindings.default = {}

config.bind('<Ctrl-Shift-m>', 'spawn mpv {url}')
config.bind('<Ctrl-m>', 'hint links spawn mpv {hint-url}')
config.bind('<Ctrl-Shift-p>', 'spawn zathura {url}')
config.bind('<Ctrl-p>', 'hint links spawn zathura {hint-url}')

config.bind('<Ctrl-s>', 'hint all download')
config.bind('<Ctrl-Shift-s>', 'hint links spawn uget-gtk {hint-url}')

config.bind('<Ctrl-o>', 'set-cmd-text -s :open')
config.bind('<Ctrl-Shift-o>', 'set-cmd-text -s :open -t')
config.bind('<Ctrl-Mod1-o>', 'set-cmd-text :open {url:pretty}')
config.bind('<Ctrl-Shift-Mod1-o>', 'set-cmd-text :open -t -i {url:pretty}')

config.bind('<Ctrl-f>', 'set-cmd-text /')
config.bind('<Ctrl-Shift-f>', 'set-cmd-text ?')
config.bind('<,>', 'search-prev')
config.bind('<.>', 'search-next')

config.bind('<tab>', 'enter-mode insert')
config.bind('<Ctrl-space>', 'enter-mode caret')

config.bind('<Mod1-x>', 'set-cmd-text :')

config.bind('<PgUp>', 'scroll-page 0 -0.5')
config.bind('<PgDown>', 'scroll-page 0 0.5')
config.bind('<Ctrl-PgUp>', 'scroll-page 0 -0.25')
config.bind('<Ctrl-PgDown>', 'scroll-page 0 0.25')

config.bind('<Mod1-w>', 'set-cmd-text :buffer')
config.bind('<Mod1-enter>', 'open -t')
config.bind('<Mod1-return>', 'open -t')
config.bind('<Mod1-q>', 'tab-close')
config.bind('<Mod1-Shift-q>', 'tab-close -o')
config.bind('<Mod1-r>', 'reload')
config.bind('<Mod1-Shift-r>', 'reload -f')
config.bind('<Mod1-t>', 'stop')
config.bind('<Ctrl-left>', 'back')
config.bind('<Ctrl-right>', 'forward')
config.bind('<Mod1-left>', 'tab-prev')
config.bind('<Mod1-right>', 'tab-next')
config.bind('<Mod1-Shift-left>', 'tab-move -')
config.bind('<Mod1-Shift-right>', 'tab-move +')
config.bind('<Mod1-1>', 'tab-focus 1')
config.bind('<Mod1-2>', 'tab-focus 2')
config.bind('<Mod1-3>', 'tab-focus 3')
config.bind('<Mod1-4>', 'tab-focus 4')
config.bind('<Mod1-5>', 'tab-focus 5')
config.bind('<Mod1-6>', 'tab-focus 6')
config.bind('<Mod1-7>', 'tab-focus 7')
config.bind('<Mod1-8>', 'tab-focus 8')
config.bind('<Mod1-9>', 'tab-focus 9')
config.bind('<Mod1-z>', 'undo')
config.bind('<left>', 'scroll left')
config.bind('<right>', 'scroll right')
config.bind('<up>', 'scroll up')
config.bind('<down>', 'scroll down')

config.bind('<Ctrl-g>', 'hint')
config.bind('<Ctrl-Mod1-g>', 'hint all tab-bg')
config.bind('<Ctrl-Shift-g>', 'hint all tab-fg')

config.bind('<+>', 'zoom-in')
config.bind('<->', 'zoom-out')
config.bind('<=>', 'zoom')

config.bind('<f1>', 'inspector')
config.bind('<f2>', 'view-source')

config.bind('<enter>', 'follow-selected')
config.bind('<return>', 'follow-selected')
config.bind('<Shift-enter>', 'follow-selected -t')
config.bind('<Shift-return>', 'follow-selected -t')

config.bind('<Ctrl-y>', 'hint links yank')
config.bind('<Ctrl-Shift-y>', 'yank')
config.bind('<Ctrl-Mod1-y>', 'yank title')

config.bind('<escape>', 'leave-mode', mode="hint")
config.bind('<escape>', 'leave-mode', mode="insert")
config.bind('<escape>', 'leave-mode', mode="prompt")
config.bind('<escape>', 'leave-mode', mode="caret")
config.bind('<escape>', 'leave-mode', mode="command")

config.bind('<up>', 'prompt-item-focus prev', mode='prompt')
config.bind('<down>', 'prompt-item-focus next', mode='prompt')
config.bind('y', 'prompt-accept yes', mode='prompt')
config.bind('n', 'prompt-accept no', mode='prompt')
config.bind('<return>', 'prompt-accept', mode='prompt')
config.bind('<enter>', 'prompt-accept', mode='prompt')

config.bind('<enter>', 'command-accept', mode='command')
config.bind('<return>', 'command-accept', mode='command')
config.bind('<delete>', 'completion-item-del', mode='command')
config.bind('<Ctrl-k>', 'completion-item-del', mode='command')
config.bind('<Ctrl-up>', 'command-history-prev', mode='command')
config.bind('<Ctrl-down>', 'command-history-next', mode='command')
config.bind('<up>', 'completion-item-focus prev', mode='command')
config.bind('<down>', 'completion-item-focus next', mode='command')
config.bind('<PgDown>',
            'completion-item-focus next-category', mode='command')
config.bind('<PgUp>', 'completion-item-focus prev-category', mode='command')

config.bind('<space>', 'toggle-selection', mode="caret")
config.bind('<esc>', 'drop-selection', mode="caret")
config.bind('<tab>', 'enter-mode insert', mode="caret")
config.bind('<down>', 'move-to-next-line', mode="caret")
config.bind('<up>', 'move-to-prev-line', mode="caret")
config.bind('<left>', 'move-to-prev-char', mode="caret")
config.bind('<right>', 'move-to-next-char', mode="caret")
config.bind('.', 'move-to-start-of-next-block', mode="caret")
config.bind(',', 'move-to-start-of-prev-block', mode="caret")
config.bind('<', 'move-to-end-of-prev-block', mode="caret")
config.bind('>', 'move-to-end-of-next-block', mode="caret")
config.bind('<home>', 'move-to-start-of-line', mode="caret")
config.bind('<end>', 'move-to-end-of-line', mode="caret")
config.bind('<Ctrl-end>', 'move-to-end-of-document', mode="caret")
config.bind('<Ctrl-home>', 'move-to-start-of-document', mode="caret")
config.bind('<enter>', 'yank selection', mode="caret")
config.bind('<return>', 'yank selection', mode="caret")
config.bind('<Ctrl-c>', 'yank selection', mode="caret")
config.bind('<Ctrl-left>', 'move-to-prev-word', mode="caret")
config.bind('<Ctrl-right>', 'move-to-next-word', mode="caret")
config.bind('<Ctrl-Shift-left>', 'move-to-start-of-word', mode="caret")
config.bind('<Ctrl-Shift-right>', 'move-to-end-of-word', mode="caret")
config.bind('<Shift-down>', 'scroll down', mode="caret")
config.bind('<Shift-up>', 'scroll up', mode="caret")
config.bind('<Shift-left>', 'scroll left', mode="caret")
config.bind('<Shift-right>', 'scroll right', mode="caret")

config.bind('<Ctrl-enter>', 'open-editor', mode="insert")
config.bind('<Ctrl-return>', 'open-editor', mode="insert")

c.tabs.favicons.show = True
c.auto_save.session = True
c.auto_save.interval = 5000

c.content.webgl = False
c.content.pdfjs = True
c.content.host_blocking.enabled = True
c.content.xss_auditing = True
c.scrolling.bar = False

c.content.developer_extras = True

c.downloads.remove_finished = 300
c.content.cache.maximum_pages = 100

c.content.javascript.can_access_clipboard = False
c.content.javascript.can_close_tabs = False
c.content.javascript.can_open_tabs_automatically = False
c.content.local_content_can_access_file_urls = False

c.content.user_stylesheets = ["dark.css"]

# c.editor.command = ["emacsclient -c", "{}"]
c.confirm_quit = ["downloads"]

c.aliases['javascript-toggle'] = 'config-cycle content.javascript.enabled'
c.aliases['webgl-toggle'] = 'config-cycle content.webgl'
c.aliases['pdfjs-toggle'] = 'config-cycle content.pdfjs'
c.aliases['adblock-toggle'] = 'config-cycle content.host_blocking.enabled'
c.aliases['xss-auditing-toggle'] = 'config-cycle content.xss_auditing'
c.aliases['userstyle-css-toggle'] = 'config-cycle content.user_stylesheets "dark.css" ""'
c.aliases['cookies-toggle'] = 'config-cycle content.cookies.accept no-3rdparty never'
c.aliases['cookies-store-toggle'] = 'config-cycle content.cookies.store'

c.fonts.completion.category = "11pt monospace"
c.fonts.completion.entry = "11pt monospace"
c.fonts.debug_console = "11pt monospace"
c.fonts.downloads = "11pt monospace"
c.fonts.hints = "11pt monospace"
c.fonts.keyhint = "11pt monospace"
c.fonts.messages.error = "11pt monospace"
c.fonts.messages.info = "11pt monospace"
c.fonts.messages.warning = "11pt monospace"
c.fonts.statusbar = "11pt monospace"
c.fonts.tabs = "11pt monospace"
c.fonts.monospace = "Fira Mono"

c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'

c.colors.completion.even.bg = "#0e1112"
c.colors.completion.odd.bg = "#0e1112"
c.colors.completion.category.fg = "black"
c.colors.completion.category.bg = "#00ff00"
c.colors.completion.category.border.top = "#00ff00"
c.colors.completion.category.border.bottom = c.colors.completion.category.border.top
c.colors.completion.item.selected.fg = "black"
c.colors.completion.item.selected.bg = "white"
c.colors.completion.item.selected.border.top = "white"
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top
c.colors.completion.match.fg = "red"
c.colors.completion.scrollbar.fg = "white"
c.colors.completion.scrollbar.bg = "#0e1112"
c.colors.statusbar.normal.fg = "white"
c.colors.statusbar.normal.bg = "#0e1112"
c.colors.statusbar.private.fg = "black"
c.colors.statusbar.private.bg = "white"
c.colors.statusbar.command.private.fg = "black"
c.colors.statusbar.command.private.bg = "white"
c.colors.statusbar.insert.fg = "#000000"
c.colors.statusbar.insert.bg = "#00ff00"
c.colors.statusbar.command.fg = "white"
c.colors.statusbar.command.bg = "#0e1112"
c.colors.statusbar.caret.fg = "#000000"
c.colors.statusbar.caret.bg = "purple"
c.colors.statusbar.progress.bg = "white"
c.colors.statusbar.url.fg = c.colors.statusbar.command.fg
c.colors.statusbar.url.success.http.fg = "#ffff00"
c.colors.statusbar.url.success.https.fg = "#00ff00"
c.colors.statusbar.url.error.fg = "orange"
c.colors.statusbar.url.warn.fg = "#ffff00"
c.colors.statusbar.url.hover.fg = "aqua"
c.colors.tabs.odd.fg = "white"
c.colors.tabs.odd.bg = "#0e1112"
c.colors.tabs.even.fg = "white"
c.colors.tabs.even.bg = "#0e1112"
c.colors.tabs.selected.odd.fg = "black"
c.colors.tabs.selected.odd.bg = "white"
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg
c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.bar.bg = "#0e1112"
c.colors.tabs.indicator.start = "#0000aa"
c.colors.tabs.indicator.stop = "#00aa00"
c.colors.tabs.indicator.error = "#ff0000"
c.colors.hints.fg = "black"
c.colors.hints.bg = "white"
c.colors.hints.match.fg = "red"
c.colors.downloads.bar.bg = "#0e1112"
c.colors.downloads.start.fg = "#ffffff"
c.colors.downloads.start.bg = "#0000aa"
c.colors.downloads.stop.fg = "#ffffff"
c.colors.downloads.stop.bg = "#00aa00"
c.colors.downloads.error.fg = "#ffffff"
c.colors.downloads.error.bg = "#bb0000"
c.colors.keyhint.fg = "#FFFFFF"
c.colors.keyhint.suffix.fg = "#FFFF00"
c.colors.keyhint.bg = "#bb0000"
c.colors.messages.error.fg = "white"
c.colors.messages.error.bg = "red"
c.colors.messages.error.border = "#bb0000"
c.colors.messages.warning.fg = "white"
c.colors.messages.warning.bg = "darkorange"
c.colors.messages.warning.border = "darkorange"
c.colors.messages.info.fg = "white"
c.colors.messages.info.bg = "#0e1112"
c.colors.messages.info.border = "#0e1112"
c.colors.prompts.fg = "white"
c.colors.prompts.bg = "blue"
c.colors.prompts.selected.bg = "#308cc6"

# yep lots of them are doubles
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "searx": "https://www.startpage.com/rvd/search?prf=17bd2e91c907bb6f95ed6e54877571f7?query={}",
    "startpage": "https://www.startpage.com/rvd/search?prf=17bd2e91c907bb6f95ed6e54877571f7?query={}",
    "google": "https://google.com/search?q={}",
    "bing": "https://www.bing.com/search?q={}",
    "imdb": "http://www.imdb.com/find?s=all&q={}",
    "steam": "https://store.steampowered.com/search/?term={}",
    "itch": "https://itch.io/search?q={}",
    "itchio": "https://itch.io/search?q={}",
    "itch-io": "https://itch.io/search?q={}",
    "userstyles": "https://userstyles.org/styles/browse?search_terms={}",
    "bandcamp": "https://bandcamp.com/search?q={}",
    "soundcloud": "https://soundcloud.com/search?q={}",
    "youtube": "https://hooktube.com/results?search_query={}",
    "amazon": "https://www.amazon.com/s/ref=nb_sb_noss?field-keywords={}",
    "ebay": "https://www.ebay.com/sch/i.html?_nkw={}",
    "biqle": "https://biqle.ru/video/{}",
    "piratebay": "https://thepiratebay.org/search/{}/0/99/0",
    "thepiratebay": "https://thepiratebay.org/search/{}/0/99/0",
    "lor": "https://www.linux.org.ru/search.jsp?q={}&range=ALL&interval=ALL&user=&_usertopic=on",
    "linuxorgru": "https://www.linux.org.ru/search.jsp?q={}&range=ALL&interval=ALL&user=&_usertopic=on",
    "linux-org-ru": "https://www.linux.org.ru/search.jsp?q={}&range=ALL&interval=ALL&user=&_usertopic=on",
    "aur": "https://aur.archlinux.org/packages.php?O=0&K={}&do_Search=Go",
    "copr": "https://copr.fedorainfracloud.org/coprs/fulltext/?fulltext={}",
    "archpackages": "https://www.archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "arch-packages": "https://www.archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "archpackage": "https://www.archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "arch-package": "https://www.archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "rpmfind": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "rpmpackage": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "rpmpackages": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "rpm-find": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "rpm-package": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "rpm-packages": "https://www.rpmfind.net/linux/rpm2html/search.php?query={}",
    "debian-packages": "https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords={}",
    "debianpackages": "https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords={}",
    "debian-package": "https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords={}",
    "debianpackage": "https://packages.debian.org/search?suite=default&section=all&arch=any&searchon=names&keywords={}",
    "lurk": "http://lurkmore.to/index.php?title=%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F%3ASearch&profile=default&search={}&fulltext=Search",
    "lurkmore": "http://lurkmore.to/index.php?title=%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F%3ASearch&profile=default&search={}&fulltext=Search",
    "лурк": "http://lurkmore.to/index.php?title=%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F%3ASearch&profile=default&search={}&fulltext=Search",
    "луркморье": "http://lurkmore.to/index.php?title=%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F%3ASearch&profile=default&search={}&fulltext=Search",
    "луркоморье": "http://lurkmore.to/index.php?title=%D0%A1%D0%BB%D1%83%D0%B6%D0%B5%D0%B1%D0%BD%D0%B0%D1%8F%3ASearch&profile=default&search={}&fulltext=Search"
}
