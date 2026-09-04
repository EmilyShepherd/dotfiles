
----------------
--- MONITORS ---
----------------

-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({
  output = "",
  mode = "5120x1440",
  position = "auto",
  scale = "auto",
})


-------------------
--- MY PROGRAMS ---
-------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"


-----------------
--- AUTOSTART ---
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("awww-daemon")

  hl.exec_cmd(terminal, {workspace = "1"})
  hl.exec_cmd(terminal, {workspace = "1"})
  hl.exec_cmd(terminal, {workspace = "1"})
  hl.exec_cmd(terminal, {workspace = "1"})
  hl.exec_cmd(terminal, {workspace = "1"})
  hl.exec_cmd(terminal, {workspace = "1"})
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-------------------
--- PERMISSIONS ---
-------------------

-- See https://wiki.hyprland.org/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- ecosystem {
--   enforce_permissions = 1
-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow
-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow


---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
  general = {
    gaps_in = 10,
    gaps_out = 5,
    border_size = 1,

    col = {
      active_border = {
        colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
        angle = 45,
      },
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,

    layout = "scrolling",
  },

  xwayland = {
    force_zero_scaling = true
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 10,
      render_power = 3,
      color = "rgba(00000088)",
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,

      vibrancy = 0.2696,
    },
  }
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.94, bezier = "almostLinear" })


hl.config({
  layout = {
    single_window_aspect_ratio = {1, 1},
  },

  dwindle = {
    preserve_split = true
  },

  scrolling = {
    column_width = 0.1666666666
    -- wrap_swapcol = false
    -- focus_fit_method = 0
  },

  -- https://wiki.hyprland.org/Configuring/Variables/-misc
  misc = {
    disable_hyprland_logo = true
  },
})

-------------
--- INPUT ---
-------------

-- https://wiki.hyprland.org/Configuring/Variables/-input
hl.config({
  input = {
    kb_layout = "gb",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = false
    }
  }
})

-------------------
--- KEYBINDINGS ---
-------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/
local mainMod = "SUPER"

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- bind = mainMod + SHIFT, left, layoutmsg, swapcol l
-- bind = mainMod + SHIFT, right, layoutmsg, swapcol r
--

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

for _, a in ipairs({ {"Raise", "+" }, {"Lower", "-"} }) do
  local key = "XF86Audio" .. a[1] .. "Volume"
  local cmd = function(options)
    options = options or ""
    return hl.dsp.exec_cmd("wpctl set-volume " .. options .. " @DEFAULT_AUDIO_SINK@ 5%" .. a[2])
  end

  hl.bind(
    key,
    cmd("-l 1"),
    { locked = true }
  )
  hl.bind(
    "SHIFT + " .. key,
    cmd()
  )
end

hl.bind("XF86AudioMute",    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 10%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

-- Pip
hl.window_rule({
  name = "pip",
  match = {
    title = "Picture-in-Picture"
  },

  float = true,
  pin = true,
  size = { 600, 388 },
  move = "20 monitor_h-window_h-20",
})

local pip = "title:Picture-in-Picture"

hl.bind(mainMod .. " + EQUAL", function()
  hl.dispatch(hl.dsp.window.resize({pip, 20, 20, true }))
  hl.dispatch(hl.dis.move({pip, 20, 20, false }))
end)

hl.bind(mainMod .. " + MINUS", function()
  hl.dispatch(hl.dsp.window.resize({pip, -20, -20, true }))
  hl.dispatch(hl.dis.move({pip, 20, 20, false }))
end)

-- Make the GIMP file selector show up as floating
hl.window_rule({
  float = true,
  match = {
    class = "file-png",
  }
})

-- Make all Steam popup windows show up as floating popups rather than tiles
-- windowrule {
--  name = steam-popups
--  match:class = steam
--  -match:title = negative:^Steam$

--  float = on
--}

-- Smart Gaps
--workspace = w[tv1]s[false], gapsout:0, gapsin:0
--workspace = f[1]s[false], gapsout:0, gapsin:0
--windowrule = border_size 0, float 0, match:workspace w[tv1]s[false]
--windowrule = rounding 0, floating:0, onworkspace:w[tv1]s[false]
--windowrule = border_size 0, float 0, match:workspace f[1]s[false]
--windowrule = rounding 0, floating:0, onworkspace:f[1]s[false]
