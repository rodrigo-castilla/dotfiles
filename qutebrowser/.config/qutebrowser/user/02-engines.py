def load(config, c):
    # Definición de motores de búsqueda
    c.url.searchengines = {
        'DEFAULT':  'https://www.google.com/search?q={}',
        'gh':       'https://github.com/search?q={}',
        'aur':      'https://aur.archlinux.org/packages?K={}',
        'so':       'https://stackoverflow.com/search?q={}',
        'aw':       'https://wiki.archlinux.org/index.php?search={}',
   }
