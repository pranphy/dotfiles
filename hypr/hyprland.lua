-- Environment Variables
hl.exec_cmd("hyprctl setenv GTK_THEME Sweet-Dark")
hl.exec_cmd("hyprctl setenv XCURSOR_SIZE 24")
hl.exec_cmd("hyprctl setenv HYPRCURSOR_SIZE 24")

-- Autostart (hyprland.start Event Hook)
hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.monitor({ output = "eDP-1", mode = "3072x1920@60", position = "1920x0", scale = 1 })
hl.monitor({
    output = "DP-2",
    mode="highres",
    --mode = "modeline 148.50 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync",
    --mode = "modeline 138.50 1920 1968 2000 2080 1080 1083 1088 1111 +hsync -vsync",
    position = "0x0",
    scale = 1
})


hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = { enabled = true, range = 4, render_power = 3, color = 0xee1a1a1a, },
        blur = { enabled = true, size = 3, passes = 1, vibrancy  = 0.1696, },
    },

    animations = { enabled = true, },
     misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
        swallow_regex = '^(kitty)$'
    },
})

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })


-- Keybind Configuration Variables
local mainmod = "SUPER"
local terminal = "kitty"
local fileManager = "kitty -e yazi"
local menu = "dmenu-wl_run -i"

hl.bind(mainmod .. " + ALT + Q ", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Basic Bindings
hl.bind(mainmod .. " + W",hl.dsp.window.kill())
--hl.bind(mainmod .. " + ALT + Q", 'exec, ~/.local/bin/killhypr')
hl.bind(mainmod .. " + S",hl.dsp.window.float({action = "toggle" }))
hl.bind(mainmod .. " + F", hl.dsp.window.fullscreen({action="toggle"}))
hl.bind(mainmod .. " + code:34", hl.dsp.focus({workspace = "r-1"}))
hl.bind(mainmod .. " + code:35", hl.dsp.focus({workspace = "r+1"}))

---- Focus Movement (Vim Keys)
hl.bind(mainmod .. " + l",hl.dsp.focus({direction="right"}))
hl.bind(mainmod .. " + h",hl.dsp.focus({direction="left"}))
hl.bind(mainmod .. " + k",hl.dsp.focus({direction="up"}))
hl.bind(mainmod .. " + j",hl.dsp.focus({direction="down"}))

---- Workspace Switching (0-9)
for i = 1, 9 do
    hl.bind(mainmod .. " + " .. i, hl.dsp.focus({workspace = i}))
    hl.bind(mainmod .. " + SHIFT +  " .. i, hl.dsp.window.move({workspace=i,follow=true}))
end

local swipe = function()
  hl.dsp.workspace.toggle_special("magic")
  --hl.notification.create({ text = "I just swiped on my trackpad!", duration = 5000, icon = "ok" })
end

hl.gesture({ fingers = 3, direction = "up", action = swipe })

--
---- Workspace Relative Window Shifts
--hl.bind("ALT + SHIFT + L", "movetoworkspace, r+1")
--hl.bind("ALT + SHIFT + H", "movetoworkspace, r-1")

-- Special Workspaces (Scratchpad)
hl.bind(mainmod .. " + P", hl.dsp.workspace.toggle_special("magic"))
--
---- Mouse Workspaces Scroll (Using sub-options for non-standard triggers if required)
--hl.bind(mainmod .. " + mouse_down", "workspace, e+1")
--hl.bind(mainmod .. " + mouse_up", "workspace, e-1")

-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainmod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainmod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---- Manual Window Displacement Controls
--hl.bind(mainmod .. " + ALT + SHIFT + l", "movewindow, r")
--hl.bind(mainmod .. " + ALT + SHIFT + h", "movewindow, l")
--hl.bind(mainmod .. " + ALT + SHIFT + k", "movewindow, u")
--hl.bind(mainmod .. " + ALT + SHIFT + j", "movewindow, d")
--
---- Application Keybinds
hl.bind("ALT + SHIFT + P", hl.dsp.exec_cmd("passmenu"))
hl.bind("ALT + SHIFT + O", hl.dsp.exec_cmd("otpmenu"))
hl.bind(mainmod .. " + N", hl.dsp.exec_cmd("neovide"))
hl.bind(mainmod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainmod .. " + E", hl.dsp.exec_cmd( fileManager ))
hl.bind(mainmod .. " + SPACE", hl.dsp.exec_cmd( menu ))
--hl.bind("CTRL + G", 'exec, goldendict "$(wl-paste -n -p)"')
--
---- Audio & Hardware Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
--
---- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/grim/$(date +%Y)/$(date +'%Y%m%d%H%M%S.png') && notify-send 'Screenshot Saved'"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy && notify-send 'Screenshot Copied'"))

---- Floating, Sticky & System Utilities
hl.bind(mainmod .. " + SHIFT + S", hl.dsp.exec_cmd("exec, bash -lc 'hyprctl --batch \"dispatch floating enable active; dispatch pin active\"'"))
hl.bind(mainmod .. " + B", hl.dsp.exec_cmd('notify-send "$(date +\\%H:\\%M) <> $(cat /sys/class/power_supply/BAT0/capacity) $(cat /sys/class/power_supply/BAT0/status)"'))
--hl.bind(mainmod .. " + ALT + L", "exec, systemctl suspend")
--
---- Mouse Grab-Drag Binds
--hl.bindm("SHIFT + mouse:272", "movewindow")
--hl.bindm("SHIFT + mouse:273", "resizewindow")
--
---- Multi-key combination Binds (Chords / App Shortcuts)
--hl.bind("SUPER_L + SHIFT_L + F + N", "exec, firefox -p nt")
--hl.bind("SUPER_L + SHIFT_L + F + D", "exec, firefox -p default")

hl.window_rule({match={initial_class="GLWindow", initial_title="Makie"},float=true,no_initial_focus=true});

-- Fix pinentry losing focus
hl.window_rule({ match       = { class = "(pinentry-)(.*)" }, stay_focused = true, })
