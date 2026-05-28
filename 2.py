# Carga de la autoconfiguración básica (ya lo hace el config.py, pero por si acaso)
# config.load_autoconfig(False)
def load(config, c):
    # Página de inicio y nueva pestaña (¡Lo que pediste antes!)
    c.url.start_pages = ["https://google.com/"]
    c.url.default_page = "https://google.com/"
    c.auto_save.session = True
    c.content.pdfjs = False

    # Privacidad
    c.content.cookies.accept = 'no-3rdparty'
    c.content.blocking.method = "both"

    # Explorer
    c.fileselect.handler = "external"
    c.fileselect.single_file.command = ['alacritty', '--class', 'Yazi-picker', '-e', 'yazi', '--chooser-file={}']
    c.fileselect.multiple_files.command = ['alacritty', '--class', 'Yazi-picker', '-e', 'yazi', '--chooser-file={}']
    c.fileselect.folder.command = ['alacritty', '--class', 'Yazi-picker', '-e', 'yazi', '--chooser-file={}']
