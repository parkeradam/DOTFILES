local awful = require('awful')
require('awful.autofocus')
local modkey = require('configuration.keys.mod').modKey

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'm',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),
  awful.key(
    {modkey},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  )
)

return clientKeys
