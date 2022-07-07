Dotfiles 2.0

Run command

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply arozmarin


When install stacline


echo 'stackline = require "stackline"' >> ~/.hammerspoon/init.lua
echo 'stackline:init()' >> ~/.hammerspoon/init.lua

Run in Hammerspoon CLI
hs -c "stackline.config:toggle('appearance.showIcons')"
hs.ipc.cliInstall()

hs  #check if hs is running in terminal

