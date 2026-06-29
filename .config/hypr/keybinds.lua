--[[
     __              __    _           __
    / /_____  __  __/ /_  (_)___  ____/ /____
   / //_/ _ \/ / / / __ \/ / __ \/ __  / ___/
  / ,< /  __/ /_/ / /_/ / / / / / /_/ (__  )
 /_/|_|\___/\__, /_.___/_/_/ /_/\__,_/____/
           /____/
--]]

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local browser = "zen-browser"
local terminal = "ghostty"
local fileManager = "thunar"
local noctalia = "qs -c noctalia-shell"
local menu = noctalia .. " " .. "ipc call launcher toggle"
local runMenu = noctalia .. " " .. "ipc call launcher command"
local clipboard = noctalia .. " " .. "ipc call launcher clipboard"
local emoji = noctalia .. " " .. "ipc call launcher emoji"
local sessionMenu = noctalia .. " " .. "ipc call sessionMenu toggle"
local dmenu = "$HOME/.config/noctalia/plugins/dmenu/noctalia-dmenu"
local rbwMenu = "rofi-rbw --selector " .. dmenu
local lightsOff = "hyprctl dispatch dpms toggle && openrgb -p OFF"
local wallpaperMenu = "$HOME/scripts/video-wall-select.sh"
local audioMenu = noctalia .. "ipc call volume togglePanel"

local function joinKeys(keys)
	return table.concat(keys, " + ")
end

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Q" }),
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(joinKeys({ mainMod, "Q" }), hl.dsp.exec_cmd(browser))
hl.bind(joinKeys({ mainMod, "E" }), hl.dsp.exec_cmd(fileManager))
hl.bind(joinKeys({ mainMod, "return" }), hl.dsp.exec_cmd(terminal))

hl.bind(joinKeys({ mainMod, "D" }), hl.dsp.exec_cmd(menu))
hl.bind(joinKeys({ mainMod, "R" }), hl.dsp.exec_cmd(runMenu))
hl.bind(joinKeys({ mainMod, "V" }), hl.dsp.exec_cmd(clipboard))
hl.bind(joinKeys({ mainMod, "period" }), hl.dsp.exec_cmd(emoji))
hl.bind(joinKeys({ mainMod, "SHIFT", "E" }), hl.dsp.exec_cmd(sessionMenu))
hl.bind(joinKeys({ mainMod, "P" }), hl.dsp.exec_cmd(rbwMenu))
hl.bind(joinKeys({ mainMod, "W" }), hl.dsp.exec_cmd(wallpaperMenu))
hl.bind(joinKeys({ mainMod, "M" }), hl.dsp.exec_cmd(lightsOff))
hl.bind(joinKeys({ mainMod, "M" }), hl.dsp.exec_cmd(audioMenu))

hl.bind(joinKeys({ mainMod, "F1" }), hl.dsp.exec_cmd("$HOME/.config/hypr/gamemode.sh"))

hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(joinKeys({ mainMod, "Print" }), hl.dsp.exec_cmd("$HOME/scripts/hypr-scrnshot.sh"))

hl.bind(joinKeys({ mainMod, "SHIFT", "ALT", "L" }), hl.dsp.exec_cmd("hyprlock"))

hl.bind(joinKeys({ mainMod, "SHIFT", "SPACE" }), hl.dsp.window.float({ action = "toggle" }))
hl.bind(joinKeys({ mainMod, "T" }), hl.dsp.window.pseudo())
hl.bind(joinKeys({ mainMod, "S" }), hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(joinKeys({ mainMod, "F" }), hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind(joinKeys({ mainMod, "left" }), hl.dsp.focus({ direction = "left" }))
hl.bind(joinKeys({ mainMod, "right" }), hl.dsp.focus({ direction = "right" }))
hl.bind(joinKeys({ mainMod, "up" }), hl.dsp.focus({ direction = "up" }))
hl.bind(joinKeys({ mainMod, "down" }), hl.dsp.focus({ direction = "down" }))

-- Move focus with mainMod + vim keys
hl.bind(joinKeys({ mainMod, "H" }), hl.dsp.focus({ direction = "left" }))
hl.bind(joinKeys({ mainMod, "L" }), hl.dsp.focus({ direction = "right" }))
hl.bind(joinKeys({ mainMod, "K" }), hl.dsp.focus({ direction = "up" }))
hl.bind(joinKeys({ mainMod, "J" }), hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(joinKeys({ mainMod, key }), hl.dsp.focus({ workspace = i }))
	hl.bind(joinKeys({ mainMod, "SHIFT", key }), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(joinKeys({ mainMod, "S" }), hl.dsp.workspace.toggle_special("magic"))
hl.bind(joinKeys({ mainMod, "SHIFT", "S" }), hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(joinKeys({ mainMod, "mouse_down" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(joinKeys({ mainMod, "mouse_up" }), hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(joinKeys({ mainMod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
hl.bind(joinKeys({ mainMod, "mouse:273" }), hl.dsp.window.resize(), { mouse = true })

-- Resize windows with Ctrl, mainMod + SHIFT + h/j/k/l/arrows
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "H" }),
	hl.dsp.window.resize({ x = -10, y = 0, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "J" }),
	hl.dsp.window.resize({ x = 0, y = 10, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "K" }),
	hl.dsp.window.resize({ x = 0, y = -10, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "L" }),
	hl.dsp.window.resize({ x = 10, y = 0, relative = true, repeating = true })
)

hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "left" }),
	hl.dsp.window.resize({ x = -10, y = 0, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "down" }),
	hl.dsp.window.resize({ x = 0, y = 10, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "up" }),
	hl.dsp.window.resize({ x = 0, y = -10, relative = true, repeating = true })
)
hl.bind(
	joinKeys({ mainMod, "SHIFT", "Control_L", "right" }),
	hl.dsp.window.resize({ x = 10, y = 0, relative = true, repeating = true })
)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
