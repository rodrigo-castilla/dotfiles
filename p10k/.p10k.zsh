'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # --- ELEMENTOS DEL PROMPT ---
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # --- Primera línea ---
    virtualenv            # venv
    context               # rotrex
    dir                   # ruta
    vcs                   # git
    # --- Segunda línea ---
    newline               # <--- NUEVO: Salto de línea
    prompt_char           # <--- NUEVO: Símbolo de escritura
  )
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

  # --- CONFIGURACIÓN DE 2 LÍNEAS Y CONEXIÓN (NUEVO) ---
  # Dibuja la línea que une la parte de arriba con la de abajo (en color gris oscuro)
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%240F╭─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%240F├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%240F╰─'
  
  # Añade una línea en blanco antes del prompt para que respire mejor
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # --- CONFIGURACIÓN GENERAL ---
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
  typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  # 1. Ocultar el número de versión de Python
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  # 2. Forzar a que el texto siempre sea exactamente (venv)
  typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='(venv)'

  # --- COLORES ---
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='#FF8A73'
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='#000000'
  typeset -g POWERLEVEL9K_DIR_BACKGROUND='#B0FFF8'
  typeset -g POWERLEVEL9K_DIR_FOREGROUND='#000000'

  # --- RECORTE DE RUTA (FORMA CORRECTA) ---

  # No cortar por longitud total
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=0

  # Cortar desde la izquierda (inicio de la ruta)
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_left

  # Mantener exactamente los últimos X directorios
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

  # Mostrar .../ cuando se recorte
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER='...'

  # --- SEPARADORES ---
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=' '
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=''

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
