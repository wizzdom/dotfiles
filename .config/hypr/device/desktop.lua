-- Device-specific config for Desktop

-- Specify GPU to use

hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")

-- Monitors

-- monitor=DP-1,2560x1440@170,878x1918,1,vrr,1
-- monitor=DP-2,1920x1080@60,2366x838,1
-- workspace=DP-1,1
-- monitor=HDMI-A-1,1920x1080@60,3438x2098,1
-- workspace=HDMI-A-1,6

-- Bind workspaces to monitors
-- main (left) monitor
for i = 1, 5 do
	hl.workspace_rule({ workspace = i, monitor = "DP-1" })
end
-- secondary (right) Monitor
for i = 6, 10 do
	hl.workspace_rule({ workspace = i, monitor = "HDMI-A-1" })
end

-- Autostart apps

hl.on("hyprland.start", function()
	-- hl.exec_cmd("$HOME/scripts/video-wall.sh") -- set video wallpaper
	hl.exec_cmd("$HOME/.azotebg-hyprland")
	hl.exec_cmd("[workspace 1 silent] zen-browser", { workspace = 1 })
	hl.exec_cmd("[workspace 10 silent] thunderbird", { workspace = 10 })
	hl.exec_cmd("jamesdsp --tray")
	hl.exec_cmd("[workspace 7 silent] vesktop", { workspace = 7 })
	hl.exec_cmd("openrgb --server")
end)
