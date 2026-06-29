-- device-specific configs for laptop

-- Monitors
-- monitor=eDP-1,2880x1920@120,0x0,1.25
-- workspace=eDP-1,1
-- # to mirror internal display and external HDMI:
-- monitor=HDMI-A-1,preferred,auto,1,mirror,eDP-1
--
for i = 1, 10 do
	hl.workspace_rule({ workspace = i, monitor = "eDP-1" })
end

hl.monitor({
	output = "HDMI-A-1",
	mirror = "eDP-1",
	mode = "preferred",
})
--
-- exec-once=$HOME/.azotebg-hyprland # set wallpaper
hl.on("hyprland.start", function()
	hl.exec_cmd("$HOME/.azotebg-hyprland")
end)
