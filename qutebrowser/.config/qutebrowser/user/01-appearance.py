from user import catppuccin

# --- TEMA Y TRANSPARENCIA ---
def load(config, c):

    config.set("colors.webpage.darkmode.enabled", False)
    config.set('colors.webpage.bg', '#282828')
    # ... etc ...
    catppuccin.setup(c, 'frappe', True)
    # Fuentes modernas (JetBrains Mono para modo Hacker)
    c.fonts.default_family = "JetBrainsMono Nerd Font"
    c.fonts.default_size = "11pt"
