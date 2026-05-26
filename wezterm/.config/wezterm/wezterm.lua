local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.plugin.require("https://github.com/yriveiro/wezterm-tabs").apply_to_config(config)

-- 1. Force XWayland
config.enable_wayland = false

-- Sobrescribir el comportamiento del ratón al terminar de seleccionar
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		-- Usa solo el PrimarySelection para evitar invocar el XCB del Clipboard general
		action = wezterm.action.CompleteSelection("PrimarySelection"),
	},
}

-- 2. Clean CLI
config.window_decorations = "RESIZE" -- Elimina la barra de título superior
config.hide_tab_bar_if_only_one_tab = true -- Oculta las pestañas si solo hay una abierta

-- 3. Fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

-- 4. Padding
config.window_padding = {
	left = 14,
	right = 14,
	top = 14,
	bottom = 14,
}

-- 5. Color schemes
config.color_scheme = "Catppuccin Mocha"

return config
