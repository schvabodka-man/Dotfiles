#!/usr/bin/fish
builtin cd ~/.IntelliJIdea*
builtin cd config/plugins
wget https://github.com/hsz/idea-gitignore/releases/download/v2.0.0-rc.1/idea-gitignore-2.0.0-rc.1.zip
unzip idea-gitignore-2.0.0-rc.1.zip
rm idea-gitignore-2.0.0-rc.1.zip
wget https://plugins.jetbrains.com/plugin/download?updateId=36992
