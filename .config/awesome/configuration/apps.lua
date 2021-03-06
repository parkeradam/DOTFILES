local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

local defaultTerminal = 'alacritty'
local defaultBrowser = 'firefox'


return {
  -- List of apps to start by default on some actions
  default = {
    terminal = defaultTerminal,
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = defaultTerminal,
    screenshot = 'flameshot full -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    delayed_screenshot = 'flameshot full -p ~/Pictures -d 5000',
    browser = 'firefox',
    editor = 'code',
    social = 'discord',
    game = rofi_command,
    files = 'nemo',
    music = rofi_command,
    system_monitor = "gnome-system-monitor"
  },


  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
     '/usr/bin/barrier',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'nitrogen --restore &', -- Wallpaper
    'setxkbmap gb',

    -- setup specifics MODIFY ME AS NEEDE
    'xrandr --output DVI-D-0 --right-of HDMI-0',
    'xrandr --output HDMI-0 --primary'
  }
}