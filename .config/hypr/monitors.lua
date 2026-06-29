------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- fallback
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- desktop
hl.monitor({
	output = "desc:HKC OVERSEAS LIMITED GN07 0000000000001",
	mode = "2560x1440@170.0",
	position = "878x1918",
	scale = 1.0,
})

hl.monitor({
	output = "desc:Samsung Electric Company C27F390 H4ZM301467",
	mode = "1920x1080@60.0",
	position = "3438x2278",
	scale = 1.0,
})

hl.monitor({
	output = "desc:HP Inc. HP 24w CNC9311TVP",
	mode = "1920x1080@60.0",
	position = "2366x838",
	scale = 1.0,
})
-- framework 13
hl.monitor({
	output = "eDP-1",
	mode = "2880x1920@120",
	position = "0x0",
	scale = 1.5,
	vrr = true,
})
