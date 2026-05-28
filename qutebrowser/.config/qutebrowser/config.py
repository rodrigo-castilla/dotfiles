# config.py
import pkgutil
import importlib
import user  # Importamos la carpeta principal
import os
import shutil

def sync_userscripts():
    src_dir = os.path.expanduser("~/.local/bin/qutebrowser")
    dest_dir = os.path.expanduser("~/.local/share/qutebrowser/userscripts")

    if not os.path.exists(src_dir):
        return

    os.makedirs(dest_dir, exist_ok=True)

    for filename in os.listdir(src_dir):
        src_file = os.path.join(src_dir, filename)
        dest_file = os.path.join(dest_dir, filename)
        
        # Ignoramos subcarpetas, solo queremos los ejecutables
        if os.path.isfile(src_file):
            needs_update = True
            
            # Si el archivo ya está en qutebrowser, comprobamos si has compilado uno nuevo
            if os.path.exists(dest_file):
                src_mtime = os.path.getmtime(src_file)
                dest_mtime = os.path.getmtime(dest_file)
                # Si el archivo de destino es igual o más nuevo, no hacemos nada
                if dest_mtime >= src_mtime:
                    needs_update = False
            
            if needs_update:
                try:
                    # Si antes tenías un symlink roto, lo borramos primero para evitar conflictos
                    if os.path.lexists(dest_file):
                        os.remove(dest_file)
                        
                    # shutil.copy2 hace una copia física y, MUY IMPORTANTE, 
                    # preserva los permisos de ejecución (+x) del original
                    shutil.copy2(src_file, dest_file)
                except Exception:
                    pass

sync_userscripts()

config.load_autoconfig(True)
# Forzar la aceleración por hardware y rasterización
c.qt.args = ['disable-gpu-compositing']
for cargador, nombre_modulo, es_paquete in pkgutil.iter_modules(user.__path__):
    
    # Importa el módulo encontrado (ej. 'user.atajos')
    modulo = importlib.import_module(f"user.{nombre_modulo}")
    
    # Comprueba si el archivo tiene una función llamada 'cargar' y la ejecuta
    if hasattr(modulo, 'load'):
        modulo.load(config, c)
